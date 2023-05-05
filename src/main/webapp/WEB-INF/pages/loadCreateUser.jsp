<%@page import="com.mahadev.constant.Constants"%>
<%-- <%@page import="com.ict.mahadev.constant.UrlOperationalConstant"%> --%>
<%@page import="com.utils.CommonUtility"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}
.p-normal{
padding: 5px 15px !important;
}
</style>
<form:form name="CreateUserForm" method="post" id="CreateUserFormId" >
<div class="wrapper">
  <!-- Left side column. contains the logo and sidebar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="main-innerbody">
      <!-- tabs -->
      <div class="row">
        <div class="col-12">
          <div class="box box-default">
            <div class="box-header with-border text-center">
				<b><h3>User Registration</h3></b>
										
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav  justify-content-start" role="tablist">
					<li class="nav-item">
					<p align="left"><b style="color: red;" class="medetoryClassNote"></b></p>
					 </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content ">
					<div class="tab-pane active" id="builLicenseId" role="tabpanel">
					     <div class="pad">
					     	<div id="validateDivId">					         							
					         <div class="row">					         
					            <div class="col-md-6">
						             <div class="form-group">
						              		<input type="hidden" id="user_id" name="user_id" value="0">
						              		<input type="hidden" id="status" name="status">
											Full Name:<input type="text" class="form-control  ValidateInput SimpleTextWithSpaceRegexClass " id="full_name" name="full_name"  onkeyup="validateRegex(this)"/> 
									 </div>
								</div>
								<div class="col-md-6">
									 <div class="form-group">
											Mobile No:<input type="text" class="form-control  ValidateInput  " id="mobile_no" name="mobile_no"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div> 
									<div class="col-md-6">
									 <div class="form-group">
											Address:<input type="text" class="form-control  ValidateInput SimpleTextWithSpaceRegexClass " id="address" name="address"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div> 
									<div class="col-md-6">
									 <div class="form-group">
											City:<input type="text" class="form-control  ValidateInput SimpleTextWithSpaceRegexClass " id="city" name="city"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div>
									<div class="col-md-6">
									 <div class="form-group">
											PinCode:<input type="text" class="form-control  ValidateInput  " id="pincode" name="pincode"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div>
									<div class="col-md-6">
									 <div class="form-group">
											Check:<input type="file" class="form-control  ValidateInput  " id="check" name="check_temp"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div>
									<div class="col-md-6">
									 <div class="form-group">
											AdharCard:<input type="file" class="form-control  ValidateInput  " id="adharcard" name="adhar"  onkeyup="validateRegex(this)"/> 
									 </div>
									</div>
									
							</div>												       
					           <div class="row">
						            <div class="col-md-12 text-center">
						              <div class="form-group">
						                <button type="button" class="btn btn-save btn-sm savePrivilege saveButtonClassDesign" value="" onclick="saveMstCreateUser()" id="saveBtn">SAVE</button>
						                <button type="button" class="btn btn-update btn-sm updatePrivilege updateButtonClassDesign" value="" onclick="updateMstUser()" id="updateBtn">UPDATE</button>
						                <button type="button" class="btn btn-reset btn-sm defaultPrivilege resetButtonClassDesign" value="" id="resetButtonId" onclick="resetFormWithCallbackMethod('CreateUserFormId',resetData);">RESET</button>						              
						              </div>
						            </div>
					           </div>
					        
					         	<jsp:include page="../common/commonExportExcelPdf.jsp">
					         		<jsp:param value="dataTableId" name="table"/>
					         		<jsp:param value="Create User List" name="name"/>
					         		<jsp:param value="tableDiv" name="divId"/>
					         		<jsp:param value="" name="headerDivId"/>
					         	</jsp:include> 
					            <div class="row" id="tableDiv">
				            	 	<div class="col-md-12">
				            	 		<div class="form-group">
				            				<div class="table-responsive"> 
				            				<table class="table table-bordered table-striped exportExcelTableClass" id="dataTableId">
				            					<thead>
				            						<tr>
				            							<th>SR NO</th>
				            							<th>Full Name</th>
				            							<th>Mobile No</th>
				            							<th>Address</th>
				            							<th>City</th>
				            							<th>PinCode</th>
				            							<th>Check</th>
				            							<th>AdharCard</th>
				            							<th class="removeExcelColumn">Action</th>
				            						</tr>
				            					</thead>
				            					
				            					<tbody>
				            					</tbody>
				            					
				            				</table>
				            				</div>
				            			</div>
				            		</div>
            			       </div>
							 </div>
						</div>
						</div>
					</div>
						</div>
					</div>
			    </div>
			<br>
          </div>
       </div>
    </section>
   </div>
   </div> 
