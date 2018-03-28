<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="searchDesc" class="col-md-2 control-label">查询描述</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="appSearch.id" type="hidden"/>
                    <input class="form-control" id="searchDesc" name="searchDesc" v-model="appSearch.searchDesc"
                           required/>
                </div>

                <label for="appId" class="col-md-2 control-label">所属应用</label>
                <div class="col-md-4">
                    <select class="form-control" id="appId" name="app.id" v-model="appSearch.app.id"
                            style="width:100%" required>
                        <template v-for="a in apps">
                            <option value="{{a.id}}" v-if="a.id == appSearch.app.id" selected>
                                {{a.appDesc}}
                            </option>
                            <option value="{{a.id}}" v-else>{{a.appDesc}}</option>
                        </template>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="hasAuthKey" class="col-md-2 control-label"> 是否过滤</label>
                <div class="col-md-4">
                    <select class="form-control" id="hasAuthKey" name="hasAuthKey" v-model="appSearch.hasAuthKey"
                            style="width:100%">
                        <option value="1" selected>是</option>
                        <option value="0">否</option>
                    </select>
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <select class="form-control" id="status" name="status" v-model="appSearch.status"
                            style="width:100%">
                        <option value="1" selected>有效</option>
                        <option value="0">无效</option>
                    </select>
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