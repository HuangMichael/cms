/**
 * Created by huangbin on 2016/11/2.

 */


$(function () {


    //导出必须配置的两个量
    dataTableName = "#siteListTable";
    docName = "站点信息";
    mainObject = "site";


    var searchVue = new Vue({
        el: "#searchBox"
    });

    searchModel = [
        {"param": "name", "paramDesc": "站点名称"}
    ];


    vdm = new Vue({
        el: "#form",
        data: {
            site: null
        }
    });


    var grid = $(dataTableName).bootgrid({
        ajax: true,
        selection: true,
        multiSelect: true,
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
            datetime: {
                to: function (value) {
                    return transformYMD(value);
                }
            },
            showStatus: {
                to: function (value) {
                    return value == '1' ? "启用" : "禁用";
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
            alert("You pressed upload on row: " + $(this).data("row-id"));
        });
    });

    $("#searchBtn").trigger("click");

    validateForm.call(null);


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
    vdm.$set("site", object);
    $("#editModal").modal("show");
}


/**
 * 新建记录
 */
function add() {
    // var object = findByIdAndObjectName(id, mainObject);
    vdm.$set("site", null);
    $("#editModal").modal("show");
}