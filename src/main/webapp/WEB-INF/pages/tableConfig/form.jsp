<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="domainName" class="col-md-3 control-label">实体类名称</label>
                <div class="col-md-8">
                    <input class="form-control" id="id" name="id" v-model="tableConfig.id" type="hidden"/>
                    <input class="form-control" id="domainName" name="domainName" v-model="tableConfig.domainName"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <label for="repositoryName" class="col-md-3 control-label">数据接口名称</label>
                <div class="col-md-8">
                    <input class="form-control" id="repositoryName" name="repositoryName"
                           v-model="tableConfig.repositoryName" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="searchServiceName" class="col-md-3 control-label">查询类名称</label>
                <div class="col-md-8">
                    <input class="form-control" id="searchServiceName" name="searchServiceName"
                           v-model="tableConfig.searchServiceName" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="serviceName" class="col-md-3 control-label">业务类名称</label>
                <div class="col-md-8">
                    <input class="form-control" id="serviceName" name="serviceName" v-model="tableConfig.serviceName"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <label for="tableDesc" class="col-md-3 control-label">表描述</label>
                <div class="col-md-8">
                    <input class="form-control" id="tableDesc" name="tableDesc" v-model="tableConfig.tableDesc"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <label for="tableName" class="col-md-3 control-label">表名称</label>
                <div class="col-md-8">
                    <input class="form-control" id="tableName" name="tableName" v-model="tableConfig.tableName"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <label for="shortName" class="col-md-3 control-label">类简称</label>
                <div class="col-md-8">
                    <input class="form-control" id="shortName" name="shortName" v-model="tableConfig.shortName"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <div class="form-group">
                    <label for="status" class="col-md-3 control-label">状态</label>
                    <div class="col-md-8">
                        <input class="form-control" id="status" name="status" v-model="tableConfig.status" required/>
                    </div>
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