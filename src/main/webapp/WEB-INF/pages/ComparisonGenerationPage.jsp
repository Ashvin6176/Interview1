<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	table tr td button {
		color: white !important;
	}
	
	table tr td input {
		width: 160px !important;
	}
</style>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Comparison Generation</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><iclass="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active">Comparison Generation</li>
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
								<h3 class="box-title">Comparison Generation</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
												<div class="col-12 col-md-6">
													<div class="form-group">
														<label for="billPeriodId">Billing Period</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" name="billPeriodId"
															aria-hidden="true" id="billPeriodId" onchange="">
															<option value="" selected>SELECT</option>
															<option value="1">Week-1 (02-Jan-2023 to 08-Jan-2023)</option>
															<option value="2">Week-2 (09-Jan-2023 to 15-Jan-2023)</option>
															<option value="3">Week-3 (16-Jan-2023 to 22-Jan-2023)</option>
															<option value="4">Week-4 (23-Jan-2023 to 29-Jan-2023)</option>
														</select>
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Submit" id="SubmitId" onclick="saveCareGiverDetails(event);">
													</div>
												</div>
											</div>
										</div>
									</div>
							</form:form>
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
								<h3 class="box-title">Search Comparison Generation</h3>
							</div>
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="billPeriodId">Billing Period</label> 
													<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
														style="width: 100%;" tabindex="-1" name="insuranceCompany"
														aria-hidden="true" id="insuranceCompanyId" onchange="">
														<option value="" selected>SELECT</option>
														<option value="1">Week-1 (02-Jan-2023 to 08-Jan-2023)</option>
														<option value="2">Week-2 (09-Jan-2023 to 15-Jan-2023)</option>
														<option value="3">Week-3 (16-Jan-2023 to 22-Jan-2023)</option>
														<option value="4">Week-4 (23-Jan-2023 to 29-Jan-2023)</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 text-center">
												<div class="form-group">
													<input type="button" class="btn btn-success" value="Search" id="SearchId" onclick="">
												</div>
											</div>
										</div>
										<div id="validateDivId">
											<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive">
												<thead>
													<tr>
														<th>Sr No</th>
														<th>Last Name</th>
														<th>First Name</th>
														<th>DOB</th>
														<th>MLTC</th>
														<th>Diag.</th>
							<!-- 							<th>U.M.</th> -->
														<th>AUTH.</th>
														<th>Total Hours</th>
														<th>Total Units</th>
														<th>Rate Per Hour ($)</th>
														<th>Total Bill Amount ($)</th>
														<th>Money Received From Insurance Company - Amount ($)</th>
														<th>Difference ($)</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>1</th>
														<td>Hammond</td>
														<td>Eddie</td>
														<td>7/14/1946</td>
														<td>CPHL</td>
														<td>R68.89</td>
							<!-- 							<td>U1</td> -->
														<td>3103640</td>
														<td>35</td>
														<td>140</td>
														<td>21</td>
														<td>735.00</td>
														<td>693.00</td>
														<td>42.00</td>
														<td>
															<button type="button" class="btn btn-sm btn-primary" onclick="acceptBillingDiff(1);">Accept</button>
															<button type="button" class="btn btn-sm btn-danger" onclick="rejectBillingDiff(1);">Reject</button>
														</td>
													</tr>
													<tr>
														<th>2</th>
														<td>Begum</td>
														<td>Musammat M</td>
														<td>7/7/1950</td>
														<td>CPHL</td>
														<td>R68.89</td>
							<!-- 							<td>U1</td> -->
														<td>3415695</td>
														<td>4</td>
														<td>16</td>
														<td>15</td>
														<td>60.00</td>
														<td>45.00</td>
														<td>15.00</td>
														<td>
															<button type="button" class="btn btn-sm btn-primary" onclick="acceptBillingDiff(2);">Accept</button>
															<button type="button" class="btn btn-sm btn-danger" onclick="rejectBillingDiff(2);">Reject</button>
														</td>
													</tr>
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
	function saveCareGiverDetails(e) {
		e.preventDefault();
		let flag = validateForm('CareGiverFormId');
		
		if(flag){
			let billPeriod = $('#billPeriodId').val();
			openToastMessage('Comparison Generation','Comparison Generated Successfully...','success');
			$("#CareGiverFormId button[type='reset']").click();
			resetValidation('CareGiverFormId');
			$('#weekDateId').val(billPeriod);
			searchDetails();
		}
		
		return false;
	}
	
	function searchDetails() {
		let flag = validateForm('searchFormId');
		
		flag ? $("#tableDataId").show() : $("#tableDataId").hide();
	}
	
	function resetSearchForm() {
		$('#searchFormId').trigger("reset");
		searchDetails();
		resetValidation('searchFormId');
	}
	
	function acceptBillingDiff(rowNo) {
		let acceptedSpan = $('<span/>').addClass('badge rounded-pill bg-success').append('Accepted');
		$('table tbody tr:nth-child('+ rowNo +') button.btn-primary').parent('td').empty()
				.attr({'style': 'text-align: center;vertical-align: middle;'}).append(acceptedSpan);
		
		openToastMessage('Comparison Generation','Difference Amount Accepted Successfully...','success');
	}
	
	function rejectBillingDiff(rowNo) {
		let rejectedSpan = $('<span/>').addClass('badge rounded-pill bg-danger').append('Rejected');
		$('table tbody tr:nth-child('+ rowNo +') button.btn-danger').parent('td').empty()
				.attr({'style': 'text-align: center;vertical-align: middle;'}).append(rejectedSpan);
		
		openToastMessage('Comparison Generation','Difference Amount Rejected Successfully...','success');
	}
</script>