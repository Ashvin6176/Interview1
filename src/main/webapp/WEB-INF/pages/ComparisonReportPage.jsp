<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Comparison Report</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><iclass="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active">Comparison Report</li>
			</ol>
		</section>
		
		<section class="content">
			<div class="main-innerbody">
				<div class="row">
					<div class="col-12">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Search Comparison Report</h3>
							</div>
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label for="billPeriodId">Report</label> 
													<select class="form-control ValidateInput select2 select2-hidden-accessible disableClass"
														style="width: 100%;" tabindex="-1" name="reportId"
														aria-hidden="true" id="reportId" onchange="">
														<option value="" selected>SELECT</option>
														<option value="1">Billing Data Generated but Bill Not Received</option>
														<option value="2">Bill Received but Not Send to Insurance Company</option>
														<option value="3">Bill Send to Insurance Company but Payment not Received</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 text-center">
												<div class="form-group">
													<input type="button" class="btn btn-success" value="Search" id="SearchId" onclick="searchDetails();">
												</div>
											</div>
										</div>
										<div id="validateDivId" style="display: none;">
											<table class="table table-bordered table-striped table-reponsive-sm table-responsive-md datatable datatable-responsive">
												<thead>
													<tr>
														<th>Sr No</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
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
	function searchDetails() {
		let flag = true;
		$("#validateDivId table thead").empty();
		$("#validateDivId table tbody").empty();
		
		if(flag){
			let reportId = $('#reportId').val();
			
			if(reportId == '1') {
				// Header
				let headRow = $('<tr/>');
				headRow.append($('<th/>').append('Sr No'));
				headRow.append($('<th/>').append('Last Name'));
				headRow.append($('<th/>').append('First Name'));
				headRow.append($('<th/>').append('DOB'));
				headRow.append($('<th/>').append('MLTC'));
				headRow.append($('<th/>').append('Diag.'));
				headRow.append($('<th/>').append('AUTH.'));
				headRow.append($('<th/>').append('Total Hours'));
				headRow.append($('<th/>').append('Total Units'));
				headRow.append($('<th/>').append('Rate Per Hour ($)'));
				headRow.append($('<th/>').append('Total Bill Amount ($)'));
				$("#validateDivId table thead").append(headRow);
				
				// Body
				let bodyRow = $('<tr/>');
				bodyRow.append($('<td/>').append('1'));
				bodyRow.append($('<td/>').append('Begum'));
				bodyRow.append($('<td/>').append('Musammat M'));
				bodyRow.append($('<td/>').append('7/7/1950'));
				bodyRow.append($('<td/>').append('CPHL'));
				bodyRow.append($('<td/>').append('R68.89'));
				bodyRow.append($('<td/>').append('3415695'));
				bodyRow.append($('<td/>').append('4'));
				bodyRow.append($('<td/>').append('16'));
				bodyRow.append($('<td/>').append('15'));
				bodyRow.append($('<td/>').append('60.00'));
				$("#validateDivId table tbody").append(bodyRow);
			}
			else if(reportId == '2') {
				// Header
				let headRow = $('<tr/>');
				headRow.append($('<th/>').append('Sr No'));
				headRow.append($('<th/>').append('Last Name'));
				headRow.append($('<th/>').append('First Name'));
				headRow.append($('<th/>').append('DOB'));
				headRow.append($('<th/>').append('MLTC'));
				headRow.append($('<th/>').append('Diag.'));
				headRow.append($('<th/>').append('AUTH.'));
				headRow.append($('<th/>').append('Total Hours'));
				headRow.append($('<th/>').append('Total Units'));
				headRow.append($('<th/>').append('Rate Per Hour ($)'));
				headRow.append($('<th/>').append('Total Bill Amount ($)'));
				headRow.append($('<th/>').append('Bill No'));
				headRow.append($('<th/>').append('Bill Received Date'));
				$("#validateDivId table thead").append(headRow);
				
				// Body
				let bodyRow = $('<tr/>');
				bodyRow.append($('<td/>').append('1'));
				bodyRow.append($('<td/>').append('Begum'));
				bodyRow.append($('<td/>').append('Musammat M'));
				bodyRow.append($('<td/>').append('7/7/1950'));
				bodyRow.append($('<td/>').append('CPHL'));
				bodyRow.append($('<td/>').append('R68.89'));
				bodyRow.append($('<td/>').append('3415695'));
				bodyRow.append($('<td/>').append('4'));
				bodyRow.append($('<td/>').append('16'));
				bodyRow.append($('<td/>').append('15'));
				bodyRow.append($('<td/>').append('60.00'));
				bodyRow.append($('<td/>').append('BILL222300568'));
				bodyRow.append($('<td/>').append('15-Jan-2023'));
				$("#validateDivId table tbody").append(bodyRow);
			}
			else if(reportId == '3') {
				// Header
				let headRow = $('<tr/>');
				headRow.append($('<th/>').append('Sr No'));
				headRow.append($('<th/>').append('Last Name'));
				headRow.append($('<th/>').append('First Name'));
				headRow.append($('<th/>').append('DOB'));
				headRow.append($('<th/>').append('MLTC'));
				headRow.append($('<th/>').append('Diag.'));
				headRow.append($('<th/>').append('AUTH.'));
				headRow.append($('<th/>').append('Total Hours'));
				headRow.append($('<th/>').append('Total Units'));
				headRow.append($('<th/>').append('Rate Per Hour ($)'));
				headRow.append($('<th/>').append('Total Bill Amount ($)'));
				headRow.append($('<th/>').append('Bill No'));
				headRow.append($('<th/>').append('Bill Received Date'));
				headRow.append($('<th/>').append('Bill Send to Insurance Company Date'));
				$("#validateDivId table thead").append(headRow);
				
				// Body
				let bodyRow = $('<tr/>');
				bodyRow.append($('<td/>').append('1'));
				bodyRow.append($('<td/>').append('Begum'));
				bodyRow.append($('<td/>').append('Musammat M'));
				bodyRow.append($('<td/>').append('7/7/1950'));
				bodyRow.append($('<td/>').append('CPHL'));
				bodyRow.append($('<td/>').append('R68.89'));
				bodyRow.append($('<td/>').append('3415695'));
				bodyRow.append($('<td/>').append('4'));
				bodyRow.append($('<td/>').append('16'));
				bodyRow.append($('<td/>').append('15'));
				bodyRow.append($('<td/>').append('60.00'));
				bodyRow.append($('<td/>').append('BILL222300568'));
				bodyRow.append($('<td/>').append('15-Jan-2023'));
				bodyRow.append($('<td/>').append('21-Jan-2023'));
				$("#validateDivId table tbody").append(bodyRow);
			}
			$("#validateDivId").show();
		}
		else{
			$("#validateDivId").hide();
		}
	}
	
	function resetSearchForm() {
		$('#searchFormId').trigger("reset");
		searchDetails();
		resetValidation('searchFormId');
	}
</script>