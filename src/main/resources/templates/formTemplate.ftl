<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
        <#list columns?sort_by("id") as c>
            <div class="form-group">
                <label for="${c.colName}" class="col-md-2 control-label">${c.colDesc}</label>
                <div class="col-md-4">
                    <input class="form-control" id="${c.colName}" name="${c.colName}" v-model="${subDirName}.${c.colName}" <#if c.isNull> required</#if>/>
                </div>
            </div>
        </#list>
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