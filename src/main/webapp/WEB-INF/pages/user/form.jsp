<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="form-horizontal myform" id="form">
    <div class="form-group">
        <label class="col-md-2 col-sm-2 col-lg-2" for="userName">用户名</label>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="userName" name="userName" v-model="user.userName" required>
            <input type="hidden" class="form-control" id="id" name="id" v-model="user.id" readonly>
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="personName">姓名</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="personName" name="personName" v-model="user.personName" required>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 col-sm-2 col-lg-2" for="userName">身份证号</label>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="idCard" name="idCard" v-model="user.idCard" required>
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="email">电子邮箱</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="email" name="email" v-model="user.email" required>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 col-sm-2 col-lg-2" for="birthDate">出生日期</label>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control myDateBox" id="birthDate" name="birthDate" v-model="user.birthDate">
        </div>
        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="gender">性别</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <select class="form-control" id="gender" name="gender" v-model="user.gender" style="width:100%" required>
                <option value="1" selected>男</option>
                <option value="0">女</option>
            </select>
        </div>
    </div>


    <div class="form-group">

        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="email">联系电话</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <input class="form-control" id="telephone" name="telephone" v-model="user.telephone" required>
        </div>


        <div class="col-md-2 col-sm-2 col-lg-2">
            <label for="status">用户状态</label>
        </div>
        <div class="col-md-4 col-sm-4 col-lg-4">
            <select class="form-control" id="status" name="status" v-model="user.status" style="width:100%" required>
                <option value="1" selected>启用</option>
                <option value="0">禁用</option>
            </select>
        </div>
    </div>
    <div class="modal-footer">
        <button id="saveBtn" name="saveBtn" class="btn btn-primary btn-danger">保存记录
        </button>
    </div>
</form>

