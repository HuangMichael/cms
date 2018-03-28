<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="usersInLocation" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th data-column-id="id" data-width="5%">序号</th>
        <th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="false" data-width="5%">ID</th>
        <th data-column-id="userName" data-width="10%">用户名</th>
        <th data-column-id="personName" data-width="10%">姓名</th>
        <th data-column-id="location" data-width="20%">用户位置</th>
        <th data-column-id="command" data-formatter="command" data-width="10%">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${usersInLocation}" var="u" varStatus="s">
        <tr class="gradeX">
            <td>${s.index+1}</td>
            <td>
                    ${u.id}
            </td>
            <td>
                    ${u.userName}
            </td>
            <td>
                    ${u.personName}
            </td>
            <td>
                    ${u.location.locDesc}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script type="text/javascript">
    $("#usersInLocation").bootgrid({
        rowCount: 8,
        rowSelect: false,
        keepSelection: true,
        formatters: {
            "command": function (column, row) {
                return '<a class="btn btn-default btn-xs"  onclick="removeLocUser(' + row.id + ')" title="取消授权" ><i class="glyphicon glyphicon-remove"></i></a>'
            }
        }
    });
</script>