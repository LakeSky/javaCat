<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/taglibs.jsp" %>
<div class="row">
    <div class="col-md-8 col-xs-6">
        <%@include file="/WEB-INF/common/AdminLTE/breadcrumb.jsp" %>
    </div>
    <div class="col-md-4 text-right">
        <world:hasPermission permissions="/busi/employee/add">
            <a class="btn btn-primary btn-sm no-border" href="busi/employee/add">
                <i class="ace-icon fa fa-plus"></i>添加
            </a>
        </world:hasPermission>
        <world:hasPermission permissions="/busi/employee/export">
            <a class="btn btn-primary btn-sm no-border" onclick="exportExcel();" href="javascript:void(0);">
                <i class="ace-icon fa fa-download"></i>导出
            </a>
            <form id="q_hiddenForm" method="post">
                <input type="hidden" id="params" name="params">
            </form>
        </world:hasPermission>
    </div>
    <div class="col-xs-12">
        <form class="form-inline" id="q_searchForm" method="post">
            <input name="pageIndex" type="hidden">
            <%@include file="/WEB-INF/common/AdminLTE/fragment/query-fragement.jsp" %>
            <button type="button" onclick="q_refreshDataTable()" class="btn btn-purple btn-sm no-border">
                查询
            </button>
            <button type="button" onclick="q_clearAndRefresh()" class="btn btn-info btn-sm no-border">
                清除
            </button>
            <div class="space-4"></div>
        </form>
        <world:hasPermission permissions="/busi/employee/del">
            <button type="button" class="btn btn-xs btn-primary" onclick="q_del('busi/employee/del')">批量删除</button>
        </world:hasPermission>
        <table id="q_dataTable"></table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        qx_options.url = 'busi/employee/page';
        qx_options.columns = [
            {checkbox: true},
            {
                title: '序号',
                field: '',
                align: 'center',
                formatter: function (value, row, index) {
                    var pageSize = $('#q_dataTable').bootstrapTable('getOptions').pageSize;     //通过table的#id 得到每页多少条
                    var pageNumber = $('#q_dataTable').bootstrapTable('getOptions').pageNumber; //通过table的#id 得到当前第几页
                    return pageSize * (pageNumber - 1) + index + 1;    // 返回每条的序号： 每页条数 *（当前页 - 1 ）+ 序号
                }
            },
            {title: '名字', field: 'name', align: 'center'},
            {title: '年龄', field: 'age', align: 'center'},
            {title: '生日', field: 'birthdayStr', align: 'center'},
            {title: '操作', field: 'id', align: 'center', formatter: handleRender}
        ];
        var t = $("#q_dataTable").bootstrapTable(qx_options);
        t.on('load-success.bs.table', function (e, data) {//table加载成功后的监听函数  
        });
    });


    var handleRender = function (value, row, index) {
        var btn = "";
        <world:hasPermission permissions="/busi/employee/edit">
        btn += "<a href='busi/employee/edit?id=" + row.id + "'>编辑</a> ";
        </world:hasPermission>
        <world:hasPermission permissions="/busi/employee/del">
        btn += '<a href="javascript:void(0)" onclick="q_del(\'busi/employee/del\',\'' + row.id + '\')">删除</a> ';
        </world:hasPermission>
        return btn;
    };

    function exportExcel() {
        var form = q_hiddenForm;
        form.attr("action", "busi/employee/export?fileName=Export_");
        $("#params").val(JSON.stringify(q_searchForm.serializeObject()));
        form.submit();
    }
</script>