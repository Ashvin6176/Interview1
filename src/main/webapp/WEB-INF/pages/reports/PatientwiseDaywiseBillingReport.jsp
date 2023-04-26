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
			<h1>Patientwise Daywise Billing Report</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Reports</li>
				<li class="breadcrumb-item active">Patientwise Daywise Billing Report</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="main-innerbody">
				<!-- tabs -->
				<div class="row">
					<div class="col-12">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Billing Report</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="billingFormId" name="billingForm">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Billing Period</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" aria-hidden="true"
															id="week_date" name="weekDate" onchange="">
															<option value="" selected>SELECT</option>
														</select>
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Patient Name</label> 
														<select class="form-control select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" aria-hidden="true"
															id="patient_name" name="patientName" onchange="">
															<option value="" selected>SELECT</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Search" id="searchBtnId" onclick="searchBillingReport();">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="contentDiv">
									<jsp:include page="../../common/commonExportExcelPdf.jsp">
						         		<jsp:param value="billingTableId" name="table"/>
						         		<jsp:param value="Patientwise Daywise Billing Report" name="name"/>
						         		<jsp:param value="validateTableDivId" name="divId"/>
						         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
						         	</jsp:include>
									<div id="validateTableDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive" id="billingTableId">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>Patient Name</th>
													<th>Coordinator</th>
													<th>Contract</th>
													<th>Service Code</th>
													<th>Visit Date</th>
													<th>Scheduled Time</th>
													<th>Scheduled Duration</th>
													<th>Visit Time</th>
													<th>Visit Duration</th>
													<th>Rate Per Hour ($)</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
											<tfoot>
											</tfoot>
										</table>
									</div>
								</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<script>
	$(document).ready(() => {
		fillDropdownCommon("week_date", "getWeeklyBasePeriodData", JSON.stringify(""));
		fillDropdownCommon("patient_name", "getPatientMasterData", JSON.stringify(""));
		
		let weekDate = '${requestScope.weekDate}';
		let patientName = '${requestScope.patientName}';
		if(weekDate != '') {
			$('#week_date').val(weekDate);
			$('#patient_name').val(patientName);
			searchBillingReport();
		}
	});
	
	function searchBillingReport() {
		var flag = true;
		flag = formValidate("billingFormId");
		
		if (flag) {
			$('#billingTableId').DataTable().destroy();
			$("#billingTableId > tbody").empty();
			let mstId = $('#week_date').val();
			let patientName = $('#patient_name').val() != '' ? $('#patient_name').val() : '-1';
			var webData = "";
			var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getPatientwiseDaywiseReport/'+mstId+'/'+patientName;
			var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setBillingData);
		}
	}
	
	function setBillingData(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		if(webDataCnt != null){
	 			$.each(webDataCnt, (index,value) => {
					let bodyRow = $("<tr/>");
					bodyRow.append($("<td/>").addClass("text-center").append(index + 1));
					bodyRow.append($("<td/>").addClass("text-center").append(value.PATIENT_NAME));
					bodyRow.append($("<td/>").addClass("text-center").append(value.COORDINATOR)); 
					bodyRow.append($("<td/>").addClass("text-center").append(value.CONTRACT)); 
					bodyRow.append($("<td/>").addClass("text-center").append(value.SERVICE_CODE));
					bodyRow.append($("<td/>").addClass("text-center").append(value.VISIT_DATE));
					bodyRow.append($("<td/>").addClass("text-center").append(value.SCHEDULED));
					bodyRow.append($("<td/>").addClass("text-center").append(value.SCHEDULED_DURATION));
					bodyRow.append($("<td/>").addClass("text-center").append(value.VISIT_TIME));
					bodyRow.append($("<td/>").addClass("text-center").append(value.DURATION));
					bodyRow.append($("<td/>").addClass("text-right").append(value.RATE_PER_HOUR));
					$("#billingTableId > tbody").append(bodyRow);
				});
	 		}
	 	}
	 	$('#billingTableId').dataTable();
	 	$('#billingTableId').parent().addClass('table-responsive');
	}
</script>