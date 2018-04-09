/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */


$(function () {


//导出必须配置的两个量
    dataTableName = "#templateListTable";
    docName = "模板配置";
    mainObject = "template";
    var recordId = null;

    var searchVue = new Vue({
        el: "#searchBox"
    });

    searchModel = [
        {"param": "templateName", "paramDesc": "模板描述"},

        {"param": "status", "paramDesc": "状态"}
    ];
    var grid = $(dataTableName).bootgrid({
        selection: true,
        ajax: true,
        post: function () {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "/" + mainObject + "/data",
        formatters: {
            "commands": function (column, row) {
                return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-pencil\"></span></button> " +
                    "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"fa fa-trash-o\"></span></button>";
            }
        },
        converters: {
            showStatus: {
                to: function (value) {
                    return (value) ? "有效" : "无效";
                }
            }

        }
    }).on("loaded.rs.jquery.bootgrid", function () {
        /* Executes after data is loaded and rendered */
        grid.find(".command-edit").on("click", function (e) {
            edit($(this).data("row-id"));
        }).end().find(".command-delete").on("click", function (e) {
            del($(this).data("row-id"));
        }).end().find(".command-upload").on("click", function (e) {
            recordId = $(this).data("row-id");
            showUpload();
        });
    });


    $("#searchBtn").trigger("click");


    formName = "#form";

    vdm = new Vue({
        el: formName,
        data: {
            template: null,
        }
    });


    $("#dropZone").dropzone({
        url: "/template/upload",
        addRemoveLinks: true,
        dictRemoveLinks: "移除文件",
        dictCancelUpload: "取消上传",
        maxFiles: 3,
        maxFilesize: 5,
        autoProcessQueue: true,
        acceptedFiles: ".jpg,.png",
        init: function () {
            this.on("success", function (file, data) {
                //上传完成后触发的方法
                if (data.result) {
                    $("#uploadModal").modal("hide");

                    $(dataTableName).bootgrid("reload");
                    showMessageBox("info", data["resultDesc"]);
                } else {
                    showMessageBox("danger", data["resultDesc"]);
                }
            });
            this.on('sending', function (file, xhr, formData) {
                //传递参数时在sending事件中formData，需要在前端代码加enctype="multipart/form-data"属性
                formData.append("mainObject", mainObject);
                formData.append("recordId", recordId);
            });
            this.on("removedfile", function (file) {
                console.log("File " + file.name + "removed");
            });
        }
    });


});


/**
 * 删除记录
 */
function del(id) {

    var url = getMainObject() + "/delete/" + id;
    if (id) {
        bootbox.confirm({
            message: "确定要删除该记录么？",
            buttons: {
                confirm: {
                    label: '确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: "GET",
                        url: url,
                        success: function (msg) {
                            if (msg) {
                                showMessageBox("info", "记录删除成功！");
                                $(dataTableName).bootgrid("reload");
                            }
                        },
                        error: function (msg) {
                            showMessageBox("danger", "对不起，数据有关联，不能删除！ ");
                        }
                    });
                }
            }
        });
    }
}


/**
 * 删除记录
 */
function edit(id) {
    var object = findByIdAndObjectName(id, mainObject);

    console.log("member-----------------------" + JSON.stringify(object));
    vdm.$set("template", object);
    $("#editModal").modal("show");
}


/**
 * 显示上传下载
 */
function showUpload() {
    $("#uploadModal").modal("show");
}

/**
 * 新建记录
 */
function add() {
    vdm.$set("template", null);
    $("#editModal").modal("show");
}