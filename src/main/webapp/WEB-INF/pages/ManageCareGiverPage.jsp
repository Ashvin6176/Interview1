<%@page import="com.ict.mahadev.constant.Constants"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Manage Care Giver</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Master Configuration</li>
				<li class="breadcrumb-item active">Manage Care Giver</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="main-innerbody">
				<!-- Upload Excel Modal -->
				<div class="modal fade" style="z-index: 9999999999999 !important;" id="viewUploadExcelModal" role="dialog" aria-labelledby="viewUploadExcelModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom" role="document">
				    	<div class="modal-content">
				      		<div class="modal-header">
				        		<h5 class="modal-title text-capitalize" id="viewUploadExcelModalLabel">Upload Care Givers Data Excel</h5>
						        <button type="button" class="close defaultPrivilege" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
				      		</div>
				      		<div class="modal-body">
				     			<div class="row">
						        	<div class="col-12">
						            	<div class="card userProfileDataCard" style="box-shadow: none !important;">
											<div class="card-body text-center">
												<form:form id="uploadExcelFormId" name="uploadExcelForm" enctype="multipart/form-data" autocomplete="off">
													<div class="text-right">
									                	<a class="badge bg-primary text-wrap" href="../mainAjax/getCareGiversDataExcel"><i class="fa fa-file-excel-o"></i> Download Excel</a>
									                </div>
									                <div class="row">
									                	<div class="col-12 col-md-6">
															<div class="form-group">
																<label for="billPeriodId">Excel</label> 
																<input type="file" id="careGivers_data" name="careGiversData" class="form-control ValidateInput" accept=".xlsx, .xls, .csv">
															</div>
														</div>
													</div>
												</form:form>
											</div>
										</div>
									</div>
								</div>
				      		</div>
				      		<div class="modal-footer text-right">
				      			<input type="button" class="btn btn-success" value="Upload" id="uploadBtnId" onclick="uploadCareGiversData();">
				        		<button type="button" class="btn btn-secondary defaultPrivilege" data-dismiss="modal">Close</button>
				      		</div>
				    	</div>
				  	</div>
				</div>
				<!-- tabs -->
				<div class="row">
					<div class="col-12">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Care Giver Details</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="careGiverFormId" name="careGiverForm">
								<input type="hidden" id="care_giver_id" name="careGiverId" />
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="text-right">
												<a href="#viewUploadExcelModal" data-toggle="modal" class="badge bg-primary text-wrap"><i class="fa fa-user"></i> Upload Excel</a>
							                </div>
											<div class="row">
												<div class="col-12 col-md-12">
													<div class="form-group">
														<label for="billPeriodId">Care Giver Full Name</label> 
														<input type="text" id="care_giver_name" name="name" class="form-control ValidateInput" placeholder="Care Giver Full Name">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Email</label> 
														<input type="email" id="email_id" name="email" class="form-control ValidateInput" placeholder="Email">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Contact No</label> 
														<input type="text" id="contact_no" name="contactNo" class="form-control ValidateInput" placeholder="Contact No">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-12">
													<div class="form-group">
														<label for="billPeriodId">Address</label> 
														<textarea id="address_id" name="address" class="form-control ValidateInput" style="height: 100px" placeholder="Address"></textarea>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Employee Id</label> 
														<input type="text" id="employee_id" name="employeeId" class="form-control ValidateInput" placeholder="Employee Id">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Expertise</label> 
														<input type="text" id="expertise_id" name="expertise" class="form-control" placeholder="Expertise">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">From Date</label> 
														<input type="text" id="from_date" name="fromDate" class="form-control date_class" placeholder="From Date">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">To Date</label> 
														<input type="text" id="to_date" name="toDate" class="form-control date_class" placeholder="To Date">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Rate Per Hour ($)</label> 
														<input type="number" id="rate_per_hour" name="ratePerHour" class="form-control ValidateInput" placeholder="Rate Per Hour ($)">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Additional Wages Rate Per Hour ($)</label> 
														<input type="number" id="additional_wage_rate" name="additionalWageRate" class="form-control ValidateInput" placeholder="Additional Wages Rate Per Hour ($)">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Rate Effective From</label> 
														<input type="text" id="effective_date" name="effectiveDate" class="form-control date_class" placeholder="Rate Effective From">
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Submit" id="submitBtnId" onclick="saveCareGiverDetails();">
													</div>
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
		</section>
		
		<section class="content">
			<div class="main-innerbody">
				<div class="row">
					<div class="col-12">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Care Giver List</h3>
							</div>
							<div class="box-body">
								<div id="contentDiv">
									<jsp:include page="../common/commonExportExcelPdf.jsp">
						         		<jsp:param value="careGiverTableId" name="table"/>
						         		<jsp:param value="Care Giver Data" name="name"/>
						         		<jsp:param value="validateTableDivId" name="divId"/>
						         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
						         	</jsp:include>
									<div id="validateTableDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md" id="careGiverTableId">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>Care Giver Name</th>
													<th>Email</th>
													<th>Contact No</th>
													<th>Address</th>
													<th>Employee Id</th>
													<th>Expertise</th>
													<th>From Date</th>
													<th>To Date</th>
													<th>Rate Per Hour ($)</th>
													<th>Additional Wages Rate Per Hour ($)</th>
													<th>Rate Effective From</th>
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
				</div>
			</div>
		</section>
	</div>
</div>


