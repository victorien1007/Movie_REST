<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<c:set var="currentuserOrg" value="${sessionScope.currentOrg.orgId}"/>
<c:set var="currentuserOrgName" value="${sessionScope.currentOrg.orgName}"/>
<div id="createDialog" class="crudDialog">
	<form id="createForm" method="post">
		<div class="form-group">
			<label for="title">电影标题</label>
			<input id="title" type="text" class="form-control" name="title" maxlength="20">
		</div>
		<div class="form-group">
			<label for="director">导演</label>
			<input id="director" type="text" class="form-control" name="director" maxlength="32">
		</div>
		<div class="form-group">
			<label for="actors">主要演员</label>
			<input id="actors" type="text" class="form-control" name="actors">
		</div>
		<div class="form-group">
			<label for="language">语言</label>
			<input id="language" type="text" class="form-control" name="language">
		</div>
		<div class="form-group">
			<label for="startdate">开始时间</label>
			<input id="startdate" type="text" class="form-control" name="startdate">
		</div>
		<div class="form-group">
			<label for=enddate>结束时间</label>
			<input id="enddate" type="text" class="form-control" name="enddate" maxlength="20">
		</div>
		<div class="form-group">
			<label for="addcity">城市</label>
			<input id="addcity" type="text" class="form-control" name="addcity" maxlength="50">
		</div>
		<div class="form-group">
			<label for="days">天数</label>
			<input id="days" type="text" class="form-control" name="days" maxlength="50">
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="createSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="createDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
function createSubmit() {
		var title = $("#title").val();
		var director = $("#director").val();
		var actors = $("#actors").val();
		var language = $("#language").val();
		var startdate = $("#startdate").val();
		var enddate = $("#enddate").val();
		var city = $("#addcity").val();
		var days = $("#days").val();
		var data = {
			"title" : title,
			"director" : director,
			"actors" : actors,
			"language" : language,
			"startdate" : startdate,
			"enddate" : enddate,
			"city" : city,
			"days" : days
		};
		var requestURL = "/movieProject/movie/addMovie";
		$.ajax({
			type : "POST",
			url : requestURL,
			data : JSON.stringify(data),
			cache : false,
			dataType : "json",
			contentType : "application/json",
			success : function(resultData, textStatus) {
				createDialog.close();
				searchBtnSubmit();
			}
		});

}
</script>