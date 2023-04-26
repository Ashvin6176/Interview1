<!-- START :: BAGHEL MITKUMAR  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.mahadev.constant.Constants"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

	@media (max-width : 768px) {
		/* Firefox */
		input[type=number] {
			-moz-appearance: textfield;
		}
		
		.table thead{
			display:none;
		}
		.table,.table tbody,.table tr,.table td{
			display: block;
			width: 100%
		}
		.table tr{
			margin-bottom: 15px;
		}
		.table tbody tr td{
			text-align: left!important;
			padding-left: 50%!important;
			position: relative;
		}
		.table tbody tr td:before{
			content: attr(data-label);
			position: absolute;
			left: 0;
			width: 50%;
			padding-left: 15px;
			font-weight: 600;
			font-size: 14px;
			text-align: left;
		}	
		
	}
	.table tr th{
			text-align: center!important;
			
		}
		.btnsize{
		padding: 19px 10px;
		    font-size: 20px;
		}
	#show_user_profileTable > tbody > tr > td,
#show_user_profileTable > tbody > tr > th{
	text-align: left !important;
	letter-spacing: 1px;
}
#show_user_profileTable > tbody > tr >  th{
	width: 30% !important;
}
#show_user_profileTable > tbody > tr > th:nth-child(2) {
width: 8% !important;	
}
.modal.fade .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(.5);transform: translate(0,0)scale(.5);}
.modal.show .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(1);transform: translate(0,0)scale(1);}
	</style>
<header class="main-header">
  <a href="/HCG/main/loadDashboard" class="logo" id="logoHomeClick" style="cursor: pointer;">
    <b class="logo-mini">
      <span class="light-logo"><img src="<%=request.getContextPath()%>/resources/images/logo-light.png" alt="logo"></span>
      <span class="dark-logo"><img src="<%=request.getContextPath()%>/resources/images/logo-light.png" alt="logo"></span>
    </b>
    <span class="logo-lg">
    	<h2>Mahadev</h2>
<%-- 	    <img src="<%=request.getContextPath()%>/resources/images/logo-light-text.png" alt="logo" class="light-logo"> --%>
<%-- 	    <img src="<%=request.getContextPath()%>/resources/images/logo-dark-text.png" alt="logo" class="dark-logo">	 --%>
    </span>
    </a>
	<fmt:setBundle basename="hrms_en" var="hrmsLabels" scope="request"/>
	<fmt:setBundle basename="Config.CommonConfig" var="commonConfig" scope="application"/>
	<fmt:message bundle="${commonConfig}" key="commonAdminAndUserService" var="commonAdminAndUserService"/>
	
<div id="loader" class="screen-loader" style="display:none;  position: fixed !important ;left: 0%;top: 0%;width: 100%;height: 100%;background-color: rgba(0,0,0,.2);z-index: 99999999999">
	<div class="spinner-border" role="status">
		<img class="visually-hidden" alt="Please Wait !" id="load" src="<c:url value="/resources/images/1486.png"/>" style="width: 100px;position:absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);">
	</div>
</div>
<div id="page_loader" class="screen-loader" style="display:none;  position: fixed !important ;left: 0%;top: 0%;width: 100%;height: 100%;background-color: rgba(0,0,0,.2);z-index: 99999999999">
	<div class="spinner-border" role="status">
		<img class="visually-hidden" alt="Please Wait !" id="load" src="<c:url value="/resources/images/1486.png"/>" style="width: 100px;position:absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);">
	</div>
</div>
	
<form:form name="headerForm" id="headerPageForm" modelAttribute="trnActivityBo">
     	<input type="hidden" name="activity_id" id="userActivityId">
     	<input type="hidden" name="user_id" id="localStorage_user_id">
     		<input type="hidden" name="jwtToken" id="jwtToken">
     			<input type="hidden" name="role_id" id="localStorage_role_id">
     </form:form>
    
    <nav class="navbar navbar-static-top d-flex justify-content-between">
     
    <div class="d-flex align-items-center">
      	<a href="#" class="fa fa-bars text-white" data-toggle="push-menu" role="button">
      		<span class="sr-only">Toggle navigation</span>
      	</a>  
      	    <div style="margin-left:30px"><h1><%=Constants.PROJECT_NAME%></h1></div></div>
      	    
      	<div class="navbar-custom-menu">
        	<ul class="nav navbar-nav">
        	<li>
         		 <h5 class="text-white font-weight-bold" style="transform:translateY(130%);letter-spacing: .5px;margin-right:5px"><span style="font-style:italic">Welcome , </span> &nbsp;<span id="headerUserNameId" >ADMIN</span>&nbsp; ( <span id="headerUserRoleId" >SYSTEM ADMIN</span> )</h5>
          	</li>
          	<!-- <li>
            <a class="btn btnsize" id="goHomeLink"><i class="fa fa-home "aria-hidden="true" ></i></a>
          </li> -->
	        

	          
	          
	             <!-- <li class="dropdown user user-menu">
	            <a href="#" class="dropdown-toggle " data-toggle="dropdown" style="line-height: unset !important;">
 					Role<i class="fa fa-caret-down ml-2"  aria-hidden="true" onclick="getUserRoleByUserId();"></i>
	            </a>
	            <ul class="dropdown-menu scale-up">
	              <li class="user-body border-top-0">
	                <div class="row no-gutters" id="div_display_user_role">
		                <div class="col-12 text-left">
		                    <a >PDO</a>
		                </div>
	        			<div role="separator" class="divider col-12"></div>
	          			<div class="col-12 text-left">
	                    	<a href="#" >EO</a>
	                  	</div>        
	                </div>
	              </li>
	            </ul>
	          </li> -->
	          
		  <li class="dropdown user user-menu">
	            <a href="#" class="dropdown-toggle " data-toggle="dropdown">
