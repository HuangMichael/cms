<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="reportFixForm" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">

                <label for="reporter" class="col-md-2 control-label">报修人</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" type="hidden"/>
                    <input class="form-control" id="type" name="type" type="hidden" value="w"/>
                    <input class="form-control" id="reporter" name="reporter"/>
                </div>

                <label for="creator" class="col-md-2 control-label">录入人</label>
                <div class="col-md-4">
                    <input class="form-control" id="creator" name="creator"/>
                </div>

            </div>

            <div class="form-group">
                <label for="eqClassId" class="col-md-2 control-label">设备分类</label>
                <div class="col-md-4">
                    <select id="eqClassId" name="eqClassId" class="form-control" style="width:100%">
                        <template v-for="c in eqClasses">
                            <option value="{{c.id}}">{{c.name}}</option>
                        </template>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label for="orderDesc" class="col-md-2 control-label">故障描述</label>
                <div class="col-md-10">
                    <textarea class="form-control" id="orderDesc" name="orderDesc"/>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default"
                data-dismiss="modal"> 取消
        </button>
        <button id="reportBtn" name="reportBtn" class="btn btn-danger">报修
        </button>
    </div>
</form>