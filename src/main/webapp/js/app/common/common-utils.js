function transformDate(timestamp) {
    var date = new Date(timestamp);
    var dateStr = "";
    dateStr += date.getFullYear() + "-";
    dateStr += parseInt(date.getMonth() + 1) + "-";
    dateStr += date.getDate() + " ";
    dateStr += (date.getHours() < 10) ? "0" + date.getHours() + ":" : date.getHours() + ":";
    dateStr += (date.getMinutes() < 10) ? "0" + date.getMinutes() + ":" : date.getMinutes() + ":";
    dateStr += (date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds();
    return dateStr
}

function transformYMD(timestamp) {
    var date = new Date(timestamp);
    var dateStr = "";
    dateStr += date.getFullYear() + "-";
    dateStr += (parseInt(date.getMonth() + 1) < 10) ? "0" + parseInt(date.getMonth() + 1) + "-" : parseInt(date.getMonth() + 1) + "-";
    dateStr += (date.getDate() < 10) ? "0" + date.getDate() : date.getDate();
    return dateStr
}


function transformDateHMS(timestamp) {
    var date = new Date(timestamp);
    var dateStr = "";
    if (date) {
        dateStr += (date.getHours() < 10) ? "0" + date.getHours() + ":" : date.getHours() + ":";
        dateStr += (date.getMinutes() < 10) ? "0" + date.getMinutes() + ":" : date.getMinutes() + ":";
        dateStr += (date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds();
    }
    return dateStr;
}

/**
 *
 * @param interval 间隔可为正负整数 不传默认为0
 * @param dtDate 传入日期 不传默认为当前日期
 * @returns {string}
 */
function addMonth(interval, dtDate) {
    var date = (dtDate != null) ? new Date(dtDate) : new Date();
    interval = (interval) ? parseInt(interval) : 0;//间隔
    date.setMonth(date.getMonth() + interval);
    var month = (date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    return date.getFullYear() + '-' + month;
}

function addMonthToday(interval, dtDate) {
    var date = (dtDate != null) ? new Date(dtDate) : new Date();
    interval = (interval) ? parseInt(interval) : 0;//间隔
    date.setMonth(date.getMonth() + interval);
    var month = (date.getMonth() + 1 < 10) ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var day = (date.getDate() + 1 < 10) ? "0" + (date.getDate() + 1) : date.getDate() + 1;
    return date.getFullYear() + '-' + month + "-" + day;
}


function getFormJsonData(formId) {
    var array = $("#" + formId).serializeArray();
    var objStr = "{";
    for (var x in array) {
        var name = array[x]["name"];
        var value = array[x]["value"];
        if (name && value) {
            objStr += '"' + name + '"';
            objStr += ":";
            objStr += '"' + value + '",'
        }
    }
    objStr = objStr.substring(0, objStr.length - 1);
    objStr += "}";
    return objStr
}

/**
 *
 * @param formId formId 已经包含#
 * @returns {string}
 */
function getFormDataAsJSON(formId) {
    var array = $(formId).serializeArray();
    console.log("array-------------" + JSON.stringify(array));
    var objStr = "{";
    for (var x in array) {
        var name = array[x]["name"];
        var value = array[x]["value"];

        console.log(name + ":" + value + "\n");
        if (name && value) {
            objStr += '"' + name + '"';
            objStr += ":";
            objStr += '"' + value + '",'
        }
    }
    objStr = objStr.substring(0, objStr.length - 1);
    objStr += "}";
    return objStr
}


function fillForm(data, formId) {
    var formArray = $(formId).serializeArray();
    var attrName;
    for (var x in formArray) {
        attrName = formArray[x]["name"];
        if (attrName) {
            $("input[name='" + attrName + "']").val(data[attrName] ? data[attrName] : null)
        }
    }
}

function showMessageBox(type, message) {
    $.bootstrapGrowl(message, {type: type, align: "right", stackup_spacing: 30})
}

function loadTableData(t, c, d) {
    var thead = $("#thead");
    var tbody = $("#tbody");
    if (thead) {
        var html = "<tr>";
        for (var x in c) {
            if (c[x]["title"]) {
                html += ('<th  data-column-id="' + c[x]["name"] + '">' + c[x]["title"] + "</th>")
            }
        }
        html += "</tr>";
        thead.html(html)
    }
    var html1 = "<tr>";
    for (var i in d) {
        for (var a in c) {
            if (d[i][c[a].name]) {
                html1 += "<td>" + d[i][c[a].name] + "</td>"
            }
        }
        html1 += "<tr>"
    }
    tbody.html(html1)
}

function addNodeAfterOperation(tree, childNode) {
    var zTree = (tree == null) ? getTreeRoot() : tree;
    var parentZNode = zTree.getNodeByParam("id", getSelectedNodeId(), null);
    zTree.addNodes(parentZNode, childNode, true);
    zTree.selectNode(zTree.getNodeByParam("id", childNode.id))
}

/**
 *
 * @param tree 树节点
 * @param childNode 子节点
 * @param parentId 重新选择的上级
 */
function addNodeAfterChangeOperation(tree, childNode, parentId) {
    var zTree = (tree == null) ? getTreeRoot() : tree;
    var parentZNode = zTree.getNodeByParam("id", parentId, null);
    zTree.addNodes(parentZNode, childNode, true);
    zTree.selectNode(zTree.getNodeByParam("id", childNode.id))
}


function updateNode(tree, nodeName) {
    var zTree = (tree == null) ? getTreeRoot() : tree;
    var node = getSelectedNode();
    node.name = nodeName.name;
    zTree.updateNode(node)
}

function getTreeRoot() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    return zTree;
}

function getSelectedNodeId() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    var selectedNode = zTree.getSelectedNodes()[0];
    var id = selectedNode.id;
    return id
}

function getSelectedNode() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    var selectedNode = zTree.getSelectedNodes()[0];
    return selectedNode
}


