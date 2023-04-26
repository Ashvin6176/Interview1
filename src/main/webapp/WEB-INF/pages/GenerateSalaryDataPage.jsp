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
			<h1>Generate Salary Data</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Transactions</li>
				<li class="breadcrumb-item active">Generate Salary Data</li>
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
								<h3 class="box-title">Salary Data</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="salaryFormId" name="salaryForm">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Salary Period</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" aria-hidden="true"
															id="week_date" name="week_date" onchange="">
															<option value="" selected>SELECT</option>
														</select>
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Generate" id="submitBtnId" onclick="searchSalaryData();">
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
								<h3 class="box-title">Search Salary Data</h3>
							</div>
							<form:form id="searchFormId" name="searchForm">
								<div class="box-body">
									<div id="contentDiv">
										<!-- <div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="billPeriodId">Salary Period</label> 
													<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
														style="width: 100%;" tabindex="-1" aria-hidden="true"
														id="salary_period" name="salaryPeriod" onchange="">
														<option value="" selected>SELECT</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 text-center">
												<div class="form-group">
													<input type="button" class="btn btn-success" value="Search" id="searchBtnId" onclick="searchSalaryData();">
												</div>
											</div>
										</div> -->
										<jsp:include page="../common/commonExportExcelPdf.jsp">
							         		<jsp:param value="salaryTableId" name="table"/>
							         		<jsp:param value="Salary Data" name="name"/>
							         		<jsp:param value="validateTableDivId" name="divId"/>
							         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
							         	</jsp:include>
										<div id="validateTableDivId">
											<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive" id="salaryTableId">
												<thead>
													<tr>
														<th>Sr No</th>
														<th>Employee Id</th>
														<th>Patient</th>
														<th>Care Giver</th>
														<th>Pay Hours</th>
														<th>Pay Rate per Hour ($)</th>
														<th>Weekly Pay Amount ($)</th>
														<th>Additional Wages Rate per Hour ($)</th>
														<th>Additional Wages ($)</th>
														<th>Total Amount ($)</th>
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
	
	function generateSalaryData() {
		var flag = true;
		flag = formValidate("salaryFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
						 var serviceURL = '${pageContext.request.contextPath}/mainAjax/generateSalaryData';
					   	 var serviceData = $("#salaryFormId").serialize();
					   	 var map = saveFormApplication(serviceURL,serviceData,"loader","salaryFormId");
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
	
	function searchSalaryData() {
		var flag = true;
		flag = formValidate("salaryFormId");
		
		if (flag) {
			$('#salaryTableId').DataTable().destroy();
			$("#salaryTableId > tbody").empty();
			let mstId = $('#week_date').val();
			var webData = "";
			var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getSalaryData/'+mstId;
			var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setSalaryData);
		}
	}
	
	function setSalaryData(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		if(webDataCnt != null){
	 			$.each(webDataCnt, (index,value) => {
					let bodyRow = $("<tr/>");
					bodyRow.append($("<td/>").addClass("text-center").append(index + 1));
					bodyRow.append($("<td/>").addClass("text-center").append(value.EMPLOYEE_ID));
					bodyRow.append($("<td/>").addClass("text-center").append(value.PATIENT_NAME)); 
					bodyRow.append($("<td/>").addClass("text-center").append(value.CAREGIVER_NAME));
					bodyRow.append($("<td/>").addClass("text-center").append(value.TOTAL_HOURS+' hours '+value.TOTAL_MINUTES+' minutes'));
					bodyRow.append($("<td/>").addClass("text-right").append(value.RATE_PER_HOUR));
					bodyRow.append($("<td/>").addClass("text-right").append(numberFormatWithCommas(value.WEEKLY_PAY_AMOUNT)));										
					bodyRow.append($("<td/>").addClass("text-right").append(value.ADDITIONAL_WAGE_RATE));
					bodyRow.append($("<td/>").addClass("text-right").append(numberFormatWithCommas(value.ADDITIONAL_WAGE_AMOUNT)));										
					bodyRow.append($("<td/>").addClass("text-right").append(numberFormatWithCommas(value.TOTAL_AMOUNT)));										
					$("#salaryTableId > tbody").append(bodyRow);
				});
	 		}
	 	}
	 	totalForPagination('salaryTableId','5','10','0');
	 	$('#salaryTableId').parent().addClass('table-responsive');
	}
</script>