<!-- 	         		<i class="fa fa-user"></i> -->
 					<img style="width: 36px;height: 36px" src="" class="float-left rounded-circle" alt="User Image" id="headerUserImageId" onerror="this.src='<%=request.getContextPath()%>/resources/images/TDS_000001.jpg';this.onerror='';">
	            <i class="fa fa-caret-down ml-2" style="transform:translateY(7px)" aria-hidden="true"></i>
	            </a>
	            <ul class="dropdown-menu scale-up">
	           
<!-- 	              <li class="user-header"> -->
<!-- 	                <img style="width: 36px;height: 36px" src="" class="float-left rounded-circle" alt="User Image" id="headerUserImageId"> -->
	               
<!-- 	              </li> -->
 			
	              <li class="user-body border-top-0">
	                <div class="row no-gutters">
		                <div class="col-12 text-left">
		                    <a href="#viewUserProfileModal" data-toggle="modal"><i class="fa fa-user"></i> My Profile</a>
		                </div>
	        			<div role="separator" class="divider col-12"></div>
	          			<div class="col-12 text-left">
	                    	<a href="#" onclick="logout();"><i class="fa fa-power-off"></i> Logout</a>
	                  	</div>        
	                </div>
	              </li>
	            </ul>
	          </li>
	          

          <!-- <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-cog"></i></a>
          </li> -->
        </ul>
      </div>
    </nav>
  </header>
  <!-- END :: BAGHEL MIT -->
  <script>
 $(".search-box a, .search-box .app-search .srh-btn").on('click', function() {
       $(".app-search").toggle(200);
   });
 </script>
 
 <!-- ***************************************************************************color-picker -->

 <script>
 
 var addButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Add","icon":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>","inner_html":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>&nbsp;&nbsp;Add"}
 var saveButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Save","icon":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>","inner_html":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>&nbsp;&nbsp;Save"}
 var updateButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Update","icon":"<i class='fa fa-sm fa-edit'></i>","inner_html":"<i class='fa fa-sm fa-edit'></i>&nbsp;&nbsp;Update"}
 var editButtonClassDesignJson={"button_class":"btn btn-info","size":"btn-sm","value":"Edit","icon":"<i class='fa fa-sm fa-edit'></i>","inner_html":"<i class='fa fa-sm fa-edit'></i>&nbsp;&nbsp;Edit"}
 var resetButtonClassDesignJson={"button_class":"btn btn-danger","size":"btn-sm","value":"Reset","icon":"<i class='fas fa-redo'></i>","inner_html":"<i class='fas fa-redo'></i>&nbsp;&nbsp;Reset"}
 var deleteButtonClassDesignJson={"button_class":"btn btn-danger","size":"btn-sm","value":"Delete","icon":"<i class='fa fa-sm fa-trash fa-check-circle'></i>","inner_html":"<i class='fa fa-sm fa-trash fa-check-circle'></i>&nbsp;&nbsp;Delete"}
 var viewButtonClassDesignJson={"button_class":"btn btn-danger","size":"btn-sm","value":"View","icon":"<i class='fas fa-eye'></i>","inner_html":"<i class='fas fa-eye'></i>&nbsp;&nbsp;View"}

 var searchButtonClassDesignJson={"button_class":"btn btn-info","size":"btn-sm","value":"Search","icon":"<i class='fa fa-fw fa-sm fa fa-search'></i>","inner_html":"<i class='fa fa-fw fa-sm fa fa-search'></i>&nbsp;&nbsp;Search"}
 var deactivateButtonClassDesignJson={"button_class":"btn btn-danger","size":"btn-sm","value":"De-Activate","icon":"<i class='fa fa-sm fa-trash fa-check-circle'></i>","inner_html":"<i class='fa fa-sm fa-trash fa-check-circle'></i>&nbsp;&nbsp;De-Activate"}
 var activateButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Activate","icon":"<i class='fa fa-sm fa-trash fa-check-circle'></i>","inner_html":"<i class='fa fa-sm fa-trash fa-check-circle'></i>&nbsp;&nbsp;Activate"}
 var storeButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Store","icon":"<i class='fa fa-sm fa-trash fa-check-circle'></i>","inner_html":"<i class='fa fa-sm fa-trash fa-check-circle'></i>&nbsp;&nbsp;Store"}
 var importButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Import","icon":"<i class='fas fa-file-import'></i>","inner_html":"<i class='fas fa-file-import'></i>&nbsp;&nbsp;Import"}
 var exportButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Export","icon":"<i class='fas fa-download'></i>","inner_html":"<i class='fas fa-download'></i>&nbsp;&nbsp;Export"}
 var accessButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Access","icon":"<i class='fas fa-universal-access'></i>","inner_html":"<i class='fas fa-universal-access'></i>&nbsp;&nbsp;Access"}
 var printButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Print","icon":"<i class='fas fa-print'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Print"}
 var generateButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Generate","icon":"<i class='fas fa-print'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Generate"}
 var downloadButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Download","icon":"<i class='fas fa-download'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Download"}

 var exportPdfButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Export PDF","icon":"<i class='fas fa-download'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Export PDF"}
 var exportExcelButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Export Excel","icon":"<i class='fas fa-download'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Export Excel"}
 var uploadButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Upload","icon":"<i class='fas fa-download'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Upload"}
 var saveAsDraftButtonClassDesignJson={"button_class":"btn btn-success","size":"btn-sm","value":"Save as Draft","icon":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Save as Draft"}

 var saveAndSendToButtonClassDesign = {"button_class":"btn btn-success","size":"btn-sm","value":"Save & Send to PDO","icon":"<i class='fa fa-fw fa-sm fa-plus-circle'></i>","inner_html":"<i class='fas fa-print'></i>&nbsp;&nbsp;Save & Send to PDO"}
 var searchingButtonClassDesignJson={"button_class":"btn btn-info","size":"btn-sm","value":"Searching...","icon":"<i class='fa fa-fw fa-sm fas fa-spinner fa-pulse'></i>","inner_html":"Searching...&nbsp;&nbsp;<i class='fa fa-fw fa-sm fas fa-spinner fa-pulse'></i>"}

  var ButtonClassDesignMap=new Map();
 ButtonClassDesignMap.set("addButtonClassDesign",addButtonClassDesignJson);
 ButtonClassDesignMap.set("saveButtonClassDesign",saveButtonClassDesignJson);
 ButtonClassDesignMap.set("updateButtonClassDesign",updateButtonClassDesignJson);
 ButtonClassDesignMap.set("editButtonClassDesign",editButtonClassDesignJson);
 ButtonClassDesignMap.set("resetButtonClassDesign",resetButtonClassDesignJson); 
 ButtonClassDesignMap.set("deleteButtonClassDesign",deleteButtonClassDesignJson);
 ButtonClassDesignMap.set("viewButtonClassDesign",viewButtonClassDesignJson);
 ButtonClassDesignMap.set("searchButtonClassDesign",searchButtonClassDesignJson);
 ButtonClassDesignMap.set("deactivateButtonClassDesign",deactivateButtonClassDesignJson);
 ButtonClassDesignMap.set("activateButtonClassDesign",activateButtonClassDesignJson);
 ButtonClassDesignMap.set("storeButtonClassDesign",storeButtonClassDesignJson);
 ButtonClassDesignMap.set("importButtonClassDesign",importButtonClassDesignJson);
 ButtonClassDesignMap.set("exportButtonClassDesign",exportButtonClassDesignJson);
 ButtonClassDesignMap.set("accessButtonClassDesign",accessButtonClassDesignJson);
 ButtonClassDesignMap.set("printButtonClassDesign",printButtonClassDesignJson);
 ButtonClassDesignMap.set("generateButtonClassDesign",generateButtonClassDesignJson);
 ButtonClassDesignMap.set("downloadButtonClassDesign",downloadButtonClassDesignJson);

 ButtonClassDesignMap.set("exportPdfButtonClassDesign",exportPdfButtonClassDesignJson);
 ButtonClassDesignMap.set("exportExcelButtonClassDesign",exportExcelButtonClassDesignJson);
 ButtonClassDesignMap.set("uploadButtonClassDesign",uploadButtonClassDesignJson);
 ButtonClassDesignMap.set("saveAsDraftButtonClassDesign",saveAsDraftButtonClassDesignJson);

 ButtonClassDesignMap.set("saveAndSendToButtonClassDesign",saveAndSendToButtonClassDesign);
 ButtonClassDesignMap.set("searchingButtonClassDesignJson",searchingButtonClassDesignJson);


/* =============================================theme-color */ 
  $(document).ready(function($) {
	
	 
	  $('.medetoryClassNote').html('* for a successfull submission are mandatory')
	  $( ".ValidateInput" ).prevAll('label').after($("<font/>").attr("style","color:red;font-weight:bold;").append(" *"));
// 	  $( ".ValidateInput" ).parent().prevAll('label').after($("<font/>").attr("style","color:red;font-weight:bold;").append(" *"));
	

		confirmCancelButton={
				confirm: {
		            label: '<i class="fa fa-check-circle"></i> Confirm',
		            className: 'btn btn-success defaultPrivilege btn-sm '
		            	
		        },
		        cancel: {
		            label: '<i class="fa fa-times-circle"></i> Cancel',
		            className: 'btn btn-danger defaultPrivilege btn-sm pull-right'
		        }
		        
		    };

		alertButton={
				ok: {
		            label: 'Ok',
		            className: 'btn-danger defaultPrivilege'
		            	
		        },
		       
		        
		    };
		
		
		//set button color
		/* $("button[type=button]").each(function(e){
			var buttonClass=$(this).prop('class').split(" ");
			if(buttonClass !=null)
			{
				for(var i=0;i<buttonClass.length;i++)
					{
						if(ButtonClassDesignMap.has(buttonClass[i]))
							{
							var jsonData=ButtonClassDesignMap.get(buttonClass[i]);
							
								$.each(jsonData, function(key,value) {
								 	if(key === 'button_class' || key === 'size')
								 		{
								 		$("."+buttonClass[i]).addClass(value)
								 		}
								 	else if(key === 'inner_html')
								 		{
								 		$("."+buttonClass[i]).html(value)
								 		}
								 	
								}); 
							}
						
						
					}
				
			}
		}); */
	  
  // when the switch is clicked...
  function switchOff() {
    $('.switch-off').on('click', function() {
      // change off class to on
      $(this).removeClass('switch-off');
      $(this).addClass('switch-on');
      // change the button text
      $(this).html('ON');
      // change switch container background color to 'on';
      $('#switch-container').addClass('background-on');
      //change body background color
      $('body').addClass('body-on');
      // call the switchOn function which will fire up the event listener for the on button
      switchOn();
    });
  }
  
  function switchOn() {
    $('.switch-on').on('click', function() {
      $(this).removeClass('switch-on');
      $(this).addClass('switch-off');
      $(this).html('OFF');
      $('#switch-container').removeClass('background-on');
      $('body').removeClass('body-on');
      switchOff();
    });
  }
  // when the document is ready, call the switchOff function
  switchOff();
  

//   var jspcodeval = $('#jspCodeId').val();
//   loadScreenPrivillages('6', jspcodeval);
  
});
  
 
 /*  =============================================theme-color */ 
</script> 
<!-- Button Design jsp -->
<%-- <jsp:include page="../../common/commonButtonDesign.jsp"></jsp:include> --%>

		 
		 
		<%-- <div class="modal fade" style="z-index: 9999999999999 !important;" id="viewUserProfileModal" role="dialog" aria-labelledby="viewUserProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-capitalize" id="viewUserProfileModalLabel"></h5>
        <button type="button" class="close defaultPrivilege" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <jsp:include page="../../UserManagement/loadUserProfile.jsp" />
      </div>
      <div class="modal-footer text-right">
        <button type="button" class="btn btn-secondary defaultPrivilege" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  --%>
  
<script type="text/javascript">

var zp_id=null,tp_id=null,gp_id=null;
function goHome()
{
	var role_id=localStorage.getItem("role_id");
	var user_id=localStorage.getItem("user_id");
	
	$("#localStorage_user_id").val(user_id);
	$("#localStorage_role_id").val(role_id);
	$("#jwtToken").val(	localStorage.getItem("jwtToken"));
	clearLocalStorageData();
	var webUrl='${commonAdminAndUserService}';
	document.headerForm.action=webUrl+"um/loadUserHomePage";
	document.headerForm.submit();
	
}
function logout()
{
		bootbox.confirm({
		title : '<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to logout!",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
				var webUrl='${pageContext.request.contextPath}/';
				document.headerForm.action=webUrl+"login/loginPage";
				document.headerForm.submit();
	    	}
	    }
		});
}
function clearLocalStorageData()
{
	localStorage.clear();
}