function getCheckedNode() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    var selectedNode = zTree.getCheckedNodes();
    return selectedNode
}

/**
 *
 * @param type  info  danger
 * @param message center
 */
function showMessageBox(type, message) {
    $.bootstrapGrowl(message, {type: type, align: "right", stackup_spacing: 30})
}


/**
 *
 * @param type  info  danger
 * @param message center
 */
function showMessage(type, message) {
    type = (type == true) ? "info" : "danger";
    $.bootstrapGrowl(message, {type: type, align: "right", stackup_spacing: 30})
}

/**
 *
 * @param type info  danger
 * @param position left center right
 * @param message
 */
function showMessageBoxCenter(type, position, message) {
    $.bootstrapGrowl(message, {type: type, align: position, stackup_spacing: 30})
}

Array.prototype.indexOf = function (val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};


/**
 * 移除指定的元素
 * */
Array.prototype.remove = function (val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};


/**
 * 移除指定的元素
 * */
Array.prototype.removeButThis = function (val) {
    for (var x in this) {
        //如果值有重复
        if (this[x] == val) {
            this.clear();
            this.push(val);
        }

    }
};

Array.prototype.clear = function () {
    this.splice(0, this.length);
};


Array.prototype.unique = function () {
    var n = {}, r = []; //n为hash表，r为临时数组
    for (var i = 0; i < this.length; i++) //遍历当前数组
    {
        if (!n[this[i]]) //如果hash表中没有当前项
        {
            n[this[i]] = true; //存入hash表
            r.push(this[i]); //把当前数组的当前项push到临时数组里面
        }
    }
    return r;
};


function sortArr(m, n) {
    return m > n ? 1 : (m < n ? -1 : 0);
}


/**
 *
 * @param obj
 * @returns {*}
 */
function getFilePath(obj) {
    if (obj) {

        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
            obj.select();

            return document.selection.createRange().text;
        }

        else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
            if (obj.files) {

                return obj.files.item(0).getAsDataURL();
            }
            return obj.value;
        }
        return obj.value;
    }
}

/**
 *
 * @param formId 设置form为只读
 */
function setFormReadStatus(formId, formLocked, except) {
    if (formLocked) {
        $(formId + " input").attr("readonly", "readonly");
        $(formId + " select").attr("disabled", "disabled");
    } else {
        $(formId + " input").attr("readonly", "readonly").removeAttr("readonly");
        $(formId + " select").attr("disabled", "disabled").removeAttr("disabled");
        // $(formId + " #status").attr("disabled", "disabled");
        for (var x in except) {
            $("#" + except[x]).attr("readonly", "readonly");
        }
    }
}

/**
 *
 * @param value
 * @returns {string}
 */
var showStatus = function (value) {
    return (value) ? "有效" : "无效";
}


/**
 *
 * @param value
 * @returns {string}
 */
var showYes = function (value) {
    return (value) ? "是" : "否";
}


/**
 *
 * @param value
 */
var showDate = function (value) {
    return transformYMD(value);
}


/**
 *
 * @param value
 */
var showOrderState = function (value) {
    var orderState = ["报修车", "已分配", "已维修", "已完成"];
    return orderState[value];
}


/**
 *
 * @param value
 */
