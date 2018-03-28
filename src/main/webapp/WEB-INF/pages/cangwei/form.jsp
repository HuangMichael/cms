<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form class="form-horizontal" id="form" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <div class="form-group">
                <label for="rq" class="col-md-2 control-label"> 日期</label>
                <div class="col-md-4">
                    <input class="form-control" id="id" name="id" v-model="cangwei.id" type="hidden"/>
                    <input class="form-control" id="rq" name="rq" v-model="cangwei.rq" required/>
                </div>

                <label for="code" class="col-md-2 control-label">股票代码</label>
                <div class="col-md-4">
                    <input class="form-control" id="code" name="code" v-model="cangwei.code" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">股票名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="name" name="name" v-model="cangwei.name" required/>
                </div>

                <label for="cgs" class="col-md-2 control-label">持股数</label>
                <div class="col-md-4">
                    <input class="form-control" id="cgs" name="cgs" v-model="cangwei.cgs" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="mc" class="col-md-2 control-label">名次</label>
                <div class="col-md-4">
                    <input class="form-control" id="mc" name="mc" v-model="cangwei.mc" required/>
                </div>

                <label for="gdmc" class="col-md-2 control-label">股票名称</label>
                <div class="col-md-4">
                    <input class="form-control" id="gdmc" name="gdmc" v-model="cangwei.gdmc" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="bdbl" class="col-md-2 control-label">变动比例</label>
                <div class="col-md-4">
                    <input class="form-control" id="bdbl" name="bdbl" v-model="cangwei.bdbl" required/>
                </div>

                <label for="zj" class="col-md-2 control-label">增减</label>
                <div class="col-md-4">
                    <input class="form-control" id="zj" name="zj" v-model="cangwei.zj" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="gflx" class="col-md-2 control-label">股份类型</label>
                <div class="col-md-4">
                    <input class="form-control" id="gflx" name="gflx" v-model="cangwei.gflx" required/>
                </div>

                <label for="zltgbcgbl" class="col-md-2 control-label">流通股东持股比例</label>
                <div class="col-md-4">
                    <input class="form-control" id="zltgbcgbl" name="zltgbcgbl" v-model="cangwei.zltgbcgbl" required/>
                </div>
            </div>
            <div class="form-group">
                <label for="gdxz" class="col-md-2 control-label">股东性质</label>
                <div class="col-md-4">
                    <input class="form-control" id="gdxz" name="gdxz" v-model="cangwei.gdxz" required/>
                </div>
                <label for="status" class="col-md-2 control-label">状态</label>
                <div class="col-md-4">
                    <select class="form-control" id="status" name="status" v-model="cangwei.status" style="width:100%"
                            required>
                        <option value="1" selected>启用</option>
                        <option value="0">禁用</option>
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