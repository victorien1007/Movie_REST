<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<c:set var="currentuserOrg" value="${sessionScope.currentOrg.orgId}"/>
<c:set var="currentuserOrgName" value="${sessionScope.currentOrg.orgName}"/>
<script type="text/javascript" src="data.js"></script>

<div id="updateDialog" class="crudDialog">
	<form id="updateForm" method="post">
		<div class="form-group">
			<input id="id" type="text" class="form-control" name="id" maxlength="50" value="${film.id}" style="display:none">
		</div>
		<div class="form-group">
			<label for="title">电影标题</label>
			<input id="title" type="text" class="form-control" name="title" maxlength="50" value="${film.title}">
		</div>
		<div class="form-group">
			<label for="director">导演</label>
			<input id="director" type="text" class="form-control" name="director" maxlength="20" value="${film.director}">
		</div>
		<div class="form-group">
			<label for="actors">主要演员</label>
			<input id="actors" type="text" class="form-control" name="actors" value="${film.actors}">
			<input id="res_Id" type="text" class="form-control" name="res_Id" maxlength="20" value="${user.xtResource.resId}" style="display:none">
		</div>
		<div class="form-group">
			<label for="language">语言</label>
			<input id="language" type="text" class="form-control" name="language" value="${film.language}">
			<input id="org_Id" type="text" class="form-control" name="org_Id" maxlength="20" style="display:none" value="${user.xtOrganization.orgId}">
		</div>
		<div class="form-group">
			<label for="startdate">开始时间</label>
			<input id="startdate" type="text" class="form-control" name="startdate" value="${film.startdate}">
			<input id="dept_Id" type="text" class="form-control" name="dept_Id" maxlength="20" style="display:none" value="${user.xtDept.deptId}">
		</div>
		<div class="form-group">
			<label for="enddate">结束时间</label>
			<input id="enddate" type="text" class="form-control" name="enddate" maxlength="20" value="${film.enddate}">
		</div>
		<div class="form-group">
			<label for="city1">城市</label>
			<input id="city1" type="text" class="form-control" name="city" maxlength="50" value="${film.city}">
		</div>
		<div class="form-group">
			<label for="days">天数</label>
			<input id="days" type="text" class="form-control" name="days" maxlength="50" value="${film.days}">
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
var id;
var data = getdata();
id = data.split("#")[0];
document.getElementById("id").value = data.split("#")[0];

document.getElementById("title").value = data.split("#")[1]; 
document.getElementById("director").value = data.split("#")[2]; 
document.getElementById("actors").value = data.split("#")[3]; 
document.getElementById("language").value = data.split("#")[4]; 
document.getElementById("startdate").value = data.split("#")[5]; 
document.getElementById("enddate").value = data.split("#")[6]; 
document.getElementById("city1").value = data.split("#")[7]; 
document.getElementById("days").value = data.split("#")[8]; 


function updateSubmit() {
	var title = $("#title").val();
	var director = $("#director").val();
	var actors = $("#actors").val();
	var language = $("#language").val();
	var startdate = $("#startdate").val();
	var enddate = $("#enddate").val();
	var city = $("#city1").val();
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
	var requestURL = "/movieProject/movie/updateMovie/"+id;
	$.ajax({
		type : "PUT",
		url : requestURL,
		data : JSON.stringify(data),
		cache : false,
		dataType : "json",
		contentType : "application/json",
		success : function(resultData, textStatus) {
			updateDialog.close();
			searchBtnSubmit();
		}
	});
}
</script>