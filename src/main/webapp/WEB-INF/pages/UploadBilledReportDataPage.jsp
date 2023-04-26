<div class="pagetitle">
	<h1>Upload Billed Report Data</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../main/dashboard">Home</a></li>
			<li class="breadcrumb-item active">Upload Billed Report Data</li>
		</ol>
	</nav>
</div>

<section class="section">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Upload Excel</h5>
			<div class="alertDiv">
				
			</div>
			<form class="row g-3 needs-validation" id="CareGiverFormId" novalidate>
				<div class="text-end">
                  <a class="primary" href="../resources/excels/BilledReportData.xlsx"><i class="ri-file-excel-2-line"></i>Download Demo Excel</a>
                </div>
                <div class="col-md-6">
                  	<input type="file" class="form-control" id="excelFileId" accept=".xlsx, .xls, .csv" required>
                  	<div class="invalid-feedback"> Please provide a valid excel.</div>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary" onclick="saveCareGiverDetails(event);">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
           	</form>
		</div>
	</div>
</section>

<section class="section" id="tableDataId" style="display: none;">
	<div class="card">
		<div class="card-body table-responsive">
			<h5 class="card-title">Billed Report Data List</h5>
			<table class="table table-bordered table-striped table-sm datatable dataTable-table">
			
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Patient Account Number</th>
						<th>Patient Name</th>
						<th>Date of Service</th>
						<th>Date of Batch</th>
						<th>Transaction Code (Charge, Payment or Adjustment)</th>
						<th>Units of Service</th>
						<th>Transaction Amount</th>
						<th>Provider of Service</th>
						<th>Location of Service</th>
						<th>Primary Insurance Code</th>
						<th>Primary Policy Number</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>1</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>10/31/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>2</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/1/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>3</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/2/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>4</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/3/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>5</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/4/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>6</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/5/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
					<tr>
						<th>7</th>
						<td>CGP.CGPAGUID00</td>
						<td>AGUIAR, DOLORES</td>
						<td>11/6/2022</td>
						<td>11/7/2022</td>
						<td>T1020U2</td>
						<td>1</td>
						<td>416</td>
						<td>CGP</td>
						<td>CGP</td>
						<td>CCM</td>
						<td>64163</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

<script>
	function saveCareGiverDetails(e) {
		e.preventDefault();
		let flag = true;
		
		$('form#CareGiverFormId').find('input').each(function(){
		    if($(this).prop('required')){
		    	if($(this).val() == ''){
		    		$('form').addClass('was-validated');
		    		flag = false;
		    	}
		    }
		});
		
		if(flag){
			openToastMessage('Upload Billed Report Data','Billed Report Data Save Successfully...','success');
			$("#CareGiverFormId button[type='reset']").click();
			$("#tableDataId").show();
			resetValidation();
		}
		
		return false;
	}
	
	function resetValidation() {
		$('form').removeClass('was-validated');
	}
</script>