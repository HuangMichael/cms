<%@ page contentType="text/html;charset=UTF-8" %>
<th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="false" data-width="10%">ID</th>
<#list columns as c>
<th data-column-id="${c.colName}" data-width="5%"<#if c.converter? length gt 0>
    data-converter="${c.converter}"
</#if>>${c.colDesc}

</th>
</#list>
<th data-column-id="commands" data-formatter="commands"
    data-sortable="false" data-width="10%">编辑|删除
</th>