function sessionOut(msg)
{

	var webUrl='${commonAdminAndUserService}';
	document.headerForm.action=webUrl+"userLogin/logout?sessionOutMsg="+msg+"&user_id="+localStorage.getItem("user_id");
	document.headerForm.submit();
}


// setUserRoleInHeader();
function viewDocumentByName(documentName,ducumentFolderName,docSubFolderName,displayFrame,imgId){
	var flag=true;
	var commonAdminAndUserService='${commonAdminAndUserService}';
    if(flag ){
	  
	    $.ajax({
		    
	    	url:commonAdminAndUserService+"ajax/getByteDataOfFile?documentName="+documentName+"&ducumentFolderName="+ducumentFolderName+"&ducumentSubFolderName="+docSubFolderName,
			type:"POST",
			success:function(data){
			
				/* console.log(data); */
				if(data.status != null && data.status == "1000"){
					
					if(documentName.split('.').pop() != null && documentName.split('.').pop() != ""){
						
						if(displayFrame == "Y"){
							
							$("#viewUploadedDocumentId").append(
								$("<iframe/>").attr("height","600px").attr("width","100%").attr("alt","Panchatantra").attr('src', 'data:application/pdf;base64,'+data.thumbnailFileName)
							);
							
						}else{
							
							$("#"+imgId).attr('src','data:image/jpg;base64,'+data.thumbnailFileName+'');
						}
						
						
					}
	
				}else{
					
					 
				}
			},
			error:function(){
			
			}	
		}); 
	}	
}
function getUserRoleByUserId() 
{
	var commonAdminAndUserService='${commonAdminAndUserService}';
	
	var webData = {"user_id":localStorage.getItem("user_id")};
// 	var webDataUrl = '${pageContext.request.contextPath}/ajax/getUserManagementWebService?serviceName=getUserAllRoleByUserId&serviceType=OTHER';
	var webDataUrl =commonAdminAndUserService+"ajax/getUserManagementWebService?serviceName=getUserAllRoleByUserId&serviceType=OTHER";
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
// 	if (webDataStatus === 1 && webDataCnt.length > 0) {
		setUserRoleInHeader(JSON.stringify(webDataCnt))
// 		localStorage.setItem("userAllRole", JSON.stringify(webDataCnt));
// 		$.each(webDataCnt, function(index) {
			
			
// 			alert(webDataCnt[index].role_name);
// 			var div1=$("<div>").addClass("col-12 text-left");
// 			var div2=$("<div>").addClass("divider col-12").attr("role","separator");
// 			var link = $("<a>");
// 			link.attr("href", "#");
// 			link.attr("onclick", "changeMainRole('"+webDataCnt[index].role_id+"')");
// 			link.html(webDataCnt[index].role_name);
			
// 			div1.append(link);
// 			div1.append(div2);
// 			$("#div_display_user_role").append(div1);
			
// 		});
// 	}
}

