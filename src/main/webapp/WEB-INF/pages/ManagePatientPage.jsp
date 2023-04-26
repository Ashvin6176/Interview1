<%@ page import="com.ict.mahadev.constant.Constants"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Manage Patient</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Master Configuration</li>
				<li class="breadcrumb-item active">Manage Patient</li>
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
				        		<h5 class="modal-title text-capitalize" id="viewUploadExcelModalLabel">Upload Patients Data Excel</h5>
						        <button type="button" class="close defaultPrivilege" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
				      		</div>
				      		<div class="modal-body">
								<div class="main-innerbody">
									<div class="row">
										<div class="col-12">
											<div class="box box-default">
												<form:form id="uploadExcelFormId" name="uploadExcelForm" enctype="multipart/form-data" autocomplete="off">
													<div class="box-body">
														<div id="contentDiv">
															<div class="text-right">
											                	<a class="badge bg-primary text-wrap" href="../mainAjax/getPatientsDataExcel"><i class="fa fa-file-excel-o"></i> Download Excel</a>
											                </div>
											                <div class="row">
											                	<div class="col-12 col-md-6">
																	<div class="form-group">
																		<label for="billPeriodId">Excel</label> 
																		<input type="file" id="patients_data" name="patientsData" class="form-control ValidateInput" accept=".xlsx, .xls, .csv">
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-12 text-center">
																	<div class="form-group">
																		<input type="button" class="btn btn-success" value="Upload" id="uploadBtnId" onclick="uploadPatientsData();">
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
				      		<div class="modal-footer text-right">
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
								<h3 class="box-title">Patient Details</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="patientFormId" name="patientForm">
								<input type="hidden" id="patient_id" name="patientId" />
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="text-right">
												<a href="#viewUploadExcelModal" data-toggle="modal" class="badge bg-primary text-wrap"><i class="fa fa-user"></i> Upload Excel</a>
							                </div>
											<div class="row">
												<div class="col-12 col-md-12">
													<div class="form-group">
														<label for="billPeriodId">Patient Full Name</label> 
														<input type="text" id="patient_name" name="name" class="form-control ValidateInput" placeholder="Patient Full Name">
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
														<label for="billPeriodId">Patient Account Number</label> 
														<input type="text" id="account_number" name="accountNumber" class="form-control ValidateInput" placeholder="Patient Account Number">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">INSURANCE COMPANY</label> 
														<select id="insurance_company" name="insuranceCompany" class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" name="insuranceCompany"
															aria-hidden="true" id="insuranceCompanyId" onchange="">
															<option value="" selected>SELECT</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-12">
													<div class="form-group">
														<label for="billPeriodId">Auth Number</label> 
														<input type="text" id="auth_number" name="authNumber" class="form-control ValidateInput" placeholder="Auth Number">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Auth From Date</label> 
														<input type="text" id="auth_from_date" name="authFromDate" class="form-control date_class" placeholder="Auth From Date">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Auth To Date</label> 
														<input type="text" id="auth_to_date" name="authToDate" class="form-control date_class" placeholder="Auth To Date">
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
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Submit" id="submitBtnId" onclick="savePatientDetails();">
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
								<h3 class="box-title">Patient List</h3>
							</div>
							<div class="box-body">
								<div id="contentDiv">
									<jsp:include page="../common/commonExportExcelPdf.jsp">
						         		<jsp:param value="patientTableId" name="table"/>
						         		<jsp:param value="Patient Data" name="name"/>
						         		<jsp:param value="validateTableDivId" name="divId"/>
						         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
						         	</jsp:include>
									<div id="validateTableDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md" id="patientTableId">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>Patient Name</th>
													<th>Email</th>
													<th>Contact No</th>
													<th>Address</th>
													<th>Patient Account Number</th>
													<th>Insurance Company</th>
													<th>Auth Number</th>
													<th>Auth From Date</th>
													<th>Auth To Date</th>
													<th>Rate Per Hour ($)</th>
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
		fillDropdownCommon("insurance_company", "getInsuranceCompData", JSON.stringify(""));
		getAllPatients();
	});
	
	function savePatientDetails() {
		var flag = true;
		flag = formValidate("patientFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
						 var serviceURL = '${pageContext.request.contextPath}/mainAjax/savePatient';
					   	 var serviceData = $("#patientFormId").serialize();
					   	 var map = saveFormApplication(serviceURL,serviceData,"loader","patientFormId");
					   	 var serviceStatus = map.get("serviceStatus");
					   	 var res = map.get("serviceResponse");
					   	 if(serviceStatus == 1)
						 {
					   		getAllPatients();
						 }
			    	}
				}
	   		});
		}
	}
	
	function getAllPatients() {
		$('#patientTableId').DataTable().destroy();
		$("#patientTableId > tbody").empty();
		var webData = "";
		var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getAllPatients';
		var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setPatientList); 
	}
	
	function setPatientList(webDataMap) {
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
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].accountNumber));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].insuranceCompany));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].authNumber));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].authFromDate));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].authToDate));
					bodyRow.append($("<td/>").addClass("text-right").append(webDataCnt[index].ratePerHour));
					bodyRow.append($("<td/>").append($("<button/>").attr("href","#").attr("onclick","editPatient('"+ webDataCnt[index].patientId+ "')")
														.addClass("btn btn-primary ml-2 btn-sm defaultPrivilege").append("Edit")
													)
											.append($("<button/>").attr("href","#").attr("onclick","deletePatient('"+ webDataCnt[index].patientId+ "')")
														.addClass("btn btn-danger ml-2 btn-sm defaultPrivilege").append("Delete")
													));
					$("#patientTableId > tbody").append(bodyRow);
				});
			}
	 		else {
	        		
	        }
	 		
	 		$('#patientTableId').dataTable({
				 "orderClasses": false
			});
	 		$('#patientTableId').parent().addClass('table-responsive');
	 	}
	}
	
	function editPatient(patient_id) {
		var webData = "";
		var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getPatient/'+patient_id;
		var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setPatientValue); 
	}
	
	function setPatientValue(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		if(webDataCnt != null){
	 	 		$('#patient_name').val(webDataCnt.name);
	 	 		$('#email_id').val(webDataCnt.email);
	 	 		$('#contact_no').val(webDataCnt.contactNo);
	 	 		$('#address_id').val(webDataCnt.address);
	 	 		$('#account_number').val(webDataCnt.accountNumber);
	 	 		$('#insurance_company').val(webDataCnt.insuranceCompany);
	 	 		$('#auth_number').val(webDataCnt.authNumber);
	 	 		$('#auth_from_date').val(webDataCnt.authFromDate);
	 	 		$('#auth_to_date').val(webDataCnt.authToDate);
	 	 		$('#rate_per_hour').val(webDataCnt.ratePerHour);
	 	 		$("#submitBtnId").attr("value","Update").attr("onclick","updatePatient('"+webDataCnt.patientId+"')"); 
	 		}
	 	}
	}
	
	function updatePatient(patient_id) {
		var flag = true;
		flag = formValidate("patientFormId");
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to update data?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		$("#patient_id").val(patient_id);
			    		var serviceURL='${pageContext.request.contextPath}/mainAjax/updatePatient';
					   	var serviceData=$("#patientFormId").serialize();
					   	var map=saveFormApplication(serviceURL,serviceData,"loader","patientFormId");
					   	var serviceStatus=map.get("serviceStatus");
					   	var res=map.get("serviceResponse");
					   	if(serviceStatus == 1)
					   	{
					   		$("#patient_id").val('');
					   		$("#submitBtnId").attr("value","Submit").attr("onclick","savePatientDetails()"); 
					   		getAllPatients();
					   	}
			    	}
				}
	   		});
		} 
	}
	
	function deletePatient(patient_id) {
		var flag = true;
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to delete data?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		$("#patient_id").val(patient_id);
			    		var serviceURL='${pageContext.request.contextPath}/mainAjax/deletePatient/'+patient_id;
					   	var serviceData=$("#patientFormId").serialize();
					   	var map=saveFormApplication(serviceURL,serviceData,"loader","patientFormId");
					   	var serviceStatus=map.get("serviceStatus");
					   	var res=map.get("serviceResponse");
					   	if(serviceStatus == 1)
					   	{
					   		$("#patient_id").val('');
					   		getAllPatients();
					   	}
			    	}
				}
	   		});
		} 
	}
	
	function uploadPatientsData() {
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
			    		
						var serviceURL = '${pageContext.request.contextPath}/mainAjax/uploadPatientMasterExcel';
					   	var serviceData = new FormData($("#uploadExcelFormId")[0]);
					   	saveFormApplicationWithMultiPartAndCallBack(serviceURL,serviceData,"loader","uploadExcelFormId",callbackUploadPatientsData);
			    	}
				}
	   		});
		}
	}
	
	function callbackUploadPatientsData(map) {
		var serviceStatus = map.get("serviceStatus");
	   	if(serviceStatus == 1)
		{
	   		var res = map.get("serviceResponse");
	   		$('#viewUploadExcelModal').modal('toggle');
		}
	}
</script>