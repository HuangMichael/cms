/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */

var recordId = null;
$(function () {

    dataTableName = "#eqClassListTable";
    docName = "设备分类";
    mainObject = "eqClass";

    formName = "#form";
    var searchVue = new Vue({
        el: "#searchBox"
    });


    var validateOptions = {
        message: '数据无效 ',
        fields: {
            "className": {
                message: '分类名称无效',
                validators: {
                    notEmpty: {
                        message: '分类名称不能为空'
                    }
                }
            },
            "classLevel": {
                message: '分类级别无效',
                validators: {
                    notEmpty: {
                        message: '分类级别不能为空'
                    }
                }
            },
            "status": {
                message: "分类状态无效",
                validators: {
                    notEmpty: {
                        message: '分类状态不能为空'
                    }
                }
            },
        }
    };


    searchModel = [
        {"param": "name", "paramDesc": "分类名称"},
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
            "addUnit": function (column, row) {
                recordId = row.id;
                return "<button type='button' class='btn btn-xs btn-default command-link' data-row-id='" + row.id + "' onclick='addUnit(" + row.id + ")'><span class='fa fa-link'></span></button> "
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
            showYes: {
                to: showYes
            }
        }
    });


    $("#searchBtn").trigger("click");


    vdm = new Vue({
        el: formName,
        data: {
            "eqClass": null
        }
    });
    // initSelect();
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
    vdm.$set("eqClass", object);
    $("#editModal").modal("show");
}

/**
 * 编辑记录
 */
function add() {
    vdm.$set("eqClass", null);
    $("#editModal").modal("show");
}


/**
 * 添加外委单位
 */
function addUnit() {
    $("#eqClassModal").modal("show");
}

