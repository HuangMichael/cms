<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">作品名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="memberWorks.id" type="hidden" />
                    <input class="form-control" id="name" name="name" v-model="memberWorks.name" />
                </div>
                <label for="photoUrl" class="col-md-2 control-label">作品照片</label>
                <div class="col-md-4">
                    <input class="form-control" id="photoUrl" name="photoUrl" v-model="memberWorks.photoUrl"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="isFocus" class="col-md-2 control-label">是否焦点</label>
                <div class="col-md-4">
                    <input class="form-control" id="isFocus" name="isFocus" v-model="memberWorks.isFocus" />
                </div>
                <label for="releaseTime" class="col-md-2 control-label">发布时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="releaseTime" name="releaseTime" v-model="memberWorks.releaseTime"
                           onload="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                           required/>
                </div>
            </div>
            <div class="form-group">
                <label for="uploadTime" class="col-md-2 control-label">上传时间</label>
                <div class="col-md-4">
                    <input class="form-control" id="uploadTime" name="uploadTime" v-model="memberWorks.uploadTime"
                           onload="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:false})"
                           required/>
                </div>

                <label for="worksType" class="col-md-2 control-label">作品类型</label>
                <div class="col-md-4">
                    <input class="form-control" id="worksType" name="worksType" v-model="memberWorks.worksType"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="memberId" class="col-md-2 control-label">会员</label>
                <div class="col-md-4">
                    <input class="form-control" id="memberId" name="member.id" v-model="memberWorks.member.id"  required/>
                </div>
                <label for="unitId" class="col-md-2 control-label">协会</label>
                <div class="col-md-4">
                    <input class="form-control" id="unitId" name="unit.id" v-model="memberWorks.unit.id"  required/>
                </div>
            </div>
            <div class="form-group">
                <label for="sortNo" class="col-md-2 control-label">排序</label>
                <div class="col-md-4">
                    <input class="form-control" id="sortNo" name="sortNo" v-model="memberWorks.sortNo"  required/>
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <input class="form-control" id="status" name="status" v-model="memberWorks.status" />
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