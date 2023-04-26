<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="<c:url value="/resources/js/toastr/OpenToaster.js"/>"></script>
<script src="<c:url value="/resources/js/toastr/toastr.js"/>"></script>
<style type="text/css">
.check2
{
	font-size: 133%;
	/* margin-left: 0%;
    margin-top: -7%; */
}
.scroll-img {
  overflow: auto;
}
.scroll-img {
  overflow-y: scroll;
  height: 400px;
  width: 100%;
}
.btnview
{
	width: 50%;
    margin-left: 55%;
    margin-top: 15%;
}
input.form-check-input.check1 {
    position: absolute;
    top: 0px;
}
.icon1{
	color: #dc3545;
    font-size: 178%;
    margin-bottom: 1%;
    margin-left: 2%;
}
.upload-file {
    color: #272121;
    background-color: #0978c3;
    padding: 2px 17px;
    border: none;
    border: 1px solid #cecece;
    background: transparent;
}
.upload-btn-wrapper input[type=file] {
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
}
.upload-file:hover{

} 
.selectedDocumentColor
{
background-color: #d7edf5 !important;
border-color: #84d6f7;
}
.card-bg{
  width: 100%;
  float: left;
  background: #fff;
  padding: 17px 24px 41px 25px;
box-shadow: 0px 0px 5px #e4e3e3;
}
progress {
/*   background-color: #f3f3f3; */
  border:0;
  height: 2px;
  border-radius: 2px;
}
progress[value]::-webkit-progress-value {
  /* background-image:
	   -webkit-linear-gradient(-45deg, 
	                           transparent 33%, rgba(0, 0, 0, .1) 33%, 
	                           rgba(0,0, 0, .1) 66%, transparent 66%),
	   -webkit-linear-gradient(top, 
	                           rgba(255, 255, 255, .25), 
	                           rgba(0, 0, 0, .25)),
	   -webkit-linear-gradient(left, #09c, #f44); */
 	   background-color:#4285f4; 
   	   border-radius: 2px; 
       background-size: 35px 20px, 100% 100%, 100% 100%;
} 
  progress[value]::-moz-progress-bar {
/*   background-image:
	   -webkit-linear-gradient(-45deg, 
	                           transparent 33%, rgba(0, 0, 0, .1) 33%, 
	                           rgba(0,0, 0, .1) 66%, transparent 66%),
	   -webkit-linear-gradient(top, 
	                           rgba(255, 255, 255, .25), 
	                           rgba(0, 0, 0, .25)),
	   -webkit-linear-gradient(left, #09c, #f44); */
	    background-color:#4285f4;
    border-radius: 2px; 
    background-size: 35px 20px, 100% 100%, 100% 100%;
} 
/* .fail[value]::-moz-progress-bar {
  background-color: red;
} */
 .fail[value]::-webkit-progress-value{
  background-color: red;
}
.fail[value]::-webkit-progress-bar{
  background-color: red;
}
.fail[value]{
  background-color: red;
}
  progress[value]::-webkit-progress-bar {
   background-color: #eee; 
/*       background-color:white;   */
  border-radius: 2px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25) inset;
} 
  progress[value]::-moz-progress-bar {
/*    background-color: #eee;  */
    background-color:#4285f4; 
  border-radius: 2px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25) inset;
}  
iframe#imageBoxId {
    height: 380px;
}
</style>
<style>
.newloader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}
/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<div class="form-group">
	<div id="validateIconMstDoc">
<form:form name="uploadDocumentTrn" id="uploadDocumentTrnId" modelAttribute="trnUploadDocumentBo" method="post" autocomplete="off" enctype="multipart/form-data">
	<input type="hidden" id="edit_delete_data_doc_id" name="docId">
	<input type="hidden" id="crudFlagDocId" name="crudFlag">
	<input type="hidden" id="fileBindId" name="fileBindId">
	<input type="hidden" id="fileDisplayId" name="fileDisplayId">
	<input type="hidden" id="docNameId" name="docNameType">
	<input type="hidden" id="docId" name="doc_id">
	<input type="hidden" id="programId" name="application_no" value="">
	<input type="hidden" id="studentTempNumberId" name="student_temp_number" value="">
	<input type="hidden" id="folderNameId" name="folderName" value="">
					<div class="form-group"> 
						<div class="row">
							<div class="col-lg-6 col-md-6  col-sm-6 col-xs-12">
								<label for="control-label pt-2">Select Document</label>
								<input type="file" name="doc_temp" id="doc_tempId" onchange="checkFileForMultipuleFormat(this)" class=" form-control ValidateInput filechoose"/>
							</div>
							<div class="col-lg-3 col-md-3  col-sm-3 col-xs-12" style="margin-top: 23px">
									<input type="button" value="Submit" class="btn btn-warning" type="button" onclick="saveFormDocData()" id="btn_submit_doc">
							</div>
						</div>
						<br>
					</div>
					<div id="docListId" style="display: block;">
					 			<div><h5 class="tile-title">UPLOADED DOCUMENT</h5></div>
									<div class="">
									
											<!-- <div class="w-100">
												<i id="dlticon" data-toggle="tooltip" data-placement="top" title="Select Files to Delete" class="fa fa-times icon1 float-left float-right" onclick="showCheckbox();"></i>
												&nbsp;						
												<i id="btn_delete_doc" data-toggle="tooltip" data-placement="top" title="Delete"  onclick="inActiveFromDataDoc();" class="fa fa-trash icon1" onclick="showCheckbox();" style="display:none;"></i>
											</div> -->
										 
										<div class="row">
											<div class="col-md-12">
											<div id="documentList" ></div>	
											</div>
										</div>
									</div>
						
					</div>
	</form:form>
	</div>
