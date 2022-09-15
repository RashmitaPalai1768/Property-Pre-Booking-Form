<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:if test="${status ne Empty}">
	<script>
	alert("<c:out value='${status}'/>");
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://getbootstrap.com/2.3.2/assets/js/bootstrap.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>

  
  
</head>
<body style="background-color: pink">
<div style="margin-left: 30px">
<button><a href="/">Add</a></button>
<button><a href="/view">view</a></button>
</div>
<h1 style="color: red; text-align: center;">Property Pre-Booking Form</h1>
<form action="/save" method="post" id="submitFrom" enctype="multipart/form-data">
 <div class="form-row" style="margin-top: 20px; margin-left: 25px;">
    <div class="form-group col-md-3">Housing Project
	<select class="form-select" aria-label="Default select example"	
			onchange="findHousingProId(this.value)" name="housing_id" id="housing_id">
			<option selected>-select-</option>			
 		<c:forEach items="${cc}" var="con">
				<option value="${con.housing_id}">${con.housingProjectName}</option>
		</c:forEach> 
</select>
</div>
<div class="form-group col-md-3">Property Type
	<select class="form-select" aria-label="Default select example" name="Property_id" id="Property_id"  onchange="return findCost()">
		<option selected>-select-</option>
			<c:forEach items="${ss}" var="sts">
				<option value="${sts.Property_id}">${sts.PropType}</option>
			</c:forEach>
</select>
</div>
<div class="form-group col-md-3">Property Cost
	<input type="number" name="pcost" id="tcost">

</div>
</div>
  <div class="form-row" style="margin-top: 20px; margin-left: 25px;">
    <div class="form-group col-md-3">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" max="3"  id="name1" name="name" placeholder="Enter Name">
    </div>
    <div class="form-group col-md-3">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="email1" name="email" placeholder="Enter email">
    </div>
    <div class="form-group col-md-3">
      <label for="inputEmail4">Mobile No.</label>
      <input type="text" class="form-control" id="mob1" name="mob" placeholder="Enter mob No.">
    </div>
  </div>
  
  <div class="form-row" style="margin-top: 20px; margin-left: 25px;">
    <div class="form-group col-md-3">
      <label for="inputEmail4">DOB</label>
      <input type="date" class="form-control" id="dob1" name="dob">
    </div>
    <div class="form-group col-md-3">
      <label for="inputEmail4">Gender</label><br>
     &nbsp;&nbsp;&nbsp; <input type="radio" name="gender" id="gender" checked value="Male">Male
  	 <input type="radio" name="gender" id="gender1" value="Female">Female
      </div>
    <div class="form-group col-md-3">
      <label for="inputEmail4">UploadPath</label>
      <input type="file" name="dscertificate1"
			id="dscertificate" class="form-control" style="width: 290px"
			onchange="fileValidation()"></div>
  </div>
 <div class="form-row" style="margin-top: 20px; margin-left: 305px;">
    <div class="form-group col-md-3">
  <button type="submit" class="submit" onclick="return abc()" style="background-color: blue">submit</button>
  <input type="reset"  id="res" value="Reset" style="background-color: red">
	</div>
	</div>
</form>

<script>
		