function setUserRoleInHeader(webDataCnt) {
	$("#div_display_user_role").empty();
// 	var webDataCnt = JSON.parse(localStorage.getItem("userAllRole"));
	var webDataCnt = JSON.parse(webDataCnt);
	if (webDataCnt.length > 0) {
		$.each(webDataCnt, function(index) {
			
			var div1=$("<div>").addClass("col-12 text-left");
			var div2=$("<div>").addClass("divider col-12").attr("role","separator");
			var link = $("<a>");
			link.attr("href", "#");
			link.attr("onclick", "changeMainRole('"+webDataCnt[index].role_id+"','"+webDataCnt[index].user_id+"')");
			link.html(webDataCnt[index].role_name);
			
			div1.append(link);
			div1.append(div2);
			$("#div_display_user_role").append(div1);
			
		});
	}
	else
	{
	$("#div_display_user_role").html("<h6>No Extra Role Assign</h6>");
	}
	
}

function changeMainRole(roleId,userId) {
	localStorage.setItem("user_id", userId);
	$("#localStorage_user_id").val(userId);
	$("#localStorage_role_id").val(roleId);
	$("#jwtToken").val(	localStorage.getItem("jwtToken"));
 	//getMenuXmlRoleWise();
	clearLocalStorageData();
	// 	var webUrl='${homePage}';
	var webUrl='${commonAdminAndUserService}';
	alert($("#userActivityId").val()+"--"+$("#localStorage_user_id").val()+"---"+$("#localStorage_role_id").val());
 	/* document.headerForm.action="http://localhost:9092/USER_MODULE/um/loadUserHomePage"; */
	document.headerForm.action=webUrl+"userLogin/loadChangeRole";
	document.headerForm.submit();
}
//Add by Payal for mobile view
function SetTableMobileResponsive(tableId){

	// get header list
	var headerList=$("#"+tableId+" thead tr th");
	$("#"+tableId+" tbody tr").each(function(){
		var childData=this.children;
		
		for(var i=0;i<childData.length;i++){
			childData[i].setAttribute("data-label",headerList[i].textContent)
		}
		
	})
		
}