</div>
<div class="form-group">
	<div class="row">
		<div id="documentList" class="row"></div>	
	</div>
	<div class="mx-4 row" id="allDocShow">
	</div>
</div>
<script>
function saveFormDocData()
{
    var docId=$('#docId').val();
	var flag=true;
	flag=formValidate("validateIconMstDoc");
	if(flag)
	{
	    bootbox.confirm({
	    title:"Panchatantra",
		message: "Are you sure want to submit Document data?",
	    callback: function(result)
	    { 
	    	if(result)
	    	    {
					var serviceURL='${pageContext.request.contextPath}/csAjax/saveUploadDocument';
  					var form=$("#uploadDocumentTrnId");
  					var serviceData = new FormData(form[0]);
			        saveFormApplicationWithMultiPartAndCallBack(serviceURL,serviceData,'loader','uploadDocumentTrnId',callBackFormDocData);
			        		
				}
		}
	    })
	}
}
function callBackFormDocData(map) {
	var serviceStatus=map.get("serviceStatus");
    var res=map.get("serviceResponse");
    if(serviceStatus === 1)
	{
    	$("#loaders").css("display","none");
        $("#filePropId").text("");
        getListofDataDoc();
//         $("#uploadDocModalId").modal('hide');
	}
}
function getListofDataDoc()
{
	 $("#documentList").empty();
	 var mstTableData = {};
 	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getHCGWebService?serviceName=getDocumentList&&serviceType=REPORT';
	 var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(''),"loader_id");
	 var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
	 var mstTableDataCnt=mstTableDataMap.get("serviceResponse");
	 if(mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0)
	 {
		$('#dlticon').show();
		var mainDivRow=$("<div/>").addClass('documentList-card');
		var divRow=$("<div/>").addClass('row');
		$.each(mstTableDataCnt,function(index)
		{	
			if((index === 6) || ((index) % 6 === 0 && index !=5))
			{
				 divRow=null;
				 divRow= $("<div/>").addClass('row');
			}
			var divRowCol=$("<div/>").addClass('D_card').attr('ondblclick','getFileName("'+mstTableDataCnt[index].trn_doc_id+'","'+mstTableDataCnt[index].doc_name+'");');
			
			var cardDiv=$('<div/>').addClass('').attr('id','documentCard'+index);
			var cardDiv_div=$('<div/>').addClass('card-images').attr('style','position: relative');
			var cardImg=$('<img/>').addClass('upload-img').attr('id','cardImageId'+index).attr('src', 'data:image/png;base64,'+mstTableDataCnt[index].doc_thumbnail_image).attr('alt','No Image')
			cardDiv_div.append(cardImg);
			var hr=$("<hr/>")
			var br=$("")
			var cardBody=$('<div/>').addClass('card-content text-center')
			var cardBodyh5=$('<p/>').append(mstTableDataCnt[index].doc_name)
			var displaydate = null; 
			if(mstTableDataCnt[index].used_date != null)
			{
				displaydate = mstTableDataCnt[index].used_date;
			}
			else{
				displaydate = mstTableDataCnt[index].doc_upload_date;
			} 
			var currentTime = new Date(displaydate);
		 	var month = currentTime.getMonth() + 1;
		 	var day = currentTime.getDate();
		 	var year = currentTime.getFullYear();
		 	var docdate = day + "-" + month + "-" + year;
		 	
			var cardBody_small=$('<small/>').append(docdate);
			if(mstTableDataCnt[index].is_used == '0' || !mstTableDataCnt[index].is_used){
				var cardBody_isused='';//$('<span style="color:red;"/>').append('Document Is Not Used')
				var cardBody_checkbox=$('<input style="display:none;"/>').addClass('form-check-input form-check check1 unusedfiles').attr('type','checkbox').attr('name','deleteFileId').attr('value',mstTableDataCnt[index].trn_doc_id).attr('id','checkedValue'+mstTableDataCnt[index].trn_doc_id).attr('onchange','onCheckFileData();'); 
				cardBody.append(cardBodyh5).append(cardBody_checkbox);
			}
			cardBody.append(cardBodyh5).append(cardBody_small).append($('')).append(cardBody_isused);

			var cardBody_viewicon=$('<div/>').attr("class","text-center").append($('<input/>').addClass('label label-primary font-size10 mb-1').attr('type','button').attr('value','VIEW').attr('onclick','viewDocument("'+mstTableDataCnt[index].doc_name+'","'+mstTableDataCnt[index].folder_name+'");'));

			cardDiv.append(cardBody_viewicon).append(br).append(cardDiv_div).append(hr).append(cardBody)
			divRow.append(divRowCol.append().append(cardDiv))
			mainDivRow.append(divRow);
			$("#documentList").append(mainDivRow);  
			getThumbnailImageForDocument(mstTableDataCnt[index].doc_thumbnail_image,mstTableDataCnt[index].folder_name,index);
		});
	}
	else{
		$('#dlticon').hide();
	}
}