var showReportType = function (value) {

    // return "<img src='img/" + value + ".png' style='height:20px;width:20px'>";
    return value == 's' ? "设备报修" : "位置报修";
}


/**
 *
 * @param value
 */
var showRunning = function (value) {
    var runningState = ['故障', '正常'];
    return runningState[value];
}


/**
 *
 * @param value
 */
var showEqName = function (value) {
    return value ? value["description"] : "无";

}

/**
 *
 * @param value
 */
var showUnitName = function (value) {
    return value ? value["name"] : "无";

}


/**
 *
 * @param value
 */
var showAppName = function (value) {
    return value ? value["appDesc"] : "无";

}


/**
 *
 * @param value
 */
var showLocName = function (value) {

    return value ? value["location"]["locName"] : "无";
}


/**
 *
 * @param value
 */
var showShortLocName = function (value) {

    return value ? value["locName"] : "无";

}


/**
 *
 * @param value
 */
var showEqClassName = function (value) {
    return value ? value["name"] : "无";

}


/**
 *
 * @param value
 */
var showOrderLineNo = function (value) {
    return value ? value["orderLineNo"] : "无";
}

/**
 *
 * @param value
 */
var showOrderDesc = function (value) {
    return value ? value["orderDesc"] : "无";
}


/**
 *
 * @param value
 */
var showGender = function (value) {
    return value == '1' ? '男' : "女";
}

/**
 *
 * @param value
 */
var showTableName = function (value) {
    return value ? value["tableName"] : "无";
}


var showSiteName = function (value) {
    return value ? value["name"] : "无";
}


/**
 * 显示上传下载
 */
function showUpload(id) {
    recordId = id;
    console.log("showUpload recordId---------------" + recordId);
    $("#uploadModal").modal("show");

}

/**
 * 显示下载
 */
function download(id) {
    var object = findByIdAndObjectName(id, mainObject);
    var photo = object["photoUrl"];
    if (photo) {
        window.open(photo);
    } else {
        showMessageBox("danger", "对不起，照片还未上传");
    }
}

/**
 *
 * @param column
 * @param row
 * @returns {string}
 */
var showUploadBtn = function (column, row) {
    return "<button type='button' class='btn btn-xs btn-default command-upload' data-row-id='" + row.id + "' onclick='showUpload(" + row.id + ")'><span class='fa fa-upload'></span></button> "
        + "<button type='button' class='btn btn-xs btn-default command-download' data-row-id='" + row.id + "' onclick='download(" + row.id + ")'><span class='fa fa-download'></span></button> ";
}

/**
 *
 * @param column
 * @param row
 * @returns {string}
 */
var showCommandsBtn = function (column, row) {
    return "<button type='button' class='btn btn-xs btn-default command-edit' data-row-id='" + row.id + "' onclick='edit(" + row.id + ")'><span class='fa fa-pencil'></span></button> " +
        "<button type='button' class='btn btn-xs btn-default command-delete' data-row-id='" + row.id + "' onclick='del(" + row.id + ")'><span class='fa fa-trash-o'></span></button>";
}


/**
 *
 * @param column
 * @param row
 * @returns {string}
 */
var showAddColsBtn = function (column, row) {
    tableId = row.app.tableConfig.id;
    rowId = row.id;
    return "<button type='button' class='btn btn-xs btn-default command-edit' data-row-id='" + row.id + "' onclick='addSearchCols(" + rowId + ")'><span class='fa fa-plus-square-o'></span></button> ";
}

/**
 *
 * @param column
 * @param row
 * @returns {string}
 */
var addUserBtn = function (column, row) {
    return "<button type='button' class='btn btn-xs btn-default command-edit' data-row-id='" + row.id + "' onclick='addUsers(" + row.id + ")'><span class='fa fa-plus'></span></button> ";
}


/**
 *
 * @param column
 * @param row
 * @returns {string}
 */
var removeBtn = function (column, row) {
    return "<button type='button' class='btn btn-xs btn-default command-remove' data-row-id='" + row.id + "' onclick='removeReport(" + row.id + ")'><span class='fa fa-trash-o'></span></button> ";
}

/**
 *
 * @param value
 * @returns {*}
 */
var showImage = function (value) {

    if (value) {
        return "<img src='" + value + "' class='img-thumbnail'  style='height:25px;width: 25px'>";
    } else {
        return "<img src='upload/memberWorks/no_pic.jpg' class='img-thumbnail'  style='height:25px;width: 25px'>";
    }
}


var initDatePicker = function () {

    $("input[class='Wdate']").on("click", function () {

        WdatePicker({maxDate: '%y-%M-%d'});

    });
}