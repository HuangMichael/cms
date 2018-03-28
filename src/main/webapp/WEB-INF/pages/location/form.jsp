<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="locName" class="col-md-2 control-label">位置名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="location.id" type="hidden"/>
                    <input class="form-control" id="locName" name="locName" v-model="location.locName" required/>
                </div>
                <label for="locDesc" class="col-md-2 control-label">位置描述</label>
                <div class="col-md-4">
                    <input class="form-control" id="locDesc" name="locDesc" v-model="location.locDesc" required/>
                </div>

            </div>
            <div class="form-group">
                <label for="locLevel" class="col-md-2 control-label">位置级别</label>
                <div class="col-md-4">
                    <input class="form-control" id="locLevel" name="locLevel" v-model="location.locLevel" required/>
                </div>
                <label for="locType" class="col-md-2 control-label">位置类型</label>
                <div class="col-md-4">
                    <input class="form-control" id="locType" name="locType" v-model="location.locType" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="parentId" class="col-md-2 control-label">上级位置</label>
                <div class="col-md-4">
                    <input class="form-control" id="parentId" name="parentId" v-model="location.parentId"/>
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <select class="form-control" id="status" v-model="location.status" style="width:100%">
                        <option value="1" selected>有效</option>
                        <option value="0">无效</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消
        </button>
        <button id="saveBtn" name="saveBtn" class="btn btn-danger">保存
        </button>
    </div>
</form>