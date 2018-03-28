/**
 * Created by huangbin on 2016/11/4.
 */


var mainObject = "";
var exportObject = mainObject;
var vdm = null; //定义form数据模型
var formName = "#form";
var dataTableName = "";
var ids = [];//所有的ID的集合
var docName = "";
var searchModel = [];


/**
 *
 * @returns {string}
 * 获取主对象
 */
function getMainObject() {
    return mainObject;
}


function getDataTableName() {
    return dataTableName;
}


/**
 *
 * @param validationConfig
 */
function validateForm(validationConfig) {
    $(formName)
        .bootstrapValidator(validationConfig)
        .on('success.form.bv', function (e) {
            e.preventDefault();
            saveMainObject(formName);
        });
}

/**
 *保存或者更新 后刷新数据列表
 * */
function saveMainObject(formName) {

    var objStr = getFormDataAsJSON(formName);
    var object = JSON.parse(objStr);
    console.log("save" + JSON.stringify(object));
    var url = getMainObject() + "/save";
    $.post(url, object, function (data) {
        $("#editModal").modal("hide");
        if (data.result) {
            $(dataTableName).bootgrid("reload");
        }
        showMessage(data.result, data["resultDesc"]);
    });
}


function saveTree(formName, childZNode) {
    var objStr = getFormJsonData(formName);
    var object = JSON.parse(objStr);
    var url = mainObject + "/save";

    $.ajax({
        type: "POST", url: url, data: object, dataType: "JSON", success: function (obj) {

            if (object.id) {
                updateNode(null, childZNode);
                showMessageBox("info", "信息更新成功");
            } else {
                addNodeAfterChangeOperation(null, childZNode, parent);
                showMessageBox("info", "信息添加成功")
            }
        }, error: function (msg) {
            if (object.id) {
                showMessageBox("danger", "信息更新失败")
            } else {
                showMessageBox("danger", "信息添加失败")
            }
        }
    })
}


/**
 *根据id查询返回对象
 * */
function findById(id) {
    var mainObject = getMainObject();
    var object = null;
    if (!id) {
        id = selectedIds[pointer];
    }
    var url = mainObject + "/findById/" + id;
    $.getJSON(url, function (data) {
        object = data;
    });
    return object;
}


/**
 *
 * @param id
 * @param objName
 * @returns {*}
 */
function findByIdAndObjectName(id, objName) {
    var url = objName + "/findById/" + id;
    $.getJSON(url, function (data) {
        object = data;
    });
    return object;
}

/**
 *根据id查询返回对象
 * @param objName
 * @param id
 * @return {*}
 * */
function findObjById(objName, id) {
    var object = null;
    if (!id) {
        id = selectedIds[pointer];
    }
    var url = objName + "/findById/" + id;

    console.log("url----------" + url);
    $.getJSON(url, function (data) {
        object = data;
    });
    return object;
}


/**
 * 保存设备信息
 */
function save() {
    $("#saveBtn").trigger("click");
}


/**
 *
 * @param formId 设置form为只读
 */
function setFormReadStatus(formId, formLocked) {
    if (formLocked) {
        $(formId + " input ").attr("readonly", "readonly");
        $(formId + " textarea ").attr("readonly", "readonly");
        $(formId + " select").attr("disabled", "disabled");
    } else {
        $(formId + " input").attr("readonly", "readonly").removeAttr("readonly");
        $(formId + " select").attr("disabled", "disabled").removeAttr("disabled");
        $(formId + " textarea").attr("readonly", "readonly").removeAttr("readonly");

    }
}


/**
 *导出excel
 */
function exportExcel() {

    var selectedIds = $(dataTableName).bootgrid("getSelectedRows");
    var param = $(dataTableName).bootgrid("getSearchPhrase");
    var columnSettings = $(dataTableName).bootgrid("getColumnSettings");
    var titles = [];
    var colNames = [];
    for (var x in columnSettings) {
        if (columnSettings[x] != undefined && columnSettings[x]["text"] != "" && columnSettings[x]["id"] != "" && columnSettings[x]["text"] && columnSettings[x]["id"] && !columnSettings[x]["identifier"] && !columnSettings[x]["formatter"]) {
            titles[x] = columnSettings[x]["text"];
            colNames[x] = columnSettings[x]["id"];
        }

    }
    docName = (docName) ? (docName) : ("导出数据");
    var url = getMainObject() + "/exportExcel?param=" + param + "&docName=" + docName + "&titles=" + titles + "&colNames=" + colNames;
    if (selectedIds) {
        url += "&selectedIds= " + selectedIds.join(",");
    }
    url = url.trim();
    bootbox.confirm({
        message: "确定导出查询结果记录么?",
        buttons: {
            confirm: {
                label: '是',
                className: 'btn-success'
            },
            cancel: {
                label: '否',
                className: 'btn-danger'
            }
        },
        callback: function (result) {
            if (result) {
                window.location.href = url;
            }
        }
    });

}


/**
 *  初始化下拉选择组件
 */
function initSelect() {
    /*    $("select").select2({
            theme: "bootstrap",
            tags: "true",
            placeholder: "请选择...",
            allowClear: true
        });*/
}


/**
 * 重置查询
 */
function resetSearch() {
    var params = $("#searchBox :input");
    $.each(params, function (i, p) {
        if (!$(p).is(":button")) {
            $(p).val("");
        }
    });
    search();
}


/**
 * 查询信息
 */
function search() {
    //组装模型
    var params = $("#searchBox :input");
    var searchParams = "";
    $.each(params, function (i, p) {
        var id = $(p).attr("id");
        if (!$(p).is(":button")) {
            var value = ($(p).val()) ? $(p).val().trim() : "";
            searchParams += value + ",";
        }
    });
    $(dataTableName).bootgrid("setSearchPhrase", searchParams).bootgrid("reload");
}


/**
 *
 * @returns {string} 获取查询的字符串
 */
function getSearchConfig() {
    //组装模型
    var params = $("#searchBox :input");
    var searchParams = "";
    $.each(params, function (i, p) {
        var id = $(p).attr("id");
        if (!$(p).is(":button")) {
            var value = ($(p).val()) ? $(p).val().trim() : "";
            searchParams += value + ",";
        }
    });
    return searchParams;

}


$(function () {
    //取消异步加载
    $.ajaxSettings.async = false;
    //监听回车查询
    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $("#searchBtn").click();
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
 *查询所有的表配置信息
 * @param url
 * @return {Array}
 * */
function findListByUrl(url) {
    var dataList = [];
    $.ajaxSettings.async = false;
    $.getJSON(url, function (data) {
        dataList = data;
    });
    return dataList;
}
