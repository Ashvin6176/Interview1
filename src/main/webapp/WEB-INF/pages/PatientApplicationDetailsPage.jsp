<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Patient Application Details</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><iclass="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active">Patient Application Details</li>
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
								<h3 class="box-title">Patient Application Details</h3>
							</div>
							<!-- /.box-header -->
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div id="validateDivId">
											<div class="row">
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
											</div>
											<div class="row">
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Diagnosis For</label> 
														<input type="text" class="form-control" placeholder="Diagnosis For">
													</div>
												</div>
												<div class="col-12 col-md-4">
													<div class="form-group">
														<label for="billPeriodId">Rate Per Hour ($)</label> 
														<input type="number" class="form-control" placeholder="Rate Per Hour ($)">
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
								<h3 class="box-title">Patient Application Details List</h3>
							</div>
							<div class="box-body">
								<div id="contentDiv">
									<div id="validateDivId">
										<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md">
											<thead>
												<tr>
													<th>Sr No</th>
													<th>Patient Name</th>
													<th>From Date</th>
													<th>To Date</th>
													<th>Diagnosis For</th>
													<th>Rate per Hour ($)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>1</th>
													<td>Hammond Eddie</td>
													<td>01-Nov-2022</td>
													<td>31-Mar-2023</td>
													<td>R68.89</td>
													<td>21.00</td>
												</tr>
												<tr>
													<th>2</th>
													<td>Zhao Lingtian</td>
													<td>01-Sep-2022</td>
													<td>28-Feb-2023</td>
													<td>M15.0</td>
													<td>23.00</td>
												</tr>
												<tr>
													<th>3</th>
													<td>Perdomo Luz</td>
													<td>01-Jan-2022</td>
													<td>30-Jun-2023</td>
													<td>I10, I13.0,I50.9</td>
													<td>20.00</td>
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
		openToastMessage('Patient Application Details','Patient Application Details Save Successfully...','success');
		$("#CareGiverFormId button[type='reset']").click();
		return false;
	}
</script>