function viewDocument(documentName,ducumentFolderName){
	var flag=true;
	if(flag ){
		    $.ajax({
		    	url:"${pageContext.request.contextPath}/ajax/getByteDataOfFile?documentName="+documentName+"&ducumentFolderName="+ducumentFolderName,
				type:"POST",
				success:function(data){
					if(data.status != null && data.status == "1000"){
						if(documentName.split('.').pop() != null && documentName.split('.').pop() != ""){
							if(documentName.split('.').pop() == "pdf"){
								$("#viewUploadedDocumentId").append(
									$("<iframe/>").attr("height","600px").attr("width","100%").attr("alt","UMS").attr('src', 'data:application/pdf;base64,'+data.thumbnailFileName)
								);
							}else{
								$("#viewUploadedDocumentId").append($('<div/>').attr("class","scroll-img").append(
									$("<img/>").attr("href","#").attr("width","100%").attr("height","400px").attr("alt","UMS").attr('src', 'data:image/jpg;base64,'+data.thumbnailFileName))
								);
							}
						}
						openViewUploadedDocumentModel();
					}else{
						 $.each(data.error_message,function(key,value){
// 							 openToastMessage("Efsmallrror Message",value,"error");
							
						   });
					}
				},
				error:function(){
// 				    openToastMessage("Panchatantra","Error in View  Image","error"); 
				}	
			}); 
		}	
} 
//Payal

