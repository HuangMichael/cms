<%@ page contentType="text/html;charset=UTF-8" %>
<table id="colsListTable" class="table table-bordered table-hover table-striped" style="max-height: 300px;overflow: scroll">
    <thead>
    <tr>
        <th data-column-id="id" data-width="10%">序号</th>
        <th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="false" data-width="10%">ID</th>
        <th data-column-id="colName" data-width="30%">列名</th>
        <th data-column-id="colDesc" data-width="30%">列描述</th>
    </tr>
    </thead>
</table>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">取消
    </button>
    <button type="button" id="selUnitBtn" name="selUnitBtn" class="btn btn-danger">确定
    </button>
</div>


<script type="text/javascript">
    $(function () {
        var tableId = 1;
        var config = {
            ajax: true,
            get: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/tableColumnConfig/findByTable/" + tableId,
            selection: true,
        }
        $("#colsListTable").bootgrid(config);


        $("#selUnitBtn").on("click", function () {
            var selected = $("#colsListTable").bootgrid("getSelectedRows");
            var searchId = recordId;
            var colsId = selected.join(",");
            var url = "/appSearch/addCols";
            var param = {
                searchId: searchId,
                colsId: colsId
            }
            $.post(url, param, function (data) {
                $("#searchColsModal").modal("hide");
                showMessage(data["result"], data["resultDesc"]);
            });
        });
    });
</script>

