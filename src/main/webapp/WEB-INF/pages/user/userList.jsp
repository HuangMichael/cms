<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="true" data-width="5%">ID</th>
<th data-column-id="userName" data-sortable="true" data-width="5%">用户名</th>
<th data-column-id="personName" data-sortable="true" data-width="5%">姓名</th>
<th data-column-id="photoUrl" data-width="5%" data-converter="showImage">用户头像</th>
<th data-column-id="gender" data-width="5%" data-converter="showGender">性别</th>
<th data-column-id="birthDate" data-width="8%" data-converter="birthDate" data-visible=false>出生日期</th>
<th data-column-id="idCard" data-sortable="true" data-width="20%" data-visible=false>身份证号</th>
<th data-column-id="email" data-sortable="true" data-width="15%">电子邮箱</th>
<th data-column-id="telephone" data-sortable="true" data-width="15%">联系电话</th>
<%--<th data-column-id="status" data-sortable="true" data-width="5%" data-converter="showStatus">状态</th>--%>
<th data-column-id="upload" data-sortable="true" data-width="5%" data-formatter="upload">上传|下载</th>
<th data-column-id="commands" data-sortable="true" data-width="5%" data-formatter="commands">编辑|删除</th>
