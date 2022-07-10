<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"> </script>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  .dropdown-check-list {
  display: inline-block;
}

.dropdown-check-list .anchor {
  position: relative;
  cursor: pointer;
  display: inline-block;
  padding: 5px 50px 5px 10px;
  border: 1px solid #ccc;
}

.dropdown-check-list .anchor:after {
  position: absolute;
  content: "";
  border-left: 2px solid black;
  border-top: 2px solid black;
  padding: 5px;
  right: 10px;
  top: 20%;
  -moz-transform: rotate(-135deg);
  -ms-transform: rotate(-135deg);
  -o-transform: rotate(-135deg);
  -webkit-transform: rotate(-135deg);
  transform: rotate(-135deg);
}

.dropdown-check-list .anchor:active:after {
  right: 8px;
  top: 21%;
}

.dropdown-check-list ul.items {
  padding: 2px;
  display: none;
  margin: 0;
  border: 1px solid #ccc;
  border-top: none;
}

.dropdown-check-list ul.items li {
  list-style: none;
}

.dropdown-check-list.visible .anchor {
  color: #0094ff;
}

.dropdown-check-list.visible .items {
  display: block;
}
    .no-gutters {
      margin-right: 0;
      margin-left: 0;

    > .col,
    > [class*="col-"] {
      padding-right: 0;
      padding-left: 0;
    }
    }

    .container {
      padding: 0.5rem;
    }
    .cell {
      min-height: 100px;
      margin: 1rem;
    }
    .cell__big {
      height: auto;
      display: flex;
      height: calc(100% - 2rem);
    }
  </style>

  
</head>
<body>

<fieldset class="form-group border p-3">

  <form action="/cpdsavemethode" method="post"  id="formData">
  
  
  <legend style="color: orangered" class="w-auto px-2" >Claim Processing Doctor</legend>
  
     <div class="container">
  <div class="row">
    <div class="col-sm">
     <label for="address" class="form-label">Doctors Name <span class="text-danger">*</span></label>
     <input  id="docName" type ="text" class="form-control" rows="5" maxlenghth="50" name ="dcName" placeholder ="Enter your Name" >
    </div>
    <div class="col-sm">
    <label for="address" class="form-label">Doctor Type <span class="text-danger">*</span></label>
                <select id="doctype"   name ="dcType" class="form-control" >
	<option value="null">--select--</option>
                <option value="private">Private</option>
                 <option value="public">Public</option>
                 <option value="other">other</option>
                </select>            
    </div>
    <div class="col-sm">
      <label for="address" class="form-label">Dob <span class="text-danger">*</span></label>
                <input type ="date" id="dob" name ="dob" class="form-control" rows="5" >
       
    </div>
  </div>
</div>
  
     <div class="container">
  <div class="row">
    <div class="col-sm">
     <label for="address" class="form-label">Mobile Number <span class="text-danger">*</span></label>
       <input  id="mobile" type="number" name ="mobile" class="form-control" rows="5" placeholder ="Enter Mobile Number " >
    </div>
    <div class="col-sm">
      <label for="address" class="form-label">Procedure <span class="text-danger">*</span></label>
                <select id="procedure"  name ="proc"class="form-control" rows="5" onchange="packageData()">
                    <option value ="null" selected hidden >Select</option>
                   <c:forEach items="${procedureList}" var="prcdre" >
                    <option value="${prcdre.packageCategoryName}">${prcdre.procedureName}</option>
                   </c:forEach>
                   
         
                
                </select>            
    </div>
        <div class="col-sm">
      <label for="address" class="form-label">Package <span class="text-danger">*</span> </label>
                <select id="package"  name ="pack"class="form-control">
<%--                <option value ="null" selected hidden >Select</option>--%>
                </select>            
    </div>
                 
  
     <div class="container">
  <div class="row">
    <div class="col-sm">
     <label for="address" class="form-label">Date of joining <span class="text-danger">*</span></label>
                <input type ="date" id="doj" name ="dateofjoinng"class="form-control" rows="5" >
    </div>
    <div class="col-sm" id="status">
         <label for="address" class="form-label">Active <span class="text-danger">*</span></label><br>