</form:form>

<script>
var table;
var user_id='${sessionScope.user_id}';
$('document').ready(function() {
	
	getMstCreateUserData();
	$("#updateBtn").addClass("hide");
	 $("button").click(function() {
         $(document).scrollTop($(document));
     });
	//table = $('#dataTableId').DataTable();
	// table.on('order.dt search.dt', function() {
	// 	table.column(0, {
	// 		search : 'applied',
	// 		order : 'applied'
	// 	}).nodes().each(function(cell, i) {
	// 		cell.innerHTML = i + 1;
	// 	});
	// }).draw();
	
});


function getMstCreateUserData(){
	$('#dataTableId').DataTable().destroy();
	$("#dataTableId > tbody").empty();
	 var mstTableData = {};
	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getRegisterUser&serviceType=MASTER';
	 var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(mstTableData),"loader");
	 var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
	 var mstTableDataCnt=mstTableDataMap.get("serviceResponse"); 
 	if(mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0)
 	{
		$.each(mstTableDataCnt,function(index)
		{	
			var bodyRow=$("<tr/>");
			bodyRow.append( $("<td/>").addClass("text-center").append(index+1) );
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].full_name));	
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].mobile_no));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].address));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].city));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].pincode));
	
			let viewBtn=$("<button/>").addClass("btn btn-success label label-edit m-1 defaultPrivilege editButtonClassDesign removeExcelColumn").attr("type", "button").attr("onclick","getDocBytes('"+mstTableDataCnt[index].user_id+"','check')").append("View");
			let viewBtn1=$("<button/>").addClass("btn btn-success label label-edit m-1 defaultPrivilege editButtonClassDesign removeExcelColumn").attr("type", "button").attr("onclick","getDocBytes('"+mstTableDataCnt[index].user_id+"','adhar')").append("View");
			//bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].check_img));
			//bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].adharcard));
			bodyRow.append( $("<td/>").addClass("text-center").append(viewBtn));
			bodyRow.append( $("<td/>").addClass("text-center").append(viewBtn1));
			var button=$("<button/>").addClass("btn btn-success label label-edit m-1 defaultPrivilege editButtonClassDesign removeExcelColumn").attr("type", "button").attr("onclick","BindDataForUpdat('"+mstTableDataCnt[index].user_id+"')");
			var bi=$("<i/>").addClass("fas fa-pencil-alt mr-1");			
			
			if(mstTableDataCnt[index].status == "1")
			{
				var button1=$("<button/>").addClass("btn btn-danger label label-deactivate m-1 deactivatePrivilege deactivateButtonClassDesign").attr("type","button").attr("onclick","ActivateDeActivateMstUser('"+mstTableDataCnt[index].user_id+"','0')");
				button1.append("DEACTIVATE");
			}
			else
			{
				var button1=$("<button/>").addClass("btn btn-success label label-activate m-1 activatePrivilege activateButtonClassDesign").attr("type","button").attr("onclick","ActivateDeActivateMstUser('"+mstTableDataCnt[index].user_id+"','1')");
				button1.append("ACTIVATE");			
			}
			
			button.append("EDIT");			
			bodyRow.append($("<td/>").addClass("removeExcelColumn").append(button).append("&nbsp;").append(button1));
			
			$("#dataTableId > tbody").append(bodyRow)
		});
		$('#dataTableId').DataTable();
	}
//  	setTableButtonClassDesign();
//  	$("#dataTableId").DataTable();
//  	SetTableMobileResponsive('dataTableId');
}

