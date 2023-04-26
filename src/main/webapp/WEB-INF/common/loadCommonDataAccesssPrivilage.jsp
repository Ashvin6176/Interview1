<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="FormLabelClass">State </label> <select
			class="form-control select2 select2-hidden-accessible selectDefaultDataAccessPrivilege selectStateDataAccessPrivilege"
			id="stateDataAccessId" name="stateDataAccessId" style="width: 100%;"
			tabindex="-1" aria-hidden="true">
					<option value="">Select</option>
					<option value="1">KARNATAKA</option>
				</select>
			</div>
	</div>
	
	<div class="col-md-6">
		<div class="form-group">
			<label class="FormLabelClass"><fmt:message
					bundle="${hrmsLabels}" key="ZILLA_PANCHAYAT" /> </label> <select
				class="form-control select2 select2-hidden-accessible selectDefaultDataAccessPrivilege selectZpDataAccessPrivilege"
				id="zpDataAccessId" name="zpDataAccessId"
				style="width: 100%;" tabindex="-1" aria-hidden="true"
				onchange="getTaluka(this.value)">
				<option value="">Select</option>
				
			</select>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="FormLabelClass"><fmt:message
					bundle="${hrmsLabels}" key="TALUKA_PANCHAYAT" /></label> <select
				class="form-control select2 select2-hidden-accessible selectDefaultDataAccessPrivilege selectTpDataAccessPrivilege"
				id="tpDataAccessId" name="tpDataAccessId"
				style="width: 100%;" tabindex="-1" aria-hidden="true"
				 onchange="getGP(this.value)">
				<option value="">Select</option>
			</select>
	
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label  class="FormLabelClass"><fmt:message	bundle="${hrmsLabels}" key="GRAM_PANCHAYAT" /> </label> <select
				class="form-control select2 select2-hidden-accessible selectDefaultDataAccessPrivilege selectGpDataAccessPrivilege"
				id="gpDataAccessId" name="gpDataAccessId"
				style="width: 100%;" tabindex="-1" aria-hidden="true">
				<option value="">Select</option>
				
			</select>
		</div>
	</div>
</div>

<%-- <div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="FormLabelClass"><fmt:message
					bundle="${umLabels}" key="VILLAGE" /> </label> <select
				class="form-control select2 select2-hidden-accessible selectDefaultDataAccessPrivilege selectVlgDataAccessPrivilege"
				id="vlgDataAccessId" name="vlgDataAccessId"
				style="width: 100%;" tabindex="-1" aria-hidden="true">
				<option value="">Select</option>
				
			</select>
		</div>
	</div>
</div> --%>


<script>

$(document).ready(function($) {
	var post_city = localStorage.getItem("post_city");
	var access_level = localStorage.getItem("access_level");
	var data = {"STATE_CODE" : "15"};
	/* if($('#zpDataAccessId').val() == null || $('#zpDataAccessId').val() == '')
		{
			fillDropdownCommonWithAll("zpDataAccessId","getDistrictMasterDataByStateId",JSON.stringify(data));
		} */
    
});

function getTaluka(districtId)
{
	var data = {"DISTRICT_ID" : districtId};
	fillDropdownCommonWithAll("tpDataAccessId","getTalukaMasterDataByDistrictId",JSON.stringify(data));
	}
	
function getGP(tp_id)
{
	var data = {"TP_ID" : tp_id};
	fillDropdownCommonWithAll("gpDataAccessId","getGpMasterDataByTpId",JSON.stringify(data));
}



</script>
