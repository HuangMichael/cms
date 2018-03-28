<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="form-horizontal myform" id="form" method="post">
    <div class="form-group">
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="name">站点名称</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="name" name="name" v-model="site.name" required>
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="status">域名</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="domainName" name="domainName" v-model="site.domainName" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="name">开始时间</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="beginTime" name="beginTime" v-model="site.beginTime"
                   onload="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})" required>
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="status">结束时间</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="endTime" name="endTime" v-model="site.endTime"
                   onload="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})" required>
        </div>
    </div>

    <div class="form-group">
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="name">部署主机</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="deployHost" name="deployHost" v-model="site.deployHost" required>
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="status">状态</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <select class="form-control" id="status" name="status" required v-model="site.status" style="width:100%" required
                    required>
                <option value="1" selected>启用</option>
                <option value="0">禁用</option>
            </select>
        </div>
    </div>
    <div class="modal-footer">
        <button id="saveBtn" name="saveBtn" class="btn btn-primary btn-danger">保存记录</button>
    </div>
</form>

