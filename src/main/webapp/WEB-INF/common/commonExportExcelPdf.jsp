<style>
	
.ecxelPdfIcon{
    height: 50px;
    width: 45px;
    border-radius: 5px;
    border-block-end-style: none;
    color: #fff;
    background-color: #153d77;
    border-color: #153d77;
    font-size: 38px;
    box-shadow: 1px 1px 1px 1px #adadad;
    padding-bottom: 2px;
}
 .ecxelPdfIcon:hover{
    background-color: #153d77;
    border-color: #153d77;
    overflow: hidden;
 	position: relative; 
 	transition: all 200ms linear; 
	box-shadow: 1px 2px 2px 2px #adadad;
	text-shadow:2px 8px 3px rgba(0,0,0,0.24);
} 
/* .fa, .fas {
    font-weight: 800;
} */

</style>

<div>
	<div class="col-12 exportExcelPdfDiv" id="downloadId">
		<a href="#" class="btn ictEcxelIcon exportAsExcelPrivilege mb-2" download="${param.name}.xls"  style="padding: 8px !important;"
					onclick="return ExcellentExport.excel(this, '${param.table}', '${param.name}','${param.divId}','${param.hideColRow}');">
						<i class="fa fa-file-excel fa-1x" style="font-weight: 100"></i>
		</a>
		<a href="#" class="btn ictEcxelIcon exportAsExcelPrivilege mb-2" style="padding: 8px !important;"
					onclick="return pdfDownload('${param.divId}','${param.name}','${param.table}');">
						<i class="fas fa-file-pdf fa-1x" style="font-weight: 100"></i>
		</a>
	</div>	
<%-- 	 for tt code<button type="button" value="${param.name}.xls" class="btn ictEcxelIcon exportAsExcelPrivilege mb-2 " onclick="return ExcellentExport.excel(this, '${param.table}', '${param.name}','${param.divId}');"><i class="fa fa-file-excel fa-1x" style="font-weight: 100"></i></button> --%>

<%-- 	<button type="button" value="${param.name}.xls" class="btn ictEcxelIcon mb-2 exportAsExcelPrivilege" onclick="return ExcellentExport.excel(this, '${param.table}', '${param.name}','${param.divId}','${param.headerDivId}');"><i class="fa fa-file-excel fa-1x" style="font-weight: 100"></i></button> --%>
<%-- 	<button type="button" value="${param.name}.xls" class="btn ictEcxelIcon exportAsExcelPrivilege mb-2 " onclick="return pdfDownload('${param.divId}','${param.name}');"><i class="fas fa-file-pdf fa-1x" style="font-weight: 100"></i></button> --%>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.2.0/jspdf.umd.min.js"></script>
<script type="text/javascript">

function excelDownload() {
	
}

function pdfDownload(divId,filename,tableName){
	$('#'+tableName).DataTable().destroy();
	//$('#'+tableName).attr("border","1px");
	$('#downloadId').addClass("d-none");//pdf excel icon class remove 
	var backup = document.body.innerHTML;
	var print  = document.getElementById(divId).innerHTML;
	$('body').empty().append(print);
	window.print();
	window.close();
	$('body').empty().append(backup);
	$('#downloadId').removeClass("d-none");
	$('#'+tableName).DataTable();
}
</script>

<!-- <br> -->
