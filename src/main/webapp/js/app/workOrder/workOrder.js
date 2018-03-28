/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */

var rowId = null;
$(function () {
    dataTableName = "#workOrderListTable";
    docName = "报修单信息";
    mainObject = "workOrder";


    var searchVue = new Vue({
        el: "#searchBox"
    });


    searchModel = [
        {"param": "orderDesc", "paramDesc": "工单描述"},
        {"param": "orderState", "paramDesc": "工单状态"},
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
                rowId = row.id;
                return "<button type='button' class='btn btn-xs btn-default command-remove' data-row-id='" + row.id + "' onclick='removeReport(" + rowId + ")'><span class='fa fa-trash-o'></span></button> "
                    + "<button type='button' class='btn btn-xs btn-default command-remove' data-row-id='" + row.id + "' onclick='sendOrder(" + rowId + ")'><span class='fa fa-puzzle-piece'></span></button> ";
            },
        },
        converters: {

            showReportType: {
                to: showReportType
            },
            showOrderState: {
                to: showOrderState
            },
            showStatus: {
                to: showStatus
            },

        }
    })


    $("#searchBtn").trigger("click");


    vdm = new Vue({
        el: formName,
        data: {
            "workOrder": null
        }
    });
    initSelect();


    validateRemoveForm(null);


    $('#removeReportModal').on('show.bs.modal', function (event) {
        var modal = $(this);  //get modal itself
        modal.find("#id").val(rowId);
    });


});


function del(id) {

    var url = getMainObject() + "/delete/" + id;
    if (id) {
        bootbox.confirm({
            message: "确定删除该记录么？",
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

function removeReport(id) {


    var url = getMainObject() + "/removeReport/" + id;
    if (id) {
        bootbox.confirm({
            message: "确定将移除该报修记录么？",
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
 *
 * @param id
 * 移除报修
 */
function removeReport(id) {
    $("#removeReportModal").modal("show");
}


/**
 *
 * @param validationConfig
 */
function validateRemoveForm(validationConfig) {
    $("#removeReportForm")
        .bootstrapValidator(validationConfig)
        .on('success.form.bv', function (e) {
            e.preventDefault();
            removeReportData("removeReportForm");
        });
}


/**
 *
 * @param form
 */
function removeReportData(form) {
    var param = JSON.parse(getFormJsonData(form));
    var url = "/workOrder/removeReport";
    $.post(url, param, function (data) {
        $(dataTableName).bootgrid("reload");
        $("#removeReportModal").modal("hide");
        showMessage(data["result"], data["resultDesc"]);
    });
}


/**
 *
 * @param id
 * 派工
 */
function sendOrder(id) {
    $("#sendOrderModal").modal("show");
}
