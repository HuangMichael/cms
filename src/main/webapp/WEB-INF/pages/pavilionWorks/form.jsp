<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">作者姓名</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="pavilionWorks.id" type="hidden" />
                    <input class="form-control" id="name" name="name" v-model="pavilionWorks.name" />
                </div>
                <label for="releaseTime" class="col-md-2 control-label">发布时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="releaseTime" name="releaseTime" v-model="pavilionWorks.releaseTime"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="uploadTime" class="col-md-2 control-label">上传时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="uploadTime" name="uploadTime" v-model="pavilionWorks.uploadTime"  required/>
                </div>
                <label for="authorId" class="col-md-2 control-label">作者</label>
                <div class="col-md-4">
                    <input class="form-control" id="authorId" name="authorId" v-model="pavilionWorks.authorId"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="columnsId" class="col-md-2 control-label">栏目</label>
                <div class="col-md-4">
                    <input class="form-control" id="columnsId" name="columnsId" v-model="pavilionWorks.columnsId"  required/>
                </div>
                <label for="hasPhoto" class="col-md-2 control-label">是否有照片</label>
                <div class="col-md-4">
                    <input class="form-control" id="hasPhoto" name="hasPhoto" v-model="pavilionWorks.hasPhoto"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="isFocus" class="col-md-2 control-label">是否焦点图片</label>
                <div class="col-md-4">
                    <input class="form-control" id="isFocus" name="isFocus" v-model="pavilionWorks.isFocus"  required/>
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="pavilionWorks.status"  required/>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
        </button>
        <button id="saveBtn" name="saveBtn"
                class="btn btn-danger">保存
        </button>
    </div>
    </div>
</form>