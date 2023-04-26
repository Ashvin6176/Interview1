<div class="pagetitle">
	<h1>Upload Reconciliation Data</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../main/dashboard">Home</a></li>
			<li class="breadcrumb-item active">Upload Reconciliation Data</li>
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
                  <a class="primary" href="../resources/excels/ReconciliationData.xlsx"><i class="ri-file-excel-2-line"></i>Download Demo Excel</a>
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
			<h5 class="card-title">Reconciliation Data List</h5>
			<table class="table table-bordered table-striped table-sm datatable dataTable-table">
				<thead>
					<tr>
						<th>Sr No</th>
						<th>Employee Id</th>
						<th>Member (Patient)</th>
						<th>HHA (Care Giver)</th>
						<th>Pay Hours</th>
						<th>Rate per HR</th>
						<th>Weekly Pay Amount</th>
						<th>Additional Wages Rate</th>
						<th>Additional Wages</th>
						<th>Supplemental Wages Rate</th>
						<th>Supplemental Wages</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>1</th>
						<td>2395</td>
						<td>Eddie Hammond</td>
						<td>Abdul Ahad Samandary</td>
						<td>35</td>
						<td>$17.00</td>
						<td>$595.00</td>
						<td>$4.09</td>
						<td>$143.15</td>
						<td>$0.00</td>
						<td>$0.00</td>
					</tr>
					<tr>
						<th>2</th>
						<td>2520</td>
						<td>Keying Jiang</td>
						<td>Guojin Shi</td>
						<td>5</td>
						<td>$17.00</td>
						<td>$85.00</td>
						<td>$4.09</td>
						<td>$20.45</td>
						<td>$0.00</td>
						<td>$0.00</td>
					</tr>
					<tr>
						<th>3</th>
						<td>2528</td>
						<td>Musammat M. Begum</td>
						<td>Fahmida Akter</td>
						<td>4</td>
						<td>$17.00</td>
						<td>$68.00</td>
						<td>$4.09</td>
						<td>$16.36</td>
						<td>$0.00</td>
						<td>$0.00</td>
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
			openToastMessage('Upload Reconciliation Data','Reconciliation Data Save Successfully...','success');
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