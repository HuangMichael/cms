/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */
$(function () {
//导出必须配置的两个量
    dataTableName = "#tableConfigListTable";
    docName = "数据表配置";
    mainObject = "tableConfig";
    formName = "#form";
    var recordId = null;

    var searchVue = new Vue({
        el: "#searchBox"
    });

    searchModel = [
        {"param": "tableName", "paramDesc": "表描述"},

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
            "formatConfig": function (column, row) {
                return "<button type='button' class='btn btn-xs btn-default command-wrench' data-row-id='" + row.id + "' onclick='formatConfig(" + row.id + ")'><span class='fa fa-wrench'></span></button> "
            },
            "commands": function (column, row) {
                return "<button type='button' class='btn btn-xs btn-default command-edit' data-row-id='" + row.id + "'><span class='fa fa-pencil'></span></button> " +
                    "<button type='button' class='btn btn-xs btn-default command-delete' data-row-id='" + row.id + "'><span class='fa fa-trash-o'></span></button>";
            }
        },
        converters: {
            showStatus: {
                to: showStatus
            },
            showYes: {
                to: showYes
            },
            showTableName: {
                to: showTableName
            }
        }
    });

    initSelect();


    $("#searchBtn").trigger("click");

    vdm = new Vue({
        el: formName,
        data: {
            tableConfig: null,
        }
    });


    validateForm.call();
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
    vdm.$set(mainObject, object);
    $("#editModal").modal("show");
}


/**
 * 显示上传下载
 */
function showUpload() {
    $("#uploadModal").modal("show");
}


/**
 * 格式化表配置信息
 * @param id
 */
function formatConfig(id) {
    var url = "/tableConfig/formatConfig/" + id;
    $.getJSON(url, function (data) {
        showMessage(data["result"], data["resultDesc"]);
    })
}


/**
 * 编辑记录
 */
function add() {
    vdm.$set("tableConfig", null);
    $("#editModal").modal("show");
}