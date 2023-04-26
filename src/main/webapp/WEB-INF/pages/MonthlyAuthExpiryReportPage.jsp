<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper">
	<!-- Left side column. contains the logo and sidebar -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Monthly Authorization Expiry Report</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><iclass="fa fa-home"></i> Home</a></li>
				<li class="breadcrumb-item active">Monthly Authorization Expiry Report</li>
			</ol>
		</section>
		
		<section class="content">
			<div class="main-innerbody">
				<div class="row">
					<div class="col-12">
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Search Monthly Authorization Expiry Report</h3>
							</div>
							<form:form id="GpDemoInfoId" name="gpdemo">
								<div class="box-body">
									<div id="contentDiv">
										<div class="row">
											<div class="col-12 col-md-4">
												<div class="form-group">
													<label for="billPeriodId">From Date</label> 
													<input type="text" id="fromDateId" class="form-control date_class" placeholder="From Date">
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="form-group">
													<label for="billPeriodId">To Date</label> 
													<input type="text" id="toDateId" class="form-control date_class" placeholder="To Date">
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
			
			$('#fromDateId').val('01-Mar-2023');
			$('#toDateId').val('31-Mar-2023');
			
			// Header
			let headRow = $('<tr/>');
			headRow.append($('<th/>').append('Sr No'));
			headRow.append($('<th/>').append('Patient Name'));
			headRow.append($('<th/>').append('Email'));
			headRow.append($('<th/>').append('Contact No'));
			headRow.append($('<th/>').append('Address'));
			headRow.append($('<th/>').append('Patient Account Number'));
			headRow.append($('<th/>').append('Insurance Company'));
			headRow.append($('<th/>').append('Auth Number'));
			headRow.append($('<th/>').append('Auth From Date'));
			headRow.append($('<th/>').append('Auth To Date'));
			headRow.append($('<th/>').append('Expiring in Days'));
			$("#validateDivId table thead").append(headRow);
			
			// Body
			let bodyRow = $('<tr/>');
			bodyRow.append($('<td/>').append('1'));
			bodyRow.append($('<td/>').append('Hammond Eddie'));
			bodyRow.append($('<td/>').append('eddie@gmail.com'));
			bodyRow.append($('<td/>').append('5157956875'));
			bodyRow.append($('<td/>').append('USA'));
			bodyRow.append($('<td/>').append('CGP.CGPHAMME00'));
			bodyRow.append($('<td/>').append('CPHL'));
			bodyRow.append($('<td/>').append('3103640'));
			bodyRow.append($('<td/>').append('01-Nov-2022'));
			bodyRow.append($('<td/>').append('31-Mar-2023'));
			let todayDate = moment().format("YYYY-MM-DD");
			let days = (Date.parse("2023-03-31") - Date.parse(todayDate)) / (1000 * 60 * 60 * 24);
			bodyRow.append($('<td/>').append(days + ' Days'));
			$("#validateDivId table tbody").append(bodyRow);
			
			bodyRow = $('<tr/>');
			bodyRow.append($('<td/>').append('2'));
			bodyRow.append($('<td/>').append('Zhao Lingtian'));
			bodyRow.append($('<td/>').append('lingtian@gmail.com'));
			bodyRow.append($('<td/>').append('5477874355'));
			bodyRow.append($('<td/>').append('USA'));
			bodyRow.append($('<td/>').append('CGP.CGPZHAOL00'));
			bodyRow.append($('<td/>').append('INTEGRA'));
			bodyRow.append($('<td/>').append('1220738'));
			bodyRow.append($('<td/>').append('01-Jan-2022'));
			bodyRow.append($('<td/>').append('15-Mar-2023'));
			days = (Date.parse("2023-03-15") - Date.parse(todayDate)) / (1000 * 60 * 60 * 24);
			bodyRow.append($('<td/>').append(days + ' Days'));
			$("#validateDivId table tbody").append(bodyRow);
			
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