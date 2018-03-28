<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
                    <div class="form-group">
                <label for="id" class="col-md-2 control-label">序号</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="basicMenu.id" />
                </div>
            </div>
            <div class="form-group">
                <label for="menuCode" class="col-md-2 control-label">菜单编号</label>
                <div class="col-md-4">
                    <input class="form-control" id="menuCode" name="menuCode" v-model="basicMenu.menuCode" />
                </div>
            </div>
            <div class="form-group">
                <label for="menuName" class="col-md-2 control-label">菜单名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="menuName" name="menuName" v-model="basicMenu.menuName" />
                </div>
            </div>
            <div class="form-group">
                <label for="menuDesc" class="col-md-2 control-label">菜单描述</label>
                <div class="col-md-4">
                    <input class="form-control" id="menuDesc" name="menuDesc" v-model="basicMenu.menuDesc" />
                </div>
            </div>
            <div class="form-group">
                <label for="menuLevel" class="col-md-2 control-label">菜单级别</label>
                <div class="col-md-4">
                    <input class="form-control" id="menuLevel" name="menuLevel" v-model="basicMenu.menuLevel"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="menuUrl" class="col-md-2 control-label">链接路径</label>
                <div class="col-md-4">
                    <input class="form-control" id="menuUrl" name="menuUrl" v-model="basicMenu.menuUrl"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="iconClass" class="col-md-2 control-label">菜单样式</label>
                <div class="col-md-4">
                    <input class="form-control" id="iconClass" name="iconClass" v-model="basicMenu.iconClass"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="appName" class="col-md-2 control-label">所属应用</label>
                <div class="col-md-4">
                    <input class="form-control" id="appName" name="appName" v-model="basicMenu.appName"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="parentId" class="col-md-2 control-label">上级菜单</label>
                <div class="col-md-4">
                    <input class="form-control" id="parentId" name="parentId" v-model="basicMenu.parentId"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="staticFlag" class="col-md-2 control-label">静态标识</label>
                <div class="col-md-4">
                    <input class="form-control" id="staticFlag" name="staticFlag" v-model="basicMenu.staticFlag"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="sortNo" class="col-md-2 control-label">排序</label>
                <div class="col-md-4">
                    <input class="form-control" id="sortNo" name="sortNo" v-model="basicMenu.sortNo"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="basicMenu.status" />
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