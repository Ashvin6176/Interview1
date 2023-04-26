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
			<h1>Upload Weekly Base Data</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Transactions</li>
				<li class="breadcrumb-item active">Upload Weekly Base Data</li>
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
								<h3 class="box-title">Weekly Base Data</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="weeklyDataFormId" name="weeklyDataForm" enctype="multipart/form-data" autocomplete="off">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="text-end">
<!-- 							                  <a class="primary" href="../resources/excels/WeeklyBaseData.xls"><i class="ri-file-excel-2-line"></i>Download Demo Excel</a> -->
							                </div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">From Date</label> 
														<input type="text" id="from_date" name="fromDate" class="form-control date_class ValidateInput" placeholder="DD-MMM-YYYY">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">To Date</label> 
														<input type="text" id="to_date" name="toDate" class="form-control date_class ValidateInput" placeholder="DD-MMM-YYYY">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Agency Name</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" aria-hidden="true" 
															id="agency_name" name="agencyName" onchange="">
															<option value="" selected>SELECT</option>
															<option value="1">Agency 1</option>
															<option value="2">Agency 2</option>
														</select>
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Excel</label> 
														<input type="file" id="weekly_data" name="weeklyData" class="form-control ValidateInput" accept=".xlsx, .xls, .csv">
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Upload" id="submitBtnId" onclick="uploadWeeklyBaseData();">
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
								<h3 class="box-title">Search Weekly Base Data</h3>
							</div>
							<form:form id="searchFormId" name="searchForm">
								<div class="box-body">
									<div id="contentDiv">
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="billPeriodId">Week Date</label> 
													<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
														style="width: 100%;" tabindex="-1" aria-hidden="true"
														id="week_date" name="week_date" onchange="">
														<option value="" selected>SELECT</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 text-center">
												<div class="form-group">
													<input type="button" class="btn btn-success" value="Search" id="searchBtnId" onclick="searchWeeklyBaseData();">
												</div>
											</div>
										</div>
										<jsp:include page="../common/commonExportExcelPdf.jsp">
							         		<jsp:param value="weeklyDataTableId" name="table"/>
							         		<jsp:param value="Week Base Data" name="name"/>
							         		<jsp:param value="validateTableDivId" name="divId"/>
							         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
							         	</jsp:include>
										<div id="validateTableDivId">
											<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive" id="weeklyDataTableId">
												<thead>
													<tr>
														<th>Sr No</th>
														<th>Patient Name</th>
														<th>Care Giver Name</th>
														<th>Coordinator</th>
														<th>Visit ID</th>
														<th>Visit Date</th>
														<th>Scheduled</th>
														<th>Scheduled Duration</th>
														<th>Visit Time</th>
														<th>Visit Duration</th>
														<th>Hold Visit for Billing</th>
														<th>Contract</th>
														<th>Service Code</th>
														<th>Payrate Code</th>
														<th>Pay Rate</th>
														<th>Discipline</th>
														<th>Billed</th>
														<th>Invoice Number</th>
														<th>Invoice Date</th>
														<th>TS</th>
														<th>Visit Created Date</th>
														<th>Visit Last Modified Date</th>
														<th>Missed Visit</th>
														<th>County</th>
													</tr>
												</thead>
												<tbody>
													
												</tbody>
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
	});
	
	function uploadWeeklyBaseData() {
		var flag = true;
		flag = formValidate("weeklyDataFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
			    		
						var serviceURL = '${pageContext.request.contextPath}/mainAjax/uploadWeeklyBaseData';
					   	var serviceData = new FormData($("#weeklyDataFormId")[0]);
					   	saveFormApplicationWithMultiPartAndCallBack(serviceURL,serviceData,"loader","weeklyDataFormId",callbackUploadWeeklyBaseData);
			    	}
				}
	   		});
		}
	}
	
	function callbackUploadWeeklyBaseData(map) {
		var serviceStatus = map.get("serviceStatus");
	   	if(serviceStatus == 1)
		{
	   		var res = map.get("serviceResponse");
	   		fillDropdownCommon("week_date", "getWeeklyBasePeriodData", JSON.stringify(""));
		}
	}
	
	function searchWeeklyBaseData() {
		var flag = true;
		flag = formValidate("searchFormId");
		
		if (flag) {
			$('#weeklyDataTableId').DataTable().destroy();
			$("#weeklyDataTableId > tbody").empty();
			let mstId = $('#week_date').val();
			var webData = "";
			var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getWeeklyBaseData/'+mstId;
			var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setWeeklyBaseData);
		}
	}
	
	function setWeeklyBaseData(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		if(webDataCnt != null){
	 			let dtlDataList = webDataCnt.dtlList;
	 			$.each(dtlDataList, (index,dtlBo) => {
					let bodyRow = $("<tr/>");
					bodyRow.append($("<td/>").addClass("text-center").append(index + 1));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.patientName));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.caregiverName)); 
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.coordinator));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.visitId));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.visitDate));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.scheduled));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.scheduledDuration));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.visitTime));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.duration));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.holdVisitForBilling));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.contract));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.serviceCode));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.payrateCode));
					bodyRow.append($("<td/>").addClass("text-right").append(dtlBo.payRate));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.discipline));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.billed));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.invoiceNumber));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.invoiceDate));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.ts));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.visitCreatedDate));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.visitLastModifiedDate));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.missedVisit));
					bodyRow.append($("<td/>").addClass("text-center").append(dtlBo.county));
					
					$("#weeklyDataTableId > tbody").append(bodyRow);
				});
	 		}
	 	}
	 	$('#weeklyDataTableId').dataTable({
			 "orderClasses": false
		});
	 	$('#weeklyDataTableId').parent().addClass('table-responsive');
	}
</script>