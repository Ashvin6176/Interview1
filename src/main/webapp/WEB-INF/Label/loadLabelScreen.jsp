<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mahadev.constant.Constants"%>
<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}
</style>
<div class="wrapper">
  <div class="content-wrapper">
    <section class="content-header">
      <h1>Master</h1>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i><fmt:message bundle="${hcgLabels}" key="HOME" /></a></li>
        <li class="breadcrumb-item"><a href="#">Master</a></li>
        <li class="breadcrumb-item active">Master Service</li>
      </ol>
    </section>
    <section class="content">
	    <div class="main-innerbody">
	      <!-- tabs -->
	      <div class="row">
	        <div class="col-12">
	          <div class="box box-default">
	            <div class="box-header with-border">
	              <h3 class="box-title">Application Menu</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            	<div id="contentDiv">
	            		<div id="validateDivId">
	            			<div class="row">
	            				<div class="col-xs-12 col-sm-12 col-md-12 col-ld-12">
	            					<p align="left"><b>Master Service <b style="color: red;">*</b> for a successful submission are mandatory</b></p>
	            				</div>
	            			</div>
		            		<form:form id="masterServiceFormId" name="mstServiceForm" modelAttribute="mstLabel" >
		            				  <input type="hidden" name="label_id" id="editLabelId">
		            				  <input type="hidden" name="actionFlag" id="actionFlagId">
		            				   <div class="row">
								            <div class="col-md-6">
								              <div class="form-group">
								                <label for="applicantName"><fmt:message bundle="${hcgLabels}" key="LABEL_KEY" /> <span style="color: red">*</span>:</label>
								                <input type="text" name="label_key" id="label_key" placeholder="Please enter Label Key" class="form-control ">
								              </div>
								    		</div>
								    		
									  </div>
				            		  <div class="row">
								            <div class="col-md-6">
								              <div class="form-group">
								                <label for="applicantName"><fmt:message bundle="${hcgLabels}" key="LABEL_NAME_IN_ENGLISH" /> :</label>
								                <input type="text" name="label_eng_name" id="label_eng_name" placeholder="Please enter Label Name in English" class="form-control ValidateInput">
								              </div>
								    		</div>
								    		<div class="col-md-6">
								              <div class="form-group">
								                <label for="applicantName">Label Name in Kannada:</label>
								                 <input type="text" name="label_knd_name" id="label_knd_name" placeholder="Please enter Label Name in kannad" class="form-control ValidateInput">
								              </div>
								            </div>
									  </div>
									    <div class="row">
									        <div class="col-lg-12">
									    	<label for="applicantName">Select File for Testing<span
			style="color: red"> *</span>
		</label>
								            <div class="input-group mb-1">
			<div class="custom-file">
				
				<input type="file" class="custom-file-input " name="testFileName"
					id="testFileName"> 
					<label class="custom-file-label">Choose File</label>
					<span>hii</span>
			</div>
		</div>
		  </div>
								    		
									  </div>
									  <br>
									  
									   <div class="row">
								  	  	  <div class="col-md-12">
								  	  	  	<div class="form-group">
								  	  	  		<input type="button" value="Submit" id="submitBtnId" onclick="saveOrUpdateLabelMst(this)" class="btn btn-success">
								  	  	  	</div>
								  	  	  </div>
								  	  </div>
									  
								  	  <div class="row">
								          	<div class="col-12">
										          <div class="box">
											            <div class="box-header with-border">
											              <h3 class="box-title">Services</h3>
											            </div>
											            <div class="box-body">
															<div class="table-responsive">
															  <table id="serviceListTableId" class="table table-bordered table-striped">
																<thead>
																	<tr>
																		<th>Sr.No</th>
																		<th>LABEL_KEY</th>
																		<th>LABEL_ENG_NAME</th>
																		<th>LABEL_KND_NAME</th>
																		<th>Action</th>
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
								   	
								  </form:form>
							  </div>
	            			</div>
				          </div>
				       </div>
				     </div>
				   </div>
	      		 </div>
    	</section>
  	</div>
</div>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		getLabelList();
	});
