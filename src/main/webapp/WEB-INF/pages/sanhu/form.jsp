<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">散户名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="name" name="name" v-model="sanhu.name"  required/>
                    <input class="form-control" id="id" name="id" v-model="sanhu.id"  type="hidden"/>
                </div>
            </div>
            <div class="form-group">
                <label for="mark" class="col-md-2 control-label">备注</label>
                <div class="col-md-4">
                    <input class="form-control" id="mark" name="mark" v-model="sanhu.mark"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="sanhu.status"  required/>
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