<script>
	$(document).ready(() => {
		getAllCareGivers();
	});
	
	function saveCareGiverDetails() {
		var flag = true;
		flag = formValidate("careGiverFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
						 var serviceURL = '${pageContext.request.contextPath}/mainAjax/saveCareGiver';
					   	 var serviceData = $("#careGiverFormId").serialize();
					   	 var map = saveFormApplication(serviceURL,serviceData,"loader","careGiverFormId");
					   	 var serviceStatus = map.get("serviceStatus");
					   	 var res = map.get("serviceResponse");
					   	 if(serviceStatus == 1)
						 {
					   		getAllCareGivers();
						 }
			    	}
				}
	   		});
		}
	}
	
	function getAllCareGivers() {
		$('#careGiverTableId').DataTable().destroy();
		$("#careGiverTableId > tbody").empty();
		var webData = "";
		var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getAllCareGivers';
		var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setCareGiverList); 
	}
	
	function setCareGiverList(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		
	 		if (webDataCnt.length > 0) {
				$.each(webDataCnt, (index) => {
					var bodyRow = $("<tr/>");
					bodyRow.append($("<td/>").addClass("text-center").append(index + 1));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].name));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].email)); 
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].contactNo));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].address));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].employeeId));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].expertise));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].fromDate));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].toDate));
					bodyRow.append($("<td/>").addClass("text-right").append(webDataCnt[index].ratePerHour));
					bodyRow.append($("<td/>").addClass("text-right").append(webDataCnt[index].additionalWageRate));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].effectiveDate));
					bodyRow.append($("<td/>").append($("<button/>").attr("href","#").attr("onclick","editCareGiver('"+ webDataCnt[index].careGiverId+ "')")
														.addClass("btn btn-primary ml-2 btn-sm defaultPrivilege").append("Edit")
													)
											.append($("<button/>").attr("href","#").attr("onclick","deleteCareGiver('"+ webDataCnt[index].careGiverId+ "')")
														.addClass("btn btn-danger ml-2 btn-sm defaultPrivilege").append("Delete")
													));
					$("#careGiverTableId > tbody").append(bodyRow);
				});
			}
	 		else {
	        		
	        }
	 		
	 		$('#careGiverTableId').dataTable({
				 "orderClasses": false
			});
			$("#careGiverTableId").parent().addClass('table-responsive');
	 	}
	}
	
	function editCareGiver(care_giver_id) {
		var webData = "";
		var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getCareGiver/'+care_giver_id;
		var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setCareGiverValue); 
	}
	
	function setCareGiverValue(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		if(webDataCnt != null){
	 	 		$('#care_giver_name').val(webDataCnt.name);
	 	 		$('#email_id').val(webDataCnt.email);
	 	 		$('#contact_no').val(webDataCnt.contactNo);
	 	 		$('#address_id').val(webDataCnt.address);
	 	 		$('#employee_id').val(webDataCnt.employeeId);
	 	 		$('#expertise_id').val(webDataCnt.expertise);
	 	 		$('#from_date').val(webDataCnt.fromDate);
	 	 		$('#to_date').val(webDataCnt.toDate);
	 	 		$('#rate_per_hour').val(webDataCnt.ratePerHour);
	 	 		$('#additional_wage_rate').val(webDataCnt.additionalWageRate);
	 	 		$('#effective_date').val(webDataCnt.effectiveDate);
	 	 		$("#submitBtnId").attr("value","Update").attr("onclick","updateCareGiver('"+webDataCnt.careGiverId+"')"); 
	 		}
	 	}
	}
	
	function updateCareGiver(care_giver_id) {
		var flag = true;
		flag = formValidate("careGiverFormId");
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to update data?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		$("#care_giver_id").val(care_giver_id);
			    		var serviceURL='${pageContext.request.contextPath}/mainAjax/updateCareGiver';
					   	var serviceData=$("#careGiverFormId").serialize();
					   	var map=saveFormApplication(serviceURL,serviceData,"loader","careGiverFormId");
					   	var serviceStatus=map.get("serviceStatus");
					   	var res=map.get("serviceResponse");
					   	if(serviceStatus == 1)
					   	{
					   		$("#care_giver_id").val('');
					   		$("#submitBtnId").attr("value","Submit").attr("onclick","saveCareGiverDetails()"); 
					   		getAllCareGivers();
					   	}
			    	}
				}
	   		});
		} 
	}
	
	function deleteCareGiver(care_giver_id) {
		var flag = true;
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to delete data?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		$("#care_giver_id").val(care_giver_id);
			    		var serviceURL='${pageContext.request.contextPath}/mainAjax/deleteCareGiver/'+care_giver_id;
					   	var serviceData=$("#careGiverFormId").serialize();
					   	var map=saveFormApplication(serviceURL,serviceData,"loader","careGiverFormId");
					   	var serviceStatus=map.get("serviceStatus");
					   	var res=map.get("serviceResponse");
					   	if(serviceStatus == 1)
					   	{
					   		$("#care_giver_id").val('');
					   		getAllCareGivers();
					   	}
			    	}
				}
	   		});
		} 
	}
	
	function uploadCareGiversData() {
		var flag = true;
		flag = formValidate("uploadExcelFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to upload data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		
						var serviceURL = '${pageContext.request.contextPath}/mainAjax/uploadCareGiverMasterExcel';
					   	var serviceData = new FormData($("#uploadExcelFormId")[0]);
					   	saveFormApplicationWithMultiPartAndCallBack(serviceURL,serviceData,"loader","uploadExcelFormId",callbackUploadCareGiversData);
			    	}
				}
	   		});
		}
	}
	
	function callbackUploadCareGiversData(map) {
		var serviceStatus = map.get("serviceStatus");
	   	if(serviceStatus == 1)
		{
	   		var res = map.get("serviceResponse");
	   		$('#viewUploadExcelModal').modal('toggle');
		}
	}
</script>