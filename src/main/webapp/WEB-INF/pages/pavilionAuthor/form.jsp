<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">作者姓名</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="pavilionAuthor.id"  type="hidden" />
                    <input class="form-control" id="name" name="name" v-model="pavilionAuthor.name" />
                </div>
                <label for="hasPhoto" class="col-md-2 control-label">是否有照片</label>
                <div class="col-md-4">
                    <input class="form-control" id="hasPhoto" name="hasPhoto" v-model="pavilionAuthor.hasPhoto"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="createTime" class="col-md-2 control-label">创建时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="createTime" name="createTime" v-model="pavilionAuthor.createTime"  required/>
                </div>

                <label for="photoUrl" class="col-md-2 control-label">作者照片</label>
                <div class="col-md-4">
                    <input class="form-control" id="photoUrl" name="photoUrl" v-model="pavilionAuthor.photoUrl"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="pavilionAuthor.status" />
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