// function saveOrUpdateLabelMst(element) 
// {
// 	var flag = true;
// 	flag = formValidate("validateDivId");
// 	if (flag) {
// 		var action='';
// 		element=='Update' ? action=element : action='Save';
// 		bootbox.confirm({
<%-- 					title : '<%=Constants.PROJECT_TITLE%>', --%>
// 					message: "Are you sure want to "+action+" data?",
// 				    callback: function(result)
// 				    { 
// 				    	if(result)
// 				    	{
// 				    		$('#actionFlagId').val(action);
// 							 var serviceURL='${pageContext.request.contextPath}/csAjax/saveOrUpdateLabelMst';
// 						   	 var serviceData=$("#masterServiceFormId").serialize();
// 						   	 var map=saveFormApplication(serviceURL,serviceData,"loader","masterServiceFormId");
// 						   	 var serviceStatus=map.get("serviceStatus");
// 						   	 var res=map.get("serviceResponse");
// 						   	 if(serviceStatus == 1)
// 						   	 {
// 						   		getLabelList();
// 						   		genericAjaxCallForGetMethod('${pageContext.request.contextPath}/config/reloadProperty')
// 						   		$('#editLabelId').val('');
// 						   		$("#submitBtnId").removeAttr("value").attr("value","Submit").removeAttr("onclick").attr("onclick","saveOrUpdateLabelMst(this)");
// 						   	 }
// 				    	}
// 					}
//     		});
// 	} 
// }
function saveOrUpdateLabelMst(element) 
{
	var flag = true;
	flag = formValidate("validateDivId");
	if (flag) {
		var action='';
		element=='Update' ? action=element : action='Save';
		$('#actionFlagId').val(action);
		ictConfirm("Are you sure want to "+action+" data?",sucessMethod,element)
			} 
}
function sucessMethod(element)
{
// 	----------------------------- working----------------------
	/*  var form = $('#masterServiceFormId')[0];

	    var data = new FormData(form);

	 $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "${pageContext.request.contextPath}/csAjax/saveOrUpdateLabelMst",
	        data: data,
	        processData: false, 
	        contentType: false,
	        cache: false,
	        success: function (data) {

	           alert('success')

	        },
	        error: function (e) {
	        	 alert('error')
	            
	            console.log("ERROR : ", e);

	        }
	    }); */
	 
// 	 --------------------------------------------------------------
 	var form = $('#masterServiceFormId')[0];
	    var data = new FormData(form);
	 var action='';
	element=='Update' ? action=element : action='Save';
// 	$('#actionFlagId').val(action);
	 var serviceURL='${pageContext.request.contextPath}/csAjax/saveOrUpdateLabelMst';
//   	 var serviceData=$("#masterServiceFormId").serialize();
	 var serviceData=data;
	 saveFormApplicationWithMultiPartAndCallBack(serviceURL,serviceData,"loader","masterServiceFormId",callbackSucessMethod);
  	 
}
function callbackSucessMethod(map) {
	var serviceStatus=map.get("serviceStatus");
 	 var res=map.get("serviceResponse");
 	 if(serviceStatus == 1)
 	 {
 		getLabelList();
 		$('#editLabelId').val('');
 		$("#submitBtnId").removeAttr("value").attr("value","Submit").removeAttr("onclick").attr("onclick","saveOrUpdateLabelMst(this)");
 	 } 
}
function getLabelList() 
{
	$('#serviceListTableId').DataTable().destroy();
	$("#serviceListTableId > tbody").empty();
	var webData = {};
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getHCGWebService?serviceName=getMstLabelList&serviceType=MASTER';
	var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod(webDataUrl, JSON.stringify(webData), "loader",setLabelList);
	
}
function setLabelList(webDataMap)
{
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");

	if (webDataStatus === 1 && webDataCnt.length > 0) {
						$.each(webDataCnt,function(index) {
							var bodyRow = $("<tr/>");
							bodyRow.append($("<td/>").addClass("text-left").append(index + 1));
							bodyRow.append($("<td/>").addClass("text-left").append(webDataCnt[index].label_key));
							bodyRow.append($("<td/>").addClass("text-left").append(webDataCnt[index].label_eng_name));
							bodyRow.append($("<td/>").addClass("text-left").append(webDataCnt[index].label_knd_name));
							bodyRow.append($("<td/>").append($("<a/>").attr("href","#").attr("onclick","editService('"+ webDataCnt[index].label_id+ "');")
															.addClass("label label-info")
															.append("<i class='fa fa-pencil-square-o fa-lg'></i>Edit"))
											.append($("<a/>").attr("href","#").attr("onclick","deleteService('"+ webDataCnt[index].label_id+ "')")
															.addClass("label label-danger")
															.append("<i class='fa fa-trash-o fa-lg'></i>delete")));
							$("#serviceListTableId > tbody").append(bodyRow);
						});
						$("#serviceListTableId").dataTable();
	}
}

function editService(labelId) {
	$("#submitBtnId").removeAttr("value").attr("value","Edit").removeAttr("onclick").attr("onclick","updateLabelMst()");
	$("#actionFlagId").val('Update');
	getServiceByServiceId(labelId);
}
function updateLabelMst() {
	bootbox.confirm({
		title : '<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to update service?",
	    callback: function(result)
	    { 
	    	if(result)
	    	{
				 var serviceURL='${pageContext.request.contextPath}/csAjax/updateLabelMst';
			  	 var serviceData=$("#masterServiceFormId").serialize();
			  	 var map=saveFormApplication(serviceURL,serviceData,"loader","masterServiceFormId");
			  	 var serviceStatus=map.get("serviceStatus");
			  	 var res=map.get("serviceResponse");
			  	 if(serviceStatus == 1)
			   	 {
			  		getLabelList();
			   	 }
	    	}
	    }
	});
}

function deleteService(labelId) {
	$("#actionFlagId").val('Delete');
	$("#editLabelId").val(labelId);
	deleteLabelMst();
}
function deleteLabelMst() 
{
	bootbox.confirm({
		title : '<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to delete service?",
	    callback: function(result)
	    { 
	    	if(result)
	    	{
				 var serviceURL='${pageContext.request.contextPath}/csAjax/deleteLabelMst';
			  	 var serviceData=$("#masterServiceFormId").serialize();
			  	 var map=saveFormApplication(serviceURL,serviceData,"loader","masterServiceFormId");
			  	 var serviceStatus=map.get("serviceStatus");
			  	 var res=map.get("serviceResponse");
			  	 if(serviceStatus == 1)
			   	 {
			  		getLabelList();
			   	 }
	    	}
	    }
	});
}

function getServiceByServiceId(labelId) 
{
	var webData = {'label_id' : labelId};
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getHCGWebService?serviceName=getLabelByLabelId&serviceType=DTL';
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
	if (webDataStatus === 1 && webDataCnt.length > 0) {
		$.each(webDataCnt, function(index) {
			$("#actionFlagId").val('Update');
			$("#label_key").val(webDataCnt[index].label_key);
			$("#label_eng_name").val(webDataCnt[index].label_eng_name);
			$("#label_knd_name").val(webDataCnt[index].label_knd_name);
			$("#editLabelId").val(webDataCnt[index].label_id);
		});
	}
}
</script>