</script>
<script>
function fileValidation() {
	//alert("adsfdfgfdbsgafdfg")
	var fileInput = document.getElementById('dscertificate');
	
	var filePath = fileInput.value;

	// Allowing file type
	var allowedExtensions = /(\.pdf|\.png|\.jpeg)$/i;
	//var allowedExtensions = /(\.jpg|\.jpeg|\.pdf)$/i;

	if (!allowedExtensions.exec(filePath)) {
		 /* BootstrapAlert('Please select a valid pdf file only',
				'dscertificate');
		fileInput.value = '';  */
		alert('Invalid file type!! Please select a valid  file only');
        fileInput.value = '';
		return false;
	}else if (fileInput.files.length > 0) {
        for (const i = 0; i <= fileInput.files.length - 1; i++) {
            
            const fsize = fileInput.files.item(i).size;
            const file = Math.round((fsize / 1024));
            // The size of the file.
            if (file >= 500) {
            	alert('File size should not exceed 500 KB','dscertificate');
            	fileInput.value = '';
            	return false;
            }  /* else if (file < 1024) {
            	BootstrapAlert("File too small, please select a file greater than 2mb",'dscertificate');
            	return false;
            }   */
        }
    }
}
</script>
<script type="text/javascript">
   //Find Property type Through Housing Project
		function findHousingProId(housing_id){
			//alert("fghj");

			$.ajax({
				type : "GET",
				url : "find-housing-Id.htm",

				data : {
					"housing_id" : housing_id

				},
				success : function(response) {

					//alert(response);
					var html = "<option value=''>---Select---</option>";
					var val = JSON.parse(response);

					if (val != "" || val != null) {
						$.each(val, function(index, value) {
							html = html + "<option value="+value.prop_id+" >"
									+ value.prop_name + "</option>";
						});
					}
					$('#Property_id').empty().append(html);
					
				},
				error : function(error) {

				}
			});
			}

	//Find Cost
		function findCost1(Property_id) {
			//alert("State-ID= "+state_id);		
			$.ajax({
				type : "GET",
				url : "find-Property_id.htm",

				data : {
					"Property_id" : Property_id

				},
				success : function(response) {

					//alert(response);
					
					var val = JSON.parse(response);

					if (val != "" || val != null) {
						$.each(val, function(index, value) {
							html = html
									+ "<option value="+value.Property_id+" >"
									+ value.totalcost + "</option>";
						});
					}
					//$('#district_id').empty().append(html);

				},
				error : function(error) {

				}
			});
		}
</script>
<script>
//Find Cost
		function findCost(){
			//alert("kl");
			var Property_id=$("#Property_id").val();
			var housing_id=$("#housing_id").val();
			
			//alert(duration+"---"+subType)
			$.ajax({
				type: "post",
				 url: "find-cost.htm",
				data:{
					"Property_id":Property_id,
					"housing_id" :housing_id
					},				
			success : function(response) {
				 $("#tcost").val(response);
			},error : function(error){
				}
			});
			}
	</script>
	
	
<script type="text/javascript">

function getAge(DOB) {
	   var today = new Date();
	   var birthDate = new Date(DOB);
	   var age = today.getFullYear() - birthDate.getFullYear();
	   var m = today.getMonth() - birthDate.getMonth();
	   if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
	       age--;
	   }    
	   return age;
	}

function abc(){

		var pname = $('#name1').val();
		var email = $('#email1').val();		
		var vv = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
		var mob1 = $('#mob1').val();
		 var phoneno = /^\d{10}$/;
		if (pname == '') {
			alert(" name Cant  be left blank");
			$('#name1').focus();
			return false;
		}if (pname != '' ) {
			if(pname.length <= 3){
			   alert('Your first name cant be less than 3');
			   $('#name1').focus();
				return false;
			}
		}  if (email == '') {
			alert("email shouldn't be blank");
			$('#email1').focus();
			return false;
		}
		 if (email != '') {
			if (!email.match(vv)) {
				alert("invalid emailId please fill the correct email Id");
				$('#email1').focus();
				return false;
			}
			
		} 
		 if (mob1 == '') {
				alert("mobile shouldn't be blank");
				$('#mob1').focus();
				return false;
			}
			 if (mob1 != '') {
				if (!mob1.match(phoneno)) {
					alert("invalid mobile no fill the correct mobile no");
					$('#mob1').focus();
					return false;
				}
				
			} 
				if($("#dob1").val()!=''){
				           var age=getAge($("#dob1").val());
				           if(age<18){
				             alert('Choose Proper date So that your age is greater than 18')
				             $("#dob1").focus();
				             return false;
				               }
				}
		var flag=window.confirm("Are you sure!! You want to Save the data??");
        if(flag== true){
           // alert("Data save Succesffuly");
            return true;
        }else{
            return false;
        }

       
	}
</script>

</body>
</html>