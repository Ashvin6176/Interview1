<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Patient Care Giver Mapping</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><iclass="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active">Patient Care Giver Mapping</li>
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
								<h3 class="box-title">Mapping Details</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">From Date</label> 
														<input type="text" class="form-control date_class" placeholder="From Date">
													</div>
												</div>
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">To Date</label> 
														<input type="text" class="form-control date_class" placeholder="To Date">
													</div>
												</div>
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Patient</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" name="insuranceCompany"
															aria-hidden="true" id="insuranceCompanyId" onchange="">
															<option value="" selected>SELECT PATIENT</option>
															<option value="1">Hammond Eddie</option>
															<option value="2">Perdomo Luz</option>
															<option value="3">Zhao Lingtian</option>
														</select>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Care Giver</label> 
														<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
															style="width: 100%;" tabindex="-1" name="insuranceCompany"
															aria-hidden="true" id="insuranceCompanyId" onchange="">
															<option value="" selected>SELECT CARE GIVER</option>
															<option value="1">Abdul Ahad Samandary</option>
															<option value="2">Fahmida Akter</option>
															<option value="3">Afia Chowdhury</option>
														</select>
													</div>
												</div>
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Rate Per Hour ($)</label> 
														<input type="number" class="form-control" placeholder="Rate Per Hour ($)">
													</div>
												</div>
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Additional Wages Rate ($)</label> 
														<input type="number" class="form-control" placeholder="Additional Wages Rate ($)">
													</div>
												</div>
											</div>
											<br>

											<div class="row">
												<div class="col-md-12 text-center">
													<div class="form-group">
														<input type="button" class="btn btn-success" value="Submit" id="SubmitId" onclick="">
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
								<h3 class="box-title">Mapping List</h3>
							</div>
							<div class="box-body">
								<div id="contentDiv">
									<div id="validateDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>From Date</th>
													<th>To Date</th>
													<th>Patient Name</th>
													<th>Care Giver Name</th>
													<th>Rate per Hour ($)</th>
													<th>Additional Wages Rate ($)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>1</th>
													<td>01-Nov-2022</td>
													<td>31-Mar-2023</td>
													<td>Hammond Eddie</td>
													<td>Abdul Ahad Samandary</td>
													<td>17.00</td>
													<td>4.09</td>
												</tr>
												<tr>
													<th>2</th>
													<td>01-Sep-2022</td>
													<td>28-Feb-2023</td>
													<td>Zhao Lingtian</td>
													<td>Fahmida Akter</td>
													<td>15.00</td>
													<td>4.00</td>
												</tr>
												<tr>
													<th>3</th>
													<td>01-Jan-2022</td>
													<td>30-Jun-2023</td>
													<td>Perdomo Luz</td>
													<td>Afia Chowdhury</td>
													<td>17.00</td>
													<td>4.09</td>
												</tr>
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
	function saveCareGiverDetails(e) {
		e.preventDefault();
		openToastMessage('Patient Care Giver Mapping','Patient Care Giver Mapping Save Successfully...','success');
		$("#CareGiverFormId button[type='reset']").click();
		return false;
	}
</script>