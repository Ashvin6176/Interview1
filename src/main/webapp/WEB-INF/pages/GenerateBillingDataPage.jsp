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
			<h1>Generate Billing Data</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Transactions</li>
				<li class="breadcrumb-item active">Generate Billing Data</li>
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
								<h3 class="box-title">Billing Data</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="billingFormId" name="billingForm">
								<input type="hidden" id="patient_name" name="patientName" />
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
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Generate" id="submitBtnId" onclick="searchBillingData();"> <!-- generateBillingData(); -->
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
								<h3 class="box-title">Search Billing Data</h3>
							</div>
							<form:form id="searchFormId" name="searchForm">
								<div class="box-body">
									<div id="contentDiv">
										<!-- <div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="billPeriodId">Billing Period</label> 
													<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
														style="width: 100%;" tabindex="-1" aria-hidden="true"
														id="billing_period" name="billingPeriod" onchange="">
														<option value="" selected>SELECT</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 text-center">
												<div class="form-group">
													<input type="button" class="btn btn-success" value="Search" id="searchBtnId" onclick="searchBillingData();">
												</div>
											</div>
										</div> -->
										<jsp:include page="../common/commonExportExcelPdf.jsp">
							         		<jsp:param value="billingTableId" name="table"/>
							         		<jsp:param value="Billing Data" name="name"/>
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
														<th>Total Hours</th>
														<th>Rate Per Hour ($)</th>
														<th>Total Bill Amount ($)</th>
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
	});
	
	function generateBillingData() {
		var flag = true;
		flag = formValidate("billingFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
						 var serviceURL = '${pageContext.request.contextPath}/mainAjax/generateBillingData';
					   	 var serviceData = $("#billingFormId").serialize();
					   	 var map = saveFormApplication(serviceURL,serviceData,"loader","billingFormId");
					   	 var serviceStatus = map.get("serviceStatus");
					   	 var res = map.get("serviceResponse");
					   	 if(serviceStatus == 1)
						 {
					   		console.log('Success');
						 }
			    	}
				}
	   		});
		}
	}
	
	function searchBillingData() {
		var flag = true;
		flag = formValidate("billingFormId");
		
		if (flag) {
			$('#billingTableId').DataTable().destroy();
			$("#billingTableId > tbody").empty();
			let mstId = $('#week_date').val();
			var webData = "";
			var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getBillingData/'+mstId;
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
					let spanEle = $("<span/>").attr({"onclick":"viewPatientwiseDaywiseReport('"+value.PATIENT_NAME+"');", "style":"cursor: pointer; color: blue;"}).append(value.PATIENT_NAME);
					bodyRow.append($("<td/>").addClass("text-center").append(spanEle));
					bodyRow.append($("<td/>").addClass("text-center").append(value.COORDINATOR)); 
					bodyRow.append($("<td/>").addClass("text-center").append(value.CONTRACT)); 
					bodyRow.append($("<td/>").addClass("text-center").append(value.SERVICE_CODE));
					bodyRow.append($("<td/>").addClass("text-center").append(value.TOTAL_HOURS+' hours '+value.TOTAL_MINUTES+' minutes'));
					bodyRow.append($("<td/>").addClass("text-right").append(value.RATE_PER_HOUR));
					bodyRow.append($("<td/>").addClass("text-right").append(numberFormatWithCommas(value.TOTAL_BILL_AMOUNT)));										
					$("#billingTableId > tbody").append(bodyRow);
				});
	 		}
	 	}
	 	totalForPagination('billingTableId','6','8','0');
	 	$('#billingTableId').parent().addClass('table-responsive');
	}
	
	function viewPatientwiseDaywiseReport(patientName) {
		$('#patient_name').val(patientName);
		document.billingForm.action="${pageContext.request.contextPath}/main/patientwiseDaywiseBillingReport";
		document.billingForm.target="_blank";
		document.billingForm.submit();
	}
</script>