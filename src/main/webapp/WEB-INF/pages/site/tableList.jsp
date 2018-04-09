<%@ page contentType="text/html;charset=UTF-8" %>
<th data-column-id="id" data-width="5%" data-align="center">序号</th>
<th data-column-id="id" data-type="numeric" data-identifier="true" data-visible="false" data-width="10%">ID</th>
<th data-column-id="name" data-width="15%">站点名称</th>
<th data-column-id="siteDir" data-width="10%">部署目录</th>
<th data-column-id="domainName" data-width="15%">域名</th>
<th data-column-id="deployHost" data-width="15%">部署服务器</th>
<th data-column-id="beginTime" data-width="10%" data-converter="datetime">生效时间</th>
<th data-column-id="endTime" data-width="10%" data-converter="datetime">失效时间</th>
<th data-column-id="status" data-width="5%" data-converter="showStatus">状态</th>
<th data-column-id="commands" data-formatter="commands"
    data-sortable="false" data-width="8%">编辑|删除
</th>