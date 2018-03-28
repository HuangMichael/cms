<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="classType" class="col-md-2 control-label">属性名</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="tableColumnConfig.id" type="hidden"/>
                    <input required class="form-control" id="classType" name="classType"
                           v-model="tableColumnConfig.classType"/>
                </div>
                <label for="colDesc" class="col-md-2 control-label">列描述</label>
                <div class="col-md-4">
                    <input required class="form-control" id="colDesc" name="colDesc"
                           v-model="tableColumnConfig.colDesc"/>
                </div>
            </div>
            <div class="form-group">
                <label for="colName" class="col-md-2 control-label">表字段名</label>
                <div class="col-md-4">
                    <input required class="form-control" id="colName" name="colName"
                           v-model="tableColumnConfig.colName"/>
                </div>

                <label for="dataType" class="col-md-2 control-label">数据类型</label>
                <div class="col-md-4">
                    <input required class="form-control" id="dataType" name="dataType"
                           v-model="tableColumnConfig.dataType"/>
                </div>
            </div>
            <div class="form-group">
                <label for="isNull" class="col-md-2 control-label">是否为空</label>
                <div class="col-md-4">
                    <input required class="form-control" id="isNull" name="isNull" v-model="tableColumnConfig.isNull"/>
                </div>

                <label for="length" class="col-md-2 control-label">字段长度</label>
                <div class="col-md-4">
                    <input required class="form-control" id="length" name="length" v-model="tableColumnConfig.length"/>
                </div>
            </div>
            <div class="form-group">
                <label for="formatter" class="col-md-2 control-label">菜单格式器</label>
                <div class="col-md-4">
                    <input class="form-control" id="formatter" name="formatter" v-model="tableColumnConfig.formatter"/>
                </div>

                <label for="converter" class="col-md-2 control-label">格式转换器</label>
                <div class="col-md-4">
                    <input class="form-control" id="converter" name="converter" v-model="tableColumnConfig.converter"/>
                </div>
            </div>
            <div class="form-group">
                <label for="tableId" class="col-md-2 control-label">数据表</label>
                <div class="col-md-4">
                    <input required class="form-control" id="tableId" name="tableId"
                           v-model="tableColumnConfig.tableId"/>
                </div>

                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <select class="form-control" id="status" v-model="tableColumnConfig.status" style="width: 100%">
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