function openModalDocument(element,filename,folderName) {
	$("#uploadDocModalId").modal('show');
	$("#folderNameId").val(folderName);
	getListofDataDoc();
}
function setLocalStorageDataLoadTime()
{
// 	var jwtToken='${jwtToken}';
// 	var module_id='${module_id}';
// 	var role_id='${role_id}';
	
// 	var activityId='${activity_id}';
// 	if(activityId !=null && activityId != '')
// 	{
// 		localStorage.setItem("activityId",'${activity_id}')
// 	}
	
// // 	localStorage.setItem("role_id",role_id);
// 	var user_id=localStorage.getItem("user_id")
// 	if(user_id !=null && user_id !='' && user_id !='undefined')
// 		{
// 		user_id=user_id;
// 		}
// 	else
// 		{
// 		user_id='${user_id}';
// 		}
// 	if(user_id ==null || user_id =='' || user_id =='undefined')
// 	{
// 		logout();
// 	}
// 	if(role_id !=null && role_id !='' && role_id !='undefined')
// 	{
// 		localStorage.setItem("role_id",role_id);
// 	}
// 	if(module_id !=null && module_id !='' && module_id !='undefined')
// 	{
// 		localStorage.setItem("module_id",module_id);
// 		getMenuXmlRoleWise();
// 	}
	
	
// 	if(jwtToken !=null && jwtToken != '' && jwtToken !='undefined')
// 		{
// 			localStorage.setItem("jwtToken",'${jwtToken}')
// 		}
// 	if(user_id !=null && user_id != '' && user_id !='undefined')
// 	{
// 	$("#goHomeLink").attr("onclick","goHome();");
// 	$("#logoHomeClick").attr("onclick","goHome();");
	
// 	}
	
}
//Start : Sajjad
$(document).ready(function(){
	setLocalStorageDataLoadTime();
	
	
	
// 	setUserHeaderData();
var uData =  JSON.parse(localStorage.getItem("userData"));
if(uData != null)
	{
	setUserHeaderData();
	setDataAccessByLevelAndPostCity();
	setUserProfileData();
	}
	var activityId = localStorage.getItem("activityId");
	$('#userActivityId').val(activityId);
	var userId = localStorage.getItem("user_id");
	$('#crtUserId').val(userId);
	
	$("button[type=button]").each(function(e){
		var buttonClass=$(this).prop('class').split(" ");
		if(buttonClass !=null)
		{
			for(var i=0;i<buttonClass.length;i++)
				{
					if(ButtonClassDesignMap.has(buttonClass[i]))
						{
						var jsonData=ButtonClassDesignMap.get(buttonClass[i]);
						
							$.each(jsonData, function(key,value) {
							 	if(key === 'button_class' || key === 'size')
							 		{
							 		$("."+buttonClass[i]).addClass(value)
							 		}
							 	else if(key === 'inner_html')
							 		{
							 		$("."+buttonClass[i]).html(value)
							 		}
							 	
							}); 
						}
					
					
				}
			
		}
	});
});

function setUserProfileData(){
	var userData =  JSON.parse(localStorage.getItem("userData"));
	var roleId = localStorage.getItem("role_id");
	var userId = localStorage.getItem("user_id");
	$('#user_name_forModal').text(userData[0].emp_first_name_kn+" "+userData[0].emp_last_name_kn);
	
	
	$('#user_mobile_no_forModal').text(userData[0].mobile_no);
	$('#user_category_forModal').text(userData[0].emp_type_category_name);
	$('#user_designation_forModal').text(userData[0].dsgn_name_en);
	$('#user_default_role_forModal').text(userData[0].role_name);
	$('#user_kgid_forModal').text(userData[0].kgid_no);
	$('#user_email_id_forModal').text(userData[0].email_id);
	$('#viewUserProfileModal #viewUserProfileModalLabel').text(userData[0].emp_first_name_en+" "+userData[0].emp_last_name_en);
	
	
	viewDocumentByName(userData[0].user_photo,"employeePhoto",'','',"show_user_profile_photo");
	viewDocumentByName(userData[0].user_photo,"employeePhoto",'','',"headerUserImageId");
	viewDocumentByName(userData[0].user_photo,"employeePhoto",'','',"menuUserImageId"); 
}

