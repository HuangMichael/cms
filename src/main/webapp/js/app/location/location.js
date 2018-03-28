/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */
var fixVue = null;

$(function () {


    dataTableName = "#locationListTable";
    docName = "位置信息";
    mainObject = "location";
    formName = "#form";


    var validateOptions = {
        message: '该值无效 ',
        fields: {
            "locName": {
                message: '位置名称无效',
                validators: {
                    notEmpty: {
                        message: '位置名称不能为空!'
                    }
                }
            },

            "locName": {
                message: '位置名称无效',
                validators: {
                    notEmpty: {
                        message: '位置名称不能为空!'
                    }
                }
            },
            "locDesc": {
                message: '位置描述无效',
                validators: {
                    notEmpty: {
                        message: '位置描述不能为空!'
                    }
                }
            },
            "locLevel": {
                message: '位置级别无效',
                validators: {
                    notEmpty: {
                        message: '位置级别不能为空!'
                    }
                }
            },
            "status": {
                message: '状态无效',
                validators: {
                    notEmpty: {
                        message: '状态不能为空!'
                    }
                }
            },
        }
    };


    var searchVue = new Vue({
        el: "#searchBox"
    });

    searchModel = [
        {"param": "locName", "paramDesc": "位置名称"},
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
            "upload": function (column, row) {
                return "<button type='button' class='btn btn-xs btn-default command-upload' data-row-id='" + row.id + "'><span class='fa fa-upload'></span></button> "
            },
            "reportFix": function (column, row) {
                rowId = row.id;
                return "<button type='button' class='btn btn-xs btn-default command-wrench' data-row-id='" + row.id + "' onclick='reportFix(" + row.id + ")'><span class='fa fa-wrench'></span></button> "
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
            location: null
        }
    });
    initSelect();

    validateForm.call(validateOptions);


    $('#reportFixModal').on('show.bs.modal', function (event) {
        var modal = $(this);  //get modal itself
        modal.find("#id").val(rowId);
    });


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
    fixVue = new Vue({
        el: "#reportFixForm",
        eqClasses: []
    });


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
    vdm.$set("location", object);
    $("#editModal").modal("show");
}

/**
 * 编辑记录
 */
function add() {
    vdm.$set("location", null);
    $("#editModal").modal("show");
}

/**
 *
 * @param id
 */
function reportFix(id) {

    var eqClasses = findListByUrl("/eqClass/findEqClasses");
    console.log("eqClasses----------" + JSON.stringify(eqClasses));
    fixVue.$set("eqClasses", eqClasses);
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

    console.log("param-----------" + JSON.stringify(param));
    var url = "/workOrder/reportFix";
    $.post(url, param, function (data) {
        $("#reportFixModal").modal("hide");
        showMessage(data["result"], data["resultDesc"]);
    });
}