function saveMstCreateUser()
{ 	
	var flag=true;
 	flag=formValidate("validateDivId");
 	if(flag)
 		{
 		    bootbox.confirm({
 		    title:'<%=Constants.PROJECT_TITLE%>',
 							message : "Are you sure want to submit data?",
 							buttons : confirmCancelButton,
 							callback : function(result) {
 								if (result) {
 										var serviceURL = '${pageContext.request.contextPath}/mainAjax/saveMstCreateUser/'+user_id;
 	 	 								// var serviceData = $("#CreateUserFormId").serialize();
										var form=$("#CreateUserFormId");
						                var serviceData = new FormData(form[0]);
										console.log(serviceData);
 										var map = saveFormApplicationWithMultiPart(serviceURL,serviceData, 'loader', 'CreateUserFormId');
 										var serviceStatus = map.get("serviceStatus");
 										var res = map.get("serviceResponse");
 										if (serviceStatus === 1) {
 											getMstCreateUserData();
 											resetData();
 										}
 								}
 							}
 						})
 			}
}

function BindDataForUpdat(user_id){
	var webData = {'user_id' : user_id};
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getMahadevTypeMasterDataById&serviceType=MASTER';
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse"); 
	if (webDataStatus === 1 && webDataCnt.length > 0) {
		$.each(webDataCnt, function(index) {
			$("#saveBtn").addClass("hide");
			$("#updateBtn").removeClass("hide");

			$("#full_name").val(webDataCnt[index].full_name);	
			$("#mobile_no").val(webDataCnt[index].mobile_no);
			$("#address").val(webDataCnt[index].address);
			$("#city").val(webDataCnt[index].city);
			$("#pincode").val(webDataCnt[index].pincode);
			$("#check").val(webDataCnt[index].check);
			$("#adharcard").val(webDataCnt[index].adharcard);

			$("#user_id").val(webDataCnt[index].user_id);
		});
	}
}

function updateMstUser(){
	var user_id=$("#user_id").val();
	var flag=true;
	flag=formValidate("validateDivId");
	if(flag)
	{
	    bootbox.confirm({
	    title:'<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to update data?",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	    {
					var serviceURL='${pageContext.request.contextPath}/gpProfileCrud/updateMstUser/'+crtUser;
  					var serviceData =$("#CreateUserFormId").serialize();
			        var map=saveFormApplication(serviceURL,serviceData,'loader','CreateUserFormId');
			        var serviceStatus=map.get("serviceStatus");
			        var res=map.get("serviceResponse");
			        if(serviceStatus === 1)
		        	{			 
// 			        	$("#loaders").css("display","none");
			        	getMstCreateUserData();
			        	resetData();
			        	$("#updateBtn").addClass("hide");
						$("#saveBtn").removeClass("hide");
		        	}		
				}
		}
	    })
	}
}

function ActivateDeActivateMstUser(user_id , status)
{
	$('#user_id').val(user_id);
	$('#status').val(status);
	var st='';
	if(status=='0'){
		st='deactivate';
	}else{
		st='activate';
	}
	bootbox.confirm({
		title : '<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to "+st+" this Beneficiary Type ?",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
				 var serviceURL='${pageContext.request.contextPath}/gpProfileCrud/ActivateDeActivateMstUser/'+crtUser;
			  	 var serviceData=$("#CreateUserFormId").serialize();
			  	 var map=saveFormApplication(serviceURL,serviceData,"loader","CreateUserFormId");
			  	 var serviceStatus=map.get("serviceStatus");
			  	 var res=map.get("serviceResponse");
			  	 if(serviceStatus == 1)
			   	 {
			  		getMstCreateUserData();
			  		resetData();
			   	 }			  
	    	}
	    }
	});
}
function resetData()
{
	$("#saveBtn").removeClass("hide");
	$("#updateBtn").addClass("hide");
	$("#user_id").val('');
}
function getDocBytes(user_idd,doc_type) {
	var mstTableData = {"user_id":user_idd,"doc_type":doc_type};
	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getRegisterUserDoc&serviceType=MASTER';
	 var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(mstTableData),"loader");
	 var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
	 var mstTableDataCnt=mstTableDataMap.get("serviceResponse"); 
 	if(mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0){
		$.each(mstTableDataCnt,function(index){
			
				viewDocument1(mstTableDataCnt[index].base_data,mstTableDataCnt[index].extension);
			
		});	
		
		
	}
}
</script>

//<script src="https://kit.fontawesome.com/a076d05399.js"></script>