function getUserSessionData(userId) 
{
	var commonAdminAndUserService='${commonAdminAndUserService}';
	if(userId == null || userId == '')
	{

	logout();
	}

	var webData = {"userId" : userId};
// 	var webDataUrl = '${pageContext.request.contextPath}/ajax/getUserManagementWebService?serviceName=getUserDetailsById&serviceType=OTHER';
	var webDataUrl = commonAdminAndUserService+"ajax/getUserManagementWebService?serviceName=getUserDetailsById&serviceType=OTHER";
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
// alert(webDataCnt.length);
// alert(webDataStatus);
	if ( webDataCnt.length > 0) {
		console.log(webDataCnt)
		setLocalStorageUserData(webDataCnt);
		
	}
	else
		{
		logout();
		}
}
function setLocalStorageUserData(userObj)
{
	localStorage.setItem("userData",JSON.stringify(userObj));
	var uData =  JSON.parse(localStorage.getItem("userData"));
	localStorage.setItem("emp_id", uData[0].emp_id);
	localStorage.setItem("role_id", uData[0].role_id);
	localStorage.setItem("role_name", uData[0].role_name);
	localStorage.setItem("user_id", uData[0].user_id);
	localStorage.setItem("access_level", uData[0].access_level);
	localStorage.setItem("post_city", uData[0].post_city);
// 	localStorage.setItem("module_id","");
	setUserHeaderData();
	setDataAccessByLevelAndPostCity();
	setUserProfileData();
	
}
function setUserHeaderData()
{
	var uData =  JSON.parse(localStorage.getItem("userData"));
	$('#headerUserNameId').text(uData[0].emp_first_name_kn+" "+uData[0].emp_last_name_kn);
	$('#headerUserRoleId').text(uData[0].role_name);
}
//End : Sajjad

//anita
function setDataAccessByLevelAndPostCity()
{
	var commonAdminAndUserService='${commonAdminAndUserService}';
	var post_city = localStorage.getItem("post_city");
	var access_level = localStorage.getItem("access_level");
// 	alert(post_city+" -"+access_level);
	var stateId="",zpId="",tpId="",gpId="",vlgId="";
	$( "select" ).each(function( index ) {
		var buttonClass=$(this).prop('class').split(" ");
		/* if($.inArray("selectDefaultDataAccessPrivilege", buttonClass) != '-1'){
			
		}
		else{
			$('#'+this.id).empty().attr("disabled",true).attr("data-toggle","tooltip").attr("title","You have no rights access the data").append('<option selected="selected" value="">Select</option>');
		} */
		if($.inArray("selectStateDataAccessPrivilege", buttonClass) != '-1'){
			stateId = this.id;
		}
		if($.inArray("selectZpDataAccessPrivilege", buttonClass) != '-1'){
			zpId = this.id;
		}
		if($.inArray("selectTpDataAccessPrivilege", buttonClass) != '-1'){
			tpId = this.id;
		}
		if($.inArray("selectGpDataAccessPrivilege", buttonClass) != '-1'){
			gpId = this.id;
		}
		if($.inArray("selectVlgDataAccessPrivilege", buttonClass) != '-1'){
			vlgId = this.id;
		}
		
	});
	
	var commonAdminAndUserService='${commonAdminAndUserService}';
	var webData = {'access_level' : access_level,'post_city' : post_city};
	var webDataUrl = commonAdminAndUserService+"ajax/getUserManagementWebService?serviceName=getUserAccessLevelByLevelAndPostCity&serviceType=OTHER";
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
	if (webDataStatus === 1 && webDataCnt.length > 0) {
	
		if(access_level == "1"){
			if (zpId != ""){
				$("#"+stateId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].state_code).append(webDataCnt[0].state_name))
				fillDropdownCommon(zpId,"getDistrictMasterDataByStateId",JSON.stringify(""));
			}
		}
		else if(access_level == "2"){
			zp_id= webDataCnt[0].district_code;
			if (tpId != ""){
				$("#"+stateId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].state_code).append(webDataCnt[0].state_name))
				$("#"+zpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].district_code).append(webDataCnt[0].district_name_eng))
				
				var data={"DISTRICT_ID" : webDataCnt[0].district_code,"order_by":"BLOCK_NAME_ENG"};
				fillDropdownCommon(tpId,"getTalukaMasterDataByDistrictId",JSON.stringify(data));
			}
		}
		else if(access_level == "3"){
			zp_id= webDataCnt[0].district_code;
			tp_id = webDataCnt[0].tp_id;
			if (gpId != ""){
				$("#"+stateId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].state_code).append(webDataCnt[0].state_name))
				$("#"+zpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].district_code).append(webDataCnt[0].district_name_eng))
				$("#"+tpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].tp_id).append(webDataCnt[0].block_name_eng))
				
				
				var data={"TP_ID" : webDataCnt[0].tp_id,"order_by":"GP_ENG_NAME"};
				fillDropdownCommon(gpId,"getGpMasterDataByTpId",JSON.stringify(data));
			}
		}
		else if(access_level == "4"){
			zp_id= webDataCnt[0].district_code;
			tp_id = webDataCnt[0].tp_id;
			gp_id=webDataCnt[0].gp_id;
			if(stateId != "" && zpId != "" && tpId != "" && gpId != ""){
				$("#"+stateId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].state_code).append(webDataCnt[0].state_name))
				$("#"+zpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].district_code).append(webDataCnt[0].district_name_eng))
				$("#"+tpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].tp_id).append(webDataCnt[0].block_name_eng))
				$("#"+gpId).empty().attr("disabled",true).append($("<option/>").attr("value",webDataCnt[0].gp_id).append(webDataCnt[0].gp_eng_name))
			}
			if (vlgId != ""){
				var data={"GP_ID" : webDataCnt[0].gp_id,"order_by":"VILLAGE_NAME"};
				fillDropdownCommon(vlgId,"getVillageMasterDataByGpId",JSON.stringify(data));
			}
		}
		
		
	}else{
		if (stateId != "")
		$("#"+stateId).empty().attr("disabled",true).append($("<option/>").attr("value","").append("NO DATA FOUND"))
		if (zpId != "")
		$("#"+zpId).empty().attr("disabled",true).append($("<option/>").attr("value","").append("NO DATA FOUND"))
		if (tpId != "")
		$("#"+tpId).empty().attr("disabled",true).append($("<option/>").attr("value","").append("NO DATA FOUND"))
		if (gpId != "")
		$("#"+gpId).empty().attr("disabled",true).append($("<option/>").attr("value","").append("NO DATA FOUND"))
		if (vlgId != "")
		$("#"+vlgId).empty().attr("disabled",true).append($("<option/>").attr("value","").append("NO DATA FOUND"))
	}
}

//anita

$(document).ready(() => {
	$('.datatable').DataTable();
	$('.datatable-responsive').parent().addClass('table-responsive');
	
	$('.date_class').each((index, inputField) => {
		$(inputField).datepicker({
			format : 'dd/mm/yyyy' 
		});
	});
});

</script>
<!--***************************************************************************color-picker*************************************************************************** -->




		<div class="modal fade bs-example-modal-lg" id="uploadDocModalId" tabindex="-1" role="dialog" aria-labelledby="uploadDocModalLabelId" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog modal-lg" role="dialog">
				<div class="modal-content">
				  <div class="modal-header ">
					<p class="modal-title" id="uploadDocModalLabelId"><fmt:message bundle="${hrmsLabels}" key="ADD_NEW_DOCUMENTS"/></p>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
				  </div>
				  <div class="modal-body">
				  			<div>
								<jsp:include page="../../common/uploadDocuments.jsp"></jsp:include>
							</div>
				  </div>
				  <div class="modal-footer">
						<button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Close</button>
				  </div>
				</div>
			  </div>
		</div>
		<div class="modal right fade text-left" id="viewDocumentModelId" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog modal-lg">
			<div class="modal-content">
			  <div class="modal-header">
				<p class="modal-title" id="DocumentLabelId"><fmt:message bundle="${hrmsLabels}" key="UPLOAD"/></p>
				<button type="button" class="close" onclick="closeViewUploadedDocumentModel();">
				  <span aria-hidden="true">X</span>
				</button>
			  </div>
			  <div class="modal-body modal-height-body-fix overflow-hidden">
			  	<div class="row">
					<div class="col-12" id="viewUploadedDocumentId">
						
					</div>
				</div>
			  </div>
			   <div class="modal-footer bg-light shadow p-3">
			   </div>
			</div>
		  </div>
		 </div> 
		 
  				 
<div class="modal fade" style="z-index: 9999999999999 !important;" id="viewUserProfileModal" role="dialog" aria-labelledby="viewUserProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-capitalize" id="viewUserProfileModalLabel"></h5>
        <button type="button" class="close defaultPrivilege" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
       <jsp:include page="../../common/loadUserProfile.jsp" />
      </div>
      <div class="modal-footer text-right">
        <button type="button" class="btn btn-secondary defaultPrivilege" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 