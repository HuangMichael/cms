/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */
var tableConfigs = [];

$(function () {


    dataTableName = "#appListTable";
    docName = "位置信息";
    mainObject = "app";
    formName = "#form";
    var validateOptions = null;


    var searchVue = new Vue({
        el: "#searchBox"
    });

    searchModel = [
        {"param": "name", "paramDesc": "应用名称"},
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
            "genApp": function (column, row) {
                return "<button type='button' class='btn btn-xs btn-default command-plus' data-row-id='" + row.id + "' onclick='genApp(" + row.id + ")'><span class='fa fa-plus-circle'></span></button> "
            },
            "commands": function (column, row) {
                return "<button type='button' class='btn btn-xs btn-default command-edit' data-row-id='" + row.id + "' onclick='edit(" + row.id + ")'><span class='fa fa-pencil'></span></button> " +
                    "<button type='button' class='btn btn-xs btn-default command-delete' data-row-id='" + row.id + "' onclick='del(" + row.id + ")'><span class='fa fa-trash-o'></span></button>";
            }
        },
        converters: {
            showStatus: {
                to: showStatus
            },
            showTableName: {
                to: showTableName
            }

        }
    })


    $("#searchBtn").trigger("click");


    vdm = new Vue({
        el: formName,
        data: {
            app: null,
            tableConfigs: []

        }
    });
    initSelect();

    validateForm.call(validateOptions);

    tableConfigs = findListByUrl("/tableConfig/findAll");
});


/**
 * 删除记录
 * @param id
 */
function del(id) {

    var url = getMainObject() + "/delete/" + id;
    if (id) {
        bootbox.confirm({
            message: "确定删除该记录么",
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
                                showMessageBox("info", "记录删除成功!");
                                $(dataTableName).bootgrid("reload");
                            }
                        },
                        error: function (msg) {
                            showMessageBox("danger", "记录删除失败!");
                        }
                    });
                }
            }
        });
    }
}


/**
 * 编辑记录
 */
function edit(id) {

    var object = findByIdAndObjectName(id, mainObject);
    vdm.$set("app", object);
    vdm.$set("tableConfigs", tableConfigs);
    $("#editModal").modal("show");
}


/**
 * 编辑记录
 */
function add() {
    console.log("tableConfigs------------" + JSON.stringify(tableConfigs));
    vdm.$set("tableConfigs", tableConfigs);
    vdm.$set("app", null);
    $("#editModal").modal("show");
}


/**
 *生成app
 */
function genApp(recordId) {
    var url = "/app/autoCode";
    var data = {
        appId: recordId
    };
    $.post(url, data, function (data) {
        showMessage(data.result, data["resultDesc"]);
    })

}

