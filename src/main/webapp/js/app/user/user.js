var object = null;
// formName = "#detailForm";
$.ajaxSettings.async = false;

var recordId = null;
var validationConfig = {
    message: '该值无效 ',
    fields: {
        userName: {
            message: '用户名号无效',
            validators: {
                notEmpty: {
                    message: '用户名!'
                },
                stringLength: {
                    min: 3,
                    max: 20,
                    message: '用户名长度为3到20个字符'
                }
            }
        },
        email: {
            validators: {
                notEmpty: {message: '请输入邮箱'},
                emailAddress: {message: '请输入正确的邮件地址'}
            }
        }
    }
};

$(function () {
    dataTableName = '#userDataTable';
    docName = "用户信息";
    mainObject = "user";
    //初始化从数据库获取列表数据
    searchModel = [{"param": "userName", "paramDesc": "用户名"}];

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
            "upload": showUploadBtn,
            "commands": showCommandsBtn
        },
        converters: {
            showStatus: {
                to: showStatus
            },
            showImage: {
                to: showImage
            },
            showGender: {
                to: showGender
            }
        }
    });

    search();
//初始化查询所有的
    validateForm.call(validationConfig);


    vdm = new Vue({
        el: formName,
        data: {
            user: null
        }
    });


    $(".myDateBox").on("click", function () {
        WdatePicker({maxDate: "Y-m-d"});
    });


    $("#dropZone").dropzone({
        url: "/" + mainObject + "/upload",
        addRemoveLinks: true,
        dictRemoveLinks: "移除文件",
        dictCancelUpload: "取消上传",
        maxFiles: 3,
        maxFilesize: 5,
        autoProcessQueue: true,
        acceptedFiles: ".jpg,.png",
        init: function () {
            this.on("success", function (file, data) {
                //上传完成后触发的方法
                if (data.result) {
                    $("#uploadModal").modal("hide");
                    $(dataTableName).bootgrid("reload");
                    showMessageBox("info", data["resultDesc"]);
                } else {
                    showMessageBox("danger", data["resultDesc"]);
                }
            });
            this.on('sending', function (file, xhr, formData) {
                //传递参数时在sending事件中formData，需要在前端代码加enctype="multipart/form-data"属性
                formData.append("mainObject", mainObject);
                formData.append("recordId", recordId);
            });
            this.on("removedfile", function (file) {
                console.log("File " + file.name + "removed");
            });
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
    vdm.$set("user", object);
    $("#editModal").modal("show");
    $("#userName").attr("readonly", true);
}


/**
 * 显示上传下载
 */
function showUpload(id) {
    recordId = id;
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
 * 新建记录
 */
function add() {
    vdm.$set("user", null);
    $("#editModal").modal("show");
}




