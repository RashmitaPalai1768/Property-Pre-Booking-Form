<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />

<!-- jQuery library file -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js">
	
</script>

<!-- Datatable plugin JS library file -->
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js">
	
</script>
<style>
.dataTables_info {
	text-align: right;
	margin: 5px 0;
}

.dataTables_paginate {
	display: block;
	text-align: right;
}

.paginate_button {
	display: inline-block;
	padding: 5px 10px;
	background: #fff;
	color: #333;
	transition: .2s;
}

.paginate_button:hover {
	background: #eee;
}

.paginate_button.current {
	display: inline-block;
	padding: 5px 10px;
	background: #4285f4;
	color: #fff;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12);
}
</style>

<style>
.dataTables_filter {
	float: right;
}

.dataTables_length {
	float: left;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xls/0.7.4-a/xls.core.min.js"></script>

</head>
<body style="background-color: pink">

<div style="margin-left: 30px">
<button><a href="/">Add</a></button>
<button><a href="/view">view</a></button>
</div>

		
		<h1 style="color: red; text-align: center;">Registration Details</h1>
		<div class="form-row" style="margin-top: 20px; margin-left: 25px;">
    <div class="form-group col-md-3">Housing Project
	<select class="form-select" aria-label="Default select example"	
			 name="housing_id1" id="housing_id1">
			<option value="">-select-</option>			
 		<c:forEach items="${cc}" var="con">
 		<c:choose>
						<c:when test="${con.housing_id eq classData}">
							<option value="${con.housing_id}" selected="selected">${con.housingProjectName}</option>
						</c:when>
						<c:otherwise>
							<option value="${con.housing_id}">${con.housingProjectName}</option>
						</c:otherwise>
					</c:choose>
				
		</c:forEach> 
</select>

</div>
		<%-- Property Type: <select class="form-select"
			aria-label="Default select example">
			<option selected>-select-</option>
			<c:forEach items="${pp}" var="sts1">
			<c:choose>
						<c:when test="${con.housing_id eq classData}">
							<option value="${sts1.Property_id}" selected="selected">${sts1.PropType}</option>
						</c:when>
						<c:otherwise>
							<option value="${con.housing_id}">${sts1.PropType}</option>
						</c:otherwise>
					</c:choose>
				<option value="${sts1.Property_id}">${sts1.PropType}</option>
			</c:forEach> --%>
		</select> <input type="submit" value="search" style=" background-color: blue" onclick="return search();">
</div>
	 

<br>	
	<div class="table-responsive" id="viewTable">
		<!-- <table class="table table-bordered table-sm table-striped"> -->
		<table class="mytable table table-bordered table-sm table-striped"
			id="dTable" border=1>
			<thead>
				<tr>
					<th width="40" class="text-center">Sl#</th>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile No</th>
					<th>Age</th>
					<th>Reg Date</th>
					<th>Document</th>
					<th>Housing Project</th>
					<th>Property Type</th>
					<!--  <th>check</th> -->
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${vv}" varStatus="status" var="vv1">
					<tr>
						<td>${status.count}</td>
						<td>${vv1.applicant_name}</td>
						<td>${vv1.email}</td>
						<td>${vv1.mob}</td>
						<td></td>
						<td><%-- ${vv1.dob} --%><fmt:formatDate type="date"  pattern = "dd-MM-yyyy"  value="${vv1.dob}" /></td>
						<td><a href="/download/${vv1.preBook_id}">${vv1.preBook_id}</a></td>
						<td>${vv1.housing_id.housingProjectName}</td>	
						 <td><%-- ${vv1.Property_id1.PropType} --%></td>		
						 
						 <%-- <td>${status.count}</td>
						 <td>${vv1[1]}</td>
						 <td>${vv1[2]}</td>
						 <td>${vv1[3]}</td>
						 <td>${vv1[4]}</td>
						 <td>${vv1[5]}</td>
						 <td>${vv1[6]}</td>	
						  <td>${vv1[7]}</td>	
						   <td>${vv1[8]}</td>	 --%>		
					</tr>
				</c:forEach>
			</tbody>
		</table>

		
	</div>
	
</body>

<script>
	/* Initialization of datatable */
	$(document).ready(function() {
		$('#dTable').DataTable({
			//pageLength : 5,
			lengthMenu:[5,10,25,50,100],
			paging : true,
			searching : true,
			order : [ [ 0, "asc" ] ],
			columnDefs : [ {
				orderable : true,
				targets : [ 3 ]
			} ]

		});
		
	});
</script>
	
<script type="text/javascript">

	function search(){
		alert("tyhuj");
		var nn=$("#housing_id1").val();
		//var nn1=$("#Property_id").val();
		alert(nn);
		$("#housing").val(nn);
		//$("#Property_id").val(nn1);
		$("#searchForm").submit();
		}

	
</script>
<form action="searchReport" id="searchForm" method="POST">
			<input type="hidden" name="housing" id="housing">			
	</form>
</html>