<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
    <div class="row">
        <div id="content" class="col-lg-12">
            <!-- PAGE HEADER-->
            <%@include file="../common/common-breadcrumb.jsp" %>
            <div class="row">
                <div class="col-md-12">
                    <!-- BOX -->
                    <div class="box border blue">
                        <div class="box-title">
                            <h4><i class="fa fa-table"></i>角色信息</h4>
                        </div>
                        <%@include file="../common/common-menubar.jsp" %>
                        <div class="box-body">
                            <div id="contentDiv">
                                <div class="box-body">
                                    <div class="form-group" style="margin-bottom:10px;position:inherit"
                                         id="searchBox">
                                        <div class="col-md-2">
                                            <input class="form-control" id="roleName" name="roleName" placeholder="角色名称"/>
                                        </div>
                                        <div class="col-md-2">
                                            <input class="form-control" id="roleDesc" name="roleDesc" placeholder="角色描述"/>
                                        </div>
                                        <div class="col-md-2">
                                            <%@include file="../common/common-status-select.jsp" %>
                                        </div>
                                        <div class="col-md-2">
                                            <%@include file="../common/common-searchBtn.jsp" %>
                                        </div>
                                    </div>
                                    <table id="roleListTable" class="table table-bordered table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <%@include file="tableList.jsp" %>
                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /BOX -->
                </div>
            </div>
            <%@include file="../common/common-back2top.jsp" %>
        </div>
        <!-- /CONTENT-->
    </div>
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    编辑记录
                </h4>
            </div>
            <div class="modal-body">
                <%@include file="form.jsp" %>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div class="modal fade " id="usersModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title pull-left" id="myModalLabel">关联用户信息</h4>
            </div>
            <div class="modal-body">
                <%@include file="usersList.jsp" %>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/app/role/role.js"></script>