function getFileName(fileId,filedata){
	 var bindID=$("#fileBindId").val();
	 var displayTextID=$("#fileDisplayId").val();
	 $('#'+bindID).val(fileId);
	 $("#"+displayTextID).html(filedata);
}

function getThumbnailImageForDocument(documentName,ducumentFolderName,countRow){
	var flag=true;
	if(flag ){
		$("#loader"+countRow).css("display","block");
		    $.ajax({
				url:"${pageContext.request.contextPath}/csAjax/getByteDataOfFile?documentName="+documentName+"&ducumentFolderName="+ducumentFolderName,
				type:"POST",
				success:function(data){
					$("#loaderId"+countRow).css("display","none");
					if(data.status != null && data.status == "1000"){
						if(documentName.split('.').pop() != null && documentName.split('.').pop() != ""){
							$("#cardImageId"+countRow).attr('src', 'data:image/jpg;base64,'+data.thumbnailFileName);
						}
					}else{
						$("#loaderId"+countRow).css("display","none");
						 $.each(data.error_message,function(key,value){
							 openToastMessage("Error Message",value,"error");
						   });
					}
				},
				error:function(){
					$("#loaderId"+countRow).css("display","none");
				    openToastMessage("Panchatantra","Error in View  Image","error");
				}	
			}); 
		}	
	}
function viewDocument(documentName,ducumentFolderName){
	var flag=true;
	if(flag ){
		    $.ajax({
		    	url:"${pageContext.request.contextPath}/csAjax/getByteDataOfFile?documentName="+documentName+"&ducumentFolderName="+ducumentFolderName,
				type:"POST",
				success:function(data){
					if(data.status != null && data.status == "1000"){
						if(documentName.split('.').pop() != null && documentName.split('.').pop() != ""){
							if(documentName.split('.').pop() == "pdf"){
								$("#viewUploadedDocumentId").append(
									$("<iframe/>").attr("height","600px").attr("width","100%").attr("alt","UMS").attr('src', 'data:application/pdf;base64,'+data.thumbnailFileName)
								);
							}else{
								$("#viewUploadedDocumentId").append($('<div/>').attr("class","scroll-img").append(
									$("<img/>").attr("href","#").addClass("w-100").attr("alt","UMS").attr('src', 'data:image/jpg;base64,'+data.thumbnailFileName))
								);
							}
						}
						openViewUploadedDocumentModel();
					}else{
						 $.each(data.error_message,function(key,value){
							 openToastMessage("Efsmallrror Message",value,"error");
							
						   });
					}
				},
				error:function(){
				    openToastMessage("Panchatantra","Error in View  Image","error"); 
				}	
			}); 
		}	
}
function showCheckbox(){
	$('.unusedfiles').show();
}
function onCheckFileData()
{
	var liste2 = $(':checkbox:checked').map(function() {
	    return this.value;
	}).get();
	if(liste2.length>0)
	{$('#btn_delete_doc').show();}
	else
	{
	    $('#btn_delete_doc').hide();
		$('.unusedfiles').hide();
	}
}
function openViewUploadedDocumentModel(){
	$("#viewDocumentModelId").modal('show');
}
function closeViewUploadedDocumentModel(){
	
	$("#viewDocumentModelId").modal('hide');
	$("#viewUploadedDocumentId").empty();
}
</script>