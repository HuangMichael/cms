/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */

var recordId = null;
$(function () {


//导出必须配置的两个量
    dataTableName = "#roleListTable";
    docName = "角色信息";
    mainObject = "role";
    formName = "#form";


    var searchVue = new Vue({
        el: "#searchBox"
    });


    var validateOptions = {};


    searchModel = [
        {"param": "roleName", "paramDesc": "名称"},
        {"param": "roleDesc", "paramDesc": "角色描述"},
        {"param": "status", "paramDesc": "状态"}
    ];


    var grid = $(dataTableName).bootgrid({
        selection: true,
        multiSelect: true,
        ajax: true,
        post: function () {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "/" + mainObject + "/data",
        formatters: {
            "addUser": function (column, row) {
                recordId = row.id;
                return "<button type='button' class='btn btn-xs btn-default command-plus' data-row-id='" + row.id + "' onclick='addUsers(" + row.id + ")'><span class='fa fa-plus'></span></button> "
            },
            "commands": showCommandsBtn
        },
        converters: {
            showStatus: {
                to: showStatus
            }
        }
    })


    $("#searchBtn").trigger("click");


    vdm = new Vue({
        el: formName,
        data: {
            "role": null
        }
    });

    validateForm.call(validateOptions);


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
                                showMessage(msg.result, msg["resultDesc"]);
                                $(dataTableName).bootgrid("reload");
                            }
                        },
                        error: function (msg) {
                            showMessage(msg.result, msg["resultDesc"]);
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
    vdm.$set("role", object);
    $("#editModal").modal("show");
}


/**
 * 编辑记录
 */
function add() {
    vdm.$set("role", null);
    $("#editModal").modal("show");
}

/**
 * 添加用户
 */
function addUsers() {
    $("#usersModal").modal("show");
}

