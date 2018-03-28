<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
                    <div class="form-group">
                <label for="id" class="col-md-2 control-label">序号</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="columnsContent.id" />
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label">标题</label>
                <div class="col-md-4">
                    <input class="form-control" id="title" name="title" v-model="columnsContent.title" />
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-md-2 control-label">内容</label>
                <div class="col-md-4">
                    <input class="form-control" id="content" name="content" v-model="columnsContent.content" />
                </div>
            </div>
            <div class="form-group">
                <label for="creator" class="col-md-2 control-label">创建人</label>
                <div class="col-md-4">
                    <input class="form-control" id="creator" name="creator" v-model="columnsContent.creator"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="focusPic_url" class="col-md-2 control-label">焦点图片</label>
                <div class="col-md-4">
                    <input class="form-control" id="focusPic_url" name="focusPic_url" v-model="columnsContent.focusPic_url" />
                </div>
            </div>
            <div class="form-group">
                <label for="columnsId" class="col-md-2 control-label">所属栏目</label>
                <div class="col-md-4">
                    <input class="form-control" id="columnsId" name="columnsId" v-model="columnsContent.columnsId"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="siteId" class="col-md-2 control-label">站点</label>
                <div class="col-md-4">
                    <input class="form-control" id="siteId" name="siteId" v-model="columnsContent.siteId"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="createTime" class="col-md-2 control-label">创建时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="createTime" name="createTime" v-model="columnsContent.createTime" />
                </div>
            </div>
            <div class="form-group">
                <label for="releaseTime" class="col-md-2 control-label">发布时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="releaseTime" name="releaseTime" v-model="columnsContent.releaseTime" />
                </div>
            </div>
            <div class="form-group">
                <label for="auditStatus" class="col-md-2 control-label">审核状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="auditStatus" name="auditStatus" v-model="columnsContent.auditStatus" />
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="columnsContent.status" />
                </div>
            </div>
            <div class="form-group">
                <label for="sortNo" class="col-md-2 control-label">排序</label>
                <div class="col-md-4">
                    <input class="form-control" id="sortNo" name="sortNo" v-model="columnsContent.sortNo"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="authKey" class="col-md-2 control-label">授权码</label>
                <div class="col-md-4">
                    <input class="form-control" id="authKey" name="authKey" v-model="columnsContent.authKey"  required/>
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