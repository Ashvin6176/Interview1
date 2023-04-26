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
			<h1>Manage Insurance Company</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item">Master Configuration</li>
				<li class="breadcrumb-item active">Manage Insurance Company</li>
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
								<h3 class="box-title">Insurance Company Details</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="companyFormId" name="companyForm">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Insurance Company Name</label> 
														<input type="text" id="company_name" name="name" class="form-control" placeholder="Insurance Company Name">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Insurance Company Code</label> 
														<input type="text" id="company_code" name="code" class="form-control" placeholder="Insurance Company Code">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Email</label> 
														<input type="email" id="email_id" name="email" class="form-control" placeholder="Email">
													</div>
												</div>
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Contact No</label> 
														<input type="text" id="contact_no" name="contactNo" class="form-control" placeholder="Contact No">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-12">
													<div class="form-group">
														<label for="billPeriodId">Address</label> 
														<textarea id="address_id" name="address" class="form-control" style="height: 100px" placeholder="Address"></textarea>
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Submit" id="submitBtnId" onclick="saveInsuranceCompDetails();">
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
								<h3 class="box-title">Insurance Company List</h3>
							</div>
							<div class="box-body">
								<div id="contentDiv">
									<jsp:include page="../common/commonExportExcelPdf.jsp">
						         		<jsp:param value="companyTableId" name="table"/>
						         		<jsp:param value="Insurance Comapany Data" name="name"/>
						         		<jsp:param value="validateTableDivId" name="divId"/>
						         		<jsp:param value="ReportHeaderDivId" name="headerDivId"/>
						         	</jsp:include>
									<div id="validateTableDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md" id="companyTableId">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>Name</th>
													<th>Code</th>
													<th>Email</th>
													<th>Contact No</th>
													<th>Address</th>
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
		getAllInsuranceComp();
	});
	
	function saveInsuranceCompDetails() {
		var flag = true;
		flag = formValidate("companyFormId");
		
		if (flag) {
			bootbox.confirm({
				title : '<%=Constants.PROJECT_TITLE%>',
				message: "Do you want to save data ?",
			    callback: function(result)
			    { 
			    	if(result)
			    	{
						 var serviceURL = '${pageContext.request.contextPath}/mainAjax/saveInsuranceCompany';
					   	 var serviceData = $("#companyFormId").serialize();
					   	 var map = saveFormApplication(serviceURL,serviceData,"loader","companyFormId");
					   	 var serviceStatus = map.get("serviceStatus");
					   	 var res = map.get("serviceResponse");
					   	 if(serviceStatus == 1)
						 {
					   		getAllInsuranceComp();
						 }
			    	}
				}
	   		});
		}
	}
	
	function getAllInsuranceComp() {
		$('#companyTableId').DataTable().destroy();
		$("#companyTableId > tbody").empty();
		var webData = "";
		var webDataUrl = '${pageContext.request.contextPath}/mainAjax/getAllInsuranceCompanies';
		var webDataMap = genericAjaxCallForJsonWithLoaderWithCallbackMethod("GET", webDataUrl, JSON.stringify(webData), "loader", setInsuranceCompList); 
	}
	
	function setInsuranceCompList(webDataMap) {
		var webDataStatus = webDataMap.get("serviceStatus");
	 	if(webDataStatus == '1'){
	 		var webDataCnt = webDataMap.get("serviceResponse").responseData;
	 		
	 		if (webDataCnt.length > 0) {
				$.each(webDataCnt, (index) => {
					var bodyRow = $("<tr/>");
					bodyRow.append($("<td/>").addClass("text-center").append(index + 1));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].name));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].code));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].email)); 
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].contactNo));
					bodyRow.append($("<td/>").addClass("text-center").append(webDataCnt[index].address));
// 					bodyRow.append($("<td/>").append($("<button/>").attr("href","#").attr("onclick","editCareGiver('"+ webDataCnt[index].careGiverId+ "')")
// 														.addClass("btn btn-primary ml-2 btn-sm defaultPrivilege").append("Edit")
// 													)
// 											.append($("<button/>").attr("href","#").attr("onclick","deleteCareGiver('"+ webDataCnt[index].careGiverId+ "')")
// 														.addClass("btn btn-danger ml-2 btn-sm defaultPrivilege").append("Delete")
// 													));
					$("#companyTableId > tbody").append(bodyRow);
				});
			}
	 		else {
	        		
	        }
	 		
	 		$('#companyTableId').dataTable({
				 "orderClasses": false
			});
			$("#companyTableId").parent().addClass('table-responsive');
	 	}
	}
</script>