<style>
	table tbody tr:first-child {
		background-color: slategrey;
	}
	
	table tbody tr:first-child td{
		color: white !important;
	}
	
	.invalid-data {
		background-color: red !important;
		color: white !important;
	}
</style>

<div class="pagetitle">
	<h1>Reconcile Data</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../main/dashboard">Home</a></li>
			<li class="breadcrumb-item active">Reconcile Data</li>
		</ol>
	</nav>
</div>

<section class="section">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Details</h5>
			<div class="alertDiv"></div>
			<form class="row g-3 needs-validation" id="CareGiverFormId"
				novalidate>
				<div class="col-md-4">
					<select class="form-select" aria-label="Default select example" required>
						<option value="" selected>SELECT</option>
						<option value="1">Week-1 (02-Jan-2023 to 08-Jan-2023)</option>
						<option value="2">Week-2 (09-Jan-2023 to 15-Jan-2023)</option>
						<option value="3">Week-3 (16-Jan-2023 to 22-Jan-2023)</option>
						<option value="4">Week-4 (23-Jan-2023 to 29-Jan-2023)</option>
					</select>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary"
						onclick="saveCareGiverDetails(event);">Submit</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
				</div>
			</form>
		</div>
	</div>
</section>

<section class="section" id="tableDataId" style="display: none;">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Reconcile Data List</h5>
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
						<th>Calculation of pay as per Weekly payroll Data</th>
						<th>Calculation of Additional Wages  as per Weekly payroll Data</th>
						<th>Difference</th>
						<th>Hours As per Billing Data</th>
						<th>Difference</th>
						<th>Hours as per Billing Report</th>
						<th>Difference</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>A</td>
						<td>B</td>
						<td>C</td>
						<td>D</td>
						<td>E</td>
						<td>F</td>
						<td>G</td>
						<td>H</td>
						<td>I</td>
						<td>J</td>
						<td>K</td>
						<td>L</td>
						<td>M</td>
						<td>N (G+I-L-M)</td>
						<td>O</td>
						<td>P (O-E)</td>
						<td>Q</td>
						<td>R (O-Q)</td>
					</tr>
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
						<td>595</td>
						<td>143.15</td>
						<td>0</td>
						<td>35</td>
						<td>0</td>
						<td>35</td>
						<td>0</td>
					</tr>
					<tr>
						<th>2</th>
						<td>2520</td>
						<td>Keying Jiang</td>
						<td>Guojin Shi</td> 
						<td>0</td>
						<td>$17.00</td>
						<td>$0.00</td>
						<td>$4.09</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
					</tr>
					<tr>
						<th>3</th>
						<td>2466</td>
						<td>Jin Xian Zheng</td>
						<td>Jin Xiu Lin</td> 
						<td>25</td>
						<td>$17.00</td>
						<td>$425.00</td>
						<td>$4.09</td>
						<td>$102.25</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>425</td>
						<td>102.25</td>
						<td>0</td>
						<td>25</td>
						<td>0</td>
						<td>12</td>
						<td>13</td>
					</tr>
					<tr>
						<th>4</th>
						<td>2477</td>
						<td>Shiroon Mohamed</td>
						<td>Phulmatie Ragnauth</td> 
						<td>39</td>
						<td>$17.00</td>
						<td>$663.00</td>
						<td>$4.09</td>
						<td>$159.51</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>663</td>
						<td>159.51</td>
						<td>0</td>
						<td>39</td>
						<td>0</td>
						<td>39</td>
						<td>0</td>
					</tr>
					<tr>
						<th>5</th>
						<td>2532</td>
						<td>Mamta Rani</td>
						<td>Sonia Sharma</td> 
						<td>12</td>
						<td>$17.00</td>
						<td>$204.00</td>
						<td>$4.09</td>
						<td>$49.08</td>
						<td>$0.00</td>
						<td>$0.00</td>
						<td>204</td>
						<td>49.08</td>
						<td>0</td>
						<td>15</td>
						<td>3</td>
						<td>15</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>

<script>
	$(document).ready(function(){
		
		$('table').parent().addClass('table-responsive');
		
		$('tr[data-index=3],[data-index=5]').addClass('invalid-data');
		
	});

	function saveCareGiverDetails(e) {
		e.preventDefault();
		let flag = true;

		$('form#CareGiverFormId').find('select').each(function() {
			if ($(this).prop('required')) {
				if ($(this).val() == '') {
					$('form').addClass('was-validated');
					flag = false;
				}
			}
		});

		if (flag) {
			openToastMessage('Reconcile Data','Data Reconcile Successfully...','success');					
			// 			$("#CareGiverFormId button[type='reset']").click();
			$("#tableDataId").show();
			// 			resetValidation();
		}

		return false;
	}

	function resetValidation() {
		$('form').removeClass('was-validated');
	}
</script>