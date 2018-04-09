<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" role="form" id="resourceForm" method="post">
    <div class="form-group">
        <div class="col-md-12 col-sm-12 col-lg-12">
            <div class="form-group">
                <input class="form-control" id="id" type="hidden" name="id" value="${resource.id}"/>
                <label class="col-md-1 col-sm-1 col-lg-1 control-label" for="resourceCode">资源编号</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <input class="form-control" id="parentId" type="hidden" name="parent.id"
                           value="${resource.parent.id}"/>
                    <input class="form-control" type="text" name="resourceCode" id="resourceCode"
                           value="${resource.resourceCode}"/>
                </div>
                <label for="resourceName" class="col-md-1 control-label">资源名称</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <input class="form-control" id="resourceName" type="text" name="resourceName"
                           value="${resource.resourceName}"/>
                </div>

                <label for="resourceUrl" class="col-md-1 control-label">资源路径</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <input class="form-control" id="resourceUrl" type="text" name="resourceUrl"
                           value="${resource.resourceUrl}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-1 col-sm-1 col-lg-1 control-label" for="appName">应用名称</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <input class="form-control" type="text" name="appName" id="appName" value="${resource.appName}"/>
                </div>
                <label for="iconClass" class="col-md-1 control-label">资源样式</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <input class="form-control" id="iconClass" type="text" name="iconClass"
                           value="${resource.iconClass}"/>
                </div>
                <label class="col-md-1 col-sm-1 col-lg-1 control-label" for="status">启用状态</label>
                <div class="col-md-3 col-sm-3 col-lg-3">
                    <select class="form-control" name="resource.status" id="status">
                        <option value="1"  <c:if test="resource.status ==1"> selected</c:if>>启用</option>
                        <option value="0"  <c:if test="resource.status ==1"> selected</c:if>>禁用;</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</form>