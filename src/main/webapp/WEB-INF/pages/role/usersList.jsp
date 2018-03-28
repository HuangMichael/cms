<%@ page contentType="text/html;charset=UTF-8" %>
<table id="userListTable" class="table table-bordered table-hover table-striped" style="max-height: 300px;overflow: scroll">
    <thead>
    <tr>
        <th data-column-id="id" data-identifier="true" data-type="numeric" data-align="center" data-width="10%">序号</th>
        <th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="false">ID</th>
        <th data-column-id="userName" data-sortable="true" data-width="45%">用户名</th>
        <th data-column-id="personName" data-sortable="true" data-width="45%">姓名</th>

    </tr>
    </thead>
    <tbody>

    <template v-for="u in usersList">
        <tr>
            <td></td>
            <td>{{u.id}}</td>
            <td>{{u.userName}}</td>
            <td>{{u.personName}}</td>
        </tr>
    </template>
    </tbody>
</table>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">取消
    </button>
    <button type="button" id="selUsersBtn" name="selUsersBtn" class="btn btn-danger">确定
    </button>
</div>


<script type="text/javascript">
    $(function () {

        var usersList = findListByUrl("/user/findAllByAuthKey");
        var unitVue = new Vue({
            el: "#userListTable",
            data: {
                usersList: usersList
            }
        });
        $("#userListTable").bootgrid({

            selection: true,
            multiSelect: true
        });
        $("#selUsersBtn").on("click", function () {
            var selected = $("#userListTable").bootgrid("getSelectedRows");
            var roleId = recordId;
            var userId = selected.join(",");
            var url = "/role/addUser";
            var param = {
                roleId: roleId,
                userId: userId
            }
            $.post(url, param, function (data) {
                $("#usersModal").modal("hide");
                showMessage(data["result"], data["resultDesc"]);
            });
        });
    });
</script>