Yes<input type="radio" name="Active" id="act" value="yes">
No<input type="radio" name="Active" id="act" value="No">
	    </div>
    <div class="col-sm">
     <label for="address" class="form-label">Hospital Tagged</label><br>
               <div id="list1"  class="dropdown-check-list" tabindex="100"   >
  <span class="anchor">Select Hospital </span>
  <ul class="items">
  <c:forEach items="${cpaCpdhospitataggedList}" var="e" varStatus="counter">
                  <li><input type="checkbox" class="hspname" name ="Multiplehospital" id="hsp${e.cpdhospid}" value="${e.cpdhospid}" >${e.cpdhospName}</li>
                </c:forEach>
  </ul>
</div>
    </div>
  </div>
</div>
  
   <div class="col-md-12" style="margin-left: 40rem;">
 <!--   <button type="button" class="btn btn-primary" onclick="submitData()">Submit</button>
  <button type="button" class="btn btn-warning" onclick="this.form.reset()">Reset</button>  -->
  
  
   	<input type="button" value="submit"  id="sub" onclick="saveData()" class="btn btn-primary">&nbsp;
	<input type="reset" value="Reset" class="btn btn-warning" onclick="this.form.reset()">
   </div>
  
</form>
  </body>
  
  <script type="text/javascript">
  
  var checkList = document.getElementById('list1');
  checkList.getElementsByClassName('anchor')[0].onclick = function(evt) {
    if (checkList.classList.contains('visible'))
      checkList.classList.remove('visible');
    else
      checkList.classList.add('visible');
  }
  </script>
  

  </html>
  
  
  
  
  <script>
   function saveData() {
	   var docName = $('#docName').val();
	   var docType = $('#doctype').val();
	   var dob = $('#dob').val();
	   var mobile = $('#mobile').val();
	   var doj = $('#doj').val();
	   var aplhaRegX = /^[a-zA-Z ]+$/;
	   var status = $("input[type='radio'][name='Active']:checked").val();;
	   if(docName == "" || docName == null){
		   alert("Doctor Name Must Not Be Empty!");
		   $('#docName').focus();
	   }else if(docName.length < 4 || docName.length > 50){
		   alert("Doctor Name Must Not Be Less Than 4 and Greater than 50.");
		   $('#docName').focus();
	   }else if(!docName.match(aplhaRegX)){
		   alert("Doctor Name Must Not Contains Only Alphabets!.");
		   $('#docName').focus();
	   }else if(docType == "null"){
		   alert("Doctor Type Must Select!");
		   $('#doctype').focus();
	   }else if(dob == "" || dob == null){
		   alert("Date of Birth Must Select!")
		   $('#dob').focus();
	   }else if(new Date(dob) > new Date()){
		   alert("Date of Birth Must Not Be Greater Than Today's Date!");
		   $('#dob').focus();
	   }else if(mobile == "" || mobile == null){
		   alert("Mobile Number Must Not be Empty!");
		   $('#mobile').focus();
	   }else if(mobile.length != 10){
		   alert("Mobile Number Must Be 10 Digits!");
		   $('#mobile').focus();
	   }else if(doj == "" || doj == null){
		   alert("Date of Join Must Select!")
		   $('#doj').focus();
	   }else if(new Date(doj) > new Date()){
		   alert("Date of Join Must Not Be Greater Than Today's Date!");
		   $('#dob').focus();
	   }else if(status == "" || status == null){
		   alert("Active Status Must Select!");
	   }else{
		   $('#formData').submit();
	   }
	}
  </script>
<script>
    function packageData(){
        $.ajax({
            url : "getPackageData/"+$('#procedure').val(),
            type : "GET",
            success : function (result){
                var result = JSON.parse(result);
                var s = '';
                for(var i = 0; i < result.length; i++) {
                    var id = s += '<option value="' + result[i].packId + '">' + result[i].packageName + '</option>';
                }
                $('#package').html(s);
            }
        });
    }
</script>
  
  
  
  