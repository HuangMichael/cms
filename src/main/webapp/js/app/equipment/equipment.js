/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */


var rowId = null;
$(function () {
    dataTableName = "#equipmentListTable";
    docName = "设备信息";
    mainObject = "equipment";


    var searchVue = new Vue({
        el: "#searchBox"
    });


    var validateOptions = {
        message: ' ',
        fields: {
            "description": {
                message: '设备描述无效',
                validators: {
                    notEmpty: {
                        message: '设备描述不能为空'
                    }
                }
            },
            "status": {
                message: '状态不能为空',
                validators: {
                    notEmpty: {
                        message: '状态不能为空'
                    }
                }
            },
        }
    };


    searchModel = [
        {"param": "location", "paramDesc": "位置"},
        {"param": "description", "paramDesc": "设备描述"},
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

            "reportFix": function (column, row) {
                rowId = row.id;
                return "<button type='button' class='btn btn-xs btn-default command-wrench' data-row-id='" + row.id + "' onclick='reportFix(" + row.id + ")'><span class='fa fa-wrench'></span></button> "
            }
            ,

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
            },

            showReportType: {
                to: showReportType
            }
            ,
            showRunning: {
                to: showRunning
            }
            , showShortLocName: {
                to: showShortLocName
            }

        }
    });


    vdm = new Vue({
        el: formName,
        data: {
            "equipment": null
        }
    });
    initSelect();



    validateForm.call(validateOptions);


    var fixConfig = {
        message: '',
        fields: {

            "creator": {
                message: '记录人无效',
                validators: {
                    notEmpty: {
                        message: '记录人不能为空'
                    }
                }
            },
            "reporter": {
                message: '报修人无效',
                validators: {
                    notEmpty: {
                        message: '报修人不能为空'
                    }
                }
            },
            "orderDesc": {
                message: '故障描述无效',
                validators: {
                    notEmpty: {
                        message: '故障描述不能为空'
                    }
                }
            },
        }
    };
    validateFixForm.call(fixConfig);


    $('#reportFixModal').on('show.bs.modal', function (event) {
        var modal = $(this);  //get modal itself
        modal.find("#id").val(rowId);
    });


    $("#searchBtn").trigger("click");

});


/**
 *
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
 * @param id
 */
function edit(id) {
    var object = findByIdAndObjectName(id, mainObject);
    vdm.$set("equipment", object);
    $("#editModal").modal("show");
}


/**
 * 新建记录
 */
function add() {
    vdm.$set("equipment", null);
    $("#editModal").modal("show");
}

function reportFix(id) {
    $("#reportFixModal").modal("show");
}


/**
 *
 * @param validationConfig
 */
function validateFixForm(validationConfig) {
    $("#reportFixForm")
        .bootstrapValidator(validationConfig)
        .on('success.form.bv', function (e) {
            e.preventDefault();
            reportFixData("reportFixForm");
        });
}


/**
 *
 * @param form
 */
function reportFixData(form) {
    var param = JSON.parse(getFormJsonData(form));
    var url = "/workOrder/reportFix";
    $.post(url, param, function (data) {
        $("#reportFixModal").modal("hide");
        showMessage(data["result"], data["resultDesc"]);
    });
}