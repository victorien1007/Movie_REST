<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<c:set var="currentuserOrg" value="${sessionScope.currentOrg.orgId}"/>
<c:set var="currentuserOrgName" value="${sessionScope.currentOrg.orgName}"/>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>电影列表管理</title>
	<jsp:include page="/templates/head.jsp" flush="true"/>
	<script type="text/javascript" src="data.js"></script>
</head>
<body>
<div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增电影</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑电影</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction_user()"><i class="zmdi zmdi-close"></i> 删除电影</a>
	</div>
	<div class="form-inline pull-right">
         <input id="city" type="text" class="form-control" name="city" placeholder="请选择城市">
         <button id="searchBtn" class="btn btn-success" onclick="search()" style="margin-left:10px">查询</button>
    </div>
	<table id="table"></table>
</div>
<jsp:include page="/templates/footer.jsp" flush="true"/>
<script>
var selectedOrgName;
var selectedOrgId;
var $table = $('#table');
$(function() {
	searchBtnSubmit();
});
// 格式化操作按钮
function updateactionFormatter(value, row, index) {
    return [
    '<a id="updatecell" href="javascript:;" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
    '<a id="deletecell" class="delete" href="javascript:;" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');	
}

window.operateEvents = {
	"click #updatecell":function(e,value,row,index){
		updateDialog = $.dialog({
			animationSpeed: 300,
			title: '编辑用户',
			content: 'url:${basePath}/authority/xtuser/update/' + row.userId,
			onContentReady: function () {
				initMaterialInput();
			}
		});
	},
	"click #deletecell":function(e,value,row,index){
		var content = '确认删除该用户吗？';
		var url = '${basePath}/movie/deleteMovie/' + row.id;
		deleteAction(content,url,null);
	}
}

// 格式化图标
function avatarFormatter(value, row, index) {
    return '<img src="${basePath}' + value + '" style="width:20px;height:20px;"/>';
}

// 新增
var createDialog;
function createAction() {
	createDialog = $.dialog({
		animationSpeed: 300,
		title: '新增电影',
		content: 'url:${basePath}/create.jsp',
		onContentReady: function () {
			initMaterialInput();
		}
	});
}
// 编辑
var updateDialog;
function updateAction() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length != 1) {
		$.confirm({
			title: false,
			content: '请选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		
	var data = rows[0].id+"#"+rows[0].title +"#"+rows[0].director +"#"+ rows[0].actors+"#"+rows[0].language +"#"+rows[0].startdate+"#"+ rows[0].enddate+"#"+rows[0].city+"#"+rows[0].days;
		
		setdata(data);
		
// 		alert(rows[0].title);
// 		alert(rows[0].director);
// 		alert(rows[0].actors);
// 		alert(rows[0].language);
// 		alert(rows[0].startdate);
// 		alert(rows[0].enddate);
// 		alert(rows[0].city);
// 		alert(rows[0].days);
		
		updateDialog = $.dialog({
			animationSpeed: 300,
			title: '编辑电影',
			content: 'url:${basePath}/update.jsp',
			onContentReady: function () {
				initMaterialInput();
			}
		});
	}
}
//删除
var deleteDialog;
function deleteAction_user() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		var content = '确认删除该用户吗？';
		var ids = new Array();
		for (var i in rows) {
			ids.push(rows[i].id);
		}
		var url = '${basePath}/movie/deleteMovie/' + ids.join("-");
		$.ajax({
			type : "DELETE",
			url : url,
			async : false,
			dataType : "json",
			success : function(resultData, textStatus) {
				searchBtnSubmit();
			},
			error : function(data) {
				alert("error");
			}
		});
	}
}



function searchBtnSubmit(){
	$table.bootstrapTable('destroy');
	$table.bootstrapTable({
		url: '${basePath}/movie/allmovies',
		height: getHeight(),
		striped: true,
		minimumCountColumns: 2,
		clickToSelect: true,
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: true,
		paginationLoop: false,
		sidePagination: 'server',
		silentSort: false,
		smartDisplay: false,
		escape: true,
		idField: 'id',
		searchOnEnterKey: true,
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
			{field: 'id', title: '编号', align:'center'},
            {field: 'title', title: '标题'},
			{field: 'language', title: '语言'},
			{field: 'director', title: '导演'},
			{field: 'actors', title: '主要演员'},
			{field: 'startdate', title: '开始时间'},
			{field: 'enddate', title: '结束时间'},
			{field: 'city', title: '所在城市'},
			{field: 'days', title: '天数'},
			{field: 'Button', title: '操作', align: 'center', events:'operateEvents', formatter: 'updateactionFormatter', clickToSelect: false},
		]
	});
}

function search(){
	var search = document.getElementById('city').value;
	if(search === ''){
		search = null;
	}
	$table.bootstrapTable('destroy');
	$table.bootstrapTable({
		url: '${basePath}/movie/search/city/'+search,
		height: getHeight(),
		striped: true,
		minimumCountColumns: 2,
		clickToSelect: true,
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: true,
		paginationLoop: false,
		sidePagination: 'server',
		silentSort: false,
		smartDisplay: false,
		escape: true,
		idField: 'id',
		searchOnEnterKey: true,
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
			{field: 'id', title: '编号', align:'center'},
            {field: 'title', title: '标题'},
			{field: 'language', title: '语言'},
			{field: 'director', title: '导演'},
			{field: 'actors', title: '主要演员'},
			{field: 'startdate', title: '开始时间'},
			{field: 'enddate', title: '结束时间'},
			{field: 'city', title: '所在城市'},
			{field: 'Button', title: '操作', align: 'center', events:'operateEvents', formatter: 'updateactionFormatter', clickToSelect: false},
		]
	});
}

</script>
</body>
</html>