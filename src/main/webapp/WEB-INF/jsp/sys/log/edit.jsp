<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<div class="main-content">
    <div class="main-content-inner">
        <%@include file="/WEB-INF/common/AdminLTE/breadcrumb.jsp" %>
        <div class="page-content">
            <form id="addForm" class="form-horizontal" role="form" method="post">
                <input type="hidden" name="id" value="${obj.id}">
                    <div class="form-group">
                        <label class="col-xs-3 control-label no-padding-right">
                            对象id<span style="color: red;">*</span>
                        </label>
                        <div class="col-xs-9">
                            <input type="text" name="objId" value="${obj.objId}" class="col-xs-10 col-sm-5">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label no-padding-right">
                            类别<span style="color: red;">*</span>
                        </label>
                        <div class="col-xs-9">
                            <input type="text" name="category" value="${obj.category}" class="col-xs-10 col-sm-5">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label no-padding-right">
                            动作<span style="color: red;">*</span>
                        </label>
                        <div class="col-xs-9">
                            <input type="text" name="action" value="${obj.action}" class="col-xs-10 col-sm-5">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label no-padding-right">
                            处理内容<span style="color: red;">*</span>
                        </label>
                        <div class="col-xs-9">
                            <input type="text" name="content" value="${obj.content}" class="col-xs-10 col-sm-5">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-3 control-label no-padding-right">
                            详细
                        </label>
                        <div class="col-xs-9">
                            <input type="text" name="detail" value="${obj.detail}" class="col-xs-10 col-sm-5">
                        </div>
                    </div>

                <div class="space-4"></div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <c:if test='${page ne "view"}'>
                            <button class="btn btn-info" type="button" onclick="saveForm()">
                                <i class="ace-icon fa fa-check bigger-110"></i>
                                保存
                            </button>
                        </c:if>
                        <button type="button" class="btn btn-grey" onclick="history.back()">
                            <i class="ace-icon fa fa-arrow-left bigger-110"></i>
                            返回
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    <c:if test = '${page eq "view"}'> 
      $('input').attr("readonly", "readonly");
      $('input').attr("disabled", "disabled");
    </c:if>
    function saveForm() {
        var form = $("#addForm");
        form.attr("action", "sys/log/save");
        form.ajaxSubmit({
            success: function (result) {
                if (result && result.success) {
                    location.href = "${contextPath}/sys/log/home";
                } else {
                    layer.msg(result.msg);
                }
            }, error: function () {
                layer.msg("网络异常，请稍候再试！");
            }
        });
    }
</script>
