<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">栏目名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="name" name="name" v-model="columns.name"/>
                    <input class="form-control" id="id" name="id" v-model="columns.id" type="hidden"/>
                </div>
                <label for="colDesc" class="col-md-2 control-label">栏目描述</label>
                <div class="col-md-4">
                    <input class="form-control" id="colDesc" name="colDesc" v-model="columns.colDesc"/>
                </div>
            </div>
            <div class="form-group">
                <label for="beginTime" class="col-md-2 control-label">开始时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="beginTime" name="beginTime" v-model="columns.beginTime" required/>
                </div>
                <label for="endTime" class="col-md-2 control-label">结束时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="endTime" name="endTime" v-model="columns.endTime" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="type" class="col-md-2 control-label">栏目类型</label>
                <div class="col-md-4">
                    <input class="form-control" id="type" name="type" v-model="columns.type"/>
                </div>
                <label for="siteId" class="col-md-2 control-label">所属站点</label>
                <div class="col-md-4">
                    <input class="form-control" id="siteId" name="siteId" v-model="columns.siteId" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="parentId" class="col-md-2 control-label">上级栏目</label>
                <div class="col-md-4">
                    <input class="form-control" id="parentId" name="parentId" v-model="columns.parent.id" />
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <select class="form-control" id="status" name="status" v-model="columns.status" style="width:100%"
                            required>
                        <option value="1" selected>启用</option>
                        <option value="0">禁用</option>
                    </select>
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