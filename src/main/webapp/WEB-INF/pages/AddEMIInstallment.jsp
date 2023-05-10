<%@page import="com.mahadev.constant.Constants"%>
<%-- <%@page import="com.ict.mahadev.constant.UrlOperationalConstant"%> --%>
<%@page import="com.utils.CommonUtility"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
    fieldset{
	padding: 30px;
    border: 1px solid #380ab8 !important;
    background:#f6f8ff !important;
    border-radius: 25px;
    border-width: thin;
    margin-bottom: 20px;
}

legend {
		width:unset;
        padding: 20px 0;
        font-size: 20px;
        font-weight: bold;
      }
.field_set{
  border-color: #F00;
  border-style: solid;
}
.p-normal{
padding: 5px 15px !important;
}
</style>
<form:form name="CreateUserForm" method="post" id="CreateUserFormId" >
	<input type="hidden" name="emi_entry_id" id="emi_entry_id">
<div class="wrapper">
  <!-- Left side column. contains the logo and sidebar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="main-innerbody">
      <!-- tabs -->
      <div class="row">
        <div class="col-12">
          <div class="box box-default">
            <div class="box-header with-border text-center">
             <b><h3>Add EMI Installment</h3></b>
										
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav  justify-content-start" role="tablist">
					<li class="nav-item">
					<p align="left"><b style="color: red;" class="medetoryClassNote"></b></p>
					 </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content ">
					<div class="tab-pane active" id="builLicenseId" role="tabpanel">
					     <div class="pad">
					     	<div id="validateDivId">					         							
					         <div class="row">					         
					            <div class="col-md-4">
						             <div class="form-group">
						              	
											Select User:
											<select class="form-control ValidateInput select2" name="user_id" id="user_id" onchange="loadRunnigBook(this.value)">
												<option value="">--Select--</option>    
											</select>
									 </div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
                                        Select Book:
                                        <select class="form-control ValidateInput select2" name="book_id" id="book_id" onchange="getBookDetails(this.value);">
                                            <option value="">--Select--</option>
                                        </select>
									</div>
								</div>
								
							</div>	
							<div class="row">
								<div class="col-md-4"> 
									<div class="form-group">
										Payment Date:<input type="text" class="form-control  ValidateInput date_class" id="payment_date" name="payment_date" onchange=""  onkeyup="validateRegex(this)"/> 
									</div>
								</div>
								<div class="col-md-4"> 
									<div class="form-group">
									  Payment Amount  :<input type="text" class="form-control  ValidateInput" id="payment_amount" name="payment_amount" onchange="checkPaymentAmt();"  onkeyup="validateRegex(this)"/> 
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-12 text-center">
								  <div class="form-group">
									<button type="button" class="btn btn-save btn-sm savePrivilege saveButtonClassDesign" value="" onclick="saveMstCreateUser()" id="saveBtn">SAVE</button>
									 </div>
								</div>
						   </div>
                            <fieldset>
                                <legend>Book Details</legend>
                                <div class="row">
									<div class="col-md-4">
										<div class="form-group">
											   EMI Start Date:<input type="text" class="form-control  ValidateInput" id="emi_start_date" name="emi_start_date" onchange="validateRegex(this);"  onkeyup="validateRegex(this);" readonly/> 
										</div>
								   </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                               Capital Amount:<input type="text" class="form-control  ValidateInput" id="capital_amount" name="capital_amount" onchange="validateRegex(this);calInterestAmount();"  onkeyup="validateRegex(this);calInterestAmount();" readonly/> 
                                        </div>
                                   </div> 
                                    <div class="col-md-4">
                                        <div class="form-group">
                                               Interest Per (%):<input type="text" class="form-control  ValidateInput" id="interest_per" name="interest_per" onchange="validateRegex(this);calInterestAmount();"  onkeyup="validateRegex(this);calInterestAmount();" readonly/> 
                                        </div>
                                    </div>
                                    
                                    
                                        
                                </div>	
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                               Interest Amount:<input type="text" class="form-control  ValidateInput" id="interest_amount" name="interest_amount" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            Daily Instalment Amount:<input type="text" class="form-control  ValidateInput" id="installment_amt" name="installment_amount" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            No. Of Instalment:<input type="text" class="form-control  ValidateInput" id="no_of_installment" name="no_of_installment" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                    
                                </div>	
                                <div class="row">
                                   
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            No. Of Paid Instalment:<input type="text" class="form-control  ValidateInput" id="no_of_paid_installment" name="no_of_paid_installment" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            EMI Paid Amount:<input type="text" class="form-control  ValidateInput" id="paid_amount" name="paid_amount" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            EMI Remaining Amount:<input type="text" class="form-control  ValidateInput" id="remaining_amount" name="remaining_amount" onchange=""  onkeyup="validateRegex(this)" readonly/> 
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
																       
					         	<jsp:include page="../common/commonExportExcelPdf.jsp">
					         		<jsp:param value="dataTableId" name="table"/>
					         		<jsp:param value="Create User List" name="name"/>
					         		<jsp:param value="tableDiv" name="divId"/>
					         		<jsp:param value="" name="headerDivId"/>
					         	</jsp:include> 
					            <div class="row" id="tableDiv">
				            	 	<div class="col-md-12">
				            	 		<div class="form-group">
				            				<div class="table-responsive"> 
				            				<table class="table table-bordered table-striped exportExcelTableClass" id="dataTableId">
				            					<thead>
				            						<tr>
				            							<th>SR NO</th>
														<th>Client Name</th>
				            							<th>Book Name</th>
				            							<th>Payment Date</th>
				            							<th>Payment Amount</th>
				            							<th>No of Installment Paid</th>
				            							<th class="removeExcelColumn">Action</th>
				            						</tr>
				            					</thead>
				            					
				            					<tbody>
				            					</tbody>
				            					
				            				</table>
				            				</div>
				            			</div>
				            		</div>
            			       </div>
							 </div>
						</div>
						</div>
					</div>
						</div>
					</div>
			    </div>
			<br>
          </div>
       </div>
    </section>
   </div>
   </div> 
</form:form>

<script>
var table;
var user_id='${sessionScope.user_id}';
var remainingAmount=0;
var InstallmentAmount=0;
$('document').ready(function() {
	let webData={};
	fillDropdownCommon("user_id","getAllUser",JSON.stringify(webData));
	$('.select2').select2({
	  closeOnSelect: true
	});
	
	table = $('#dataTableId').DataTable();
	table.on('order.dt search.dt', function() {
		table.column(0, {
			search : 'applied',
			order : 'applied'
		}).nodes().each(function(cell, i) {
			cell.innerHTML = i + 1;
		});
	}).draw();
	getMstCreateUserData();
});
function loadRunnigBook(user_id) {
    let webData={"user_id":user_id};
    fillDropdownCommon("book_id","getRunningBook",JSON.stringify(webData));
}
function getMstCreateUserData(){
	$('#dataTableId').DataTable().destroy();
	$("#dataTableId > tbody").empty();
	 var mstTableData = {};
	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getAddInstallment&serviceType=MASTER';
	 var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(mstTableData),"loader");
	 var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
	 var mstTableDataCnt=mstTableDataMap.get("serviceResponse"); 
 	if(mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0)
 	{
		let rowCnt=0;
		let rowNum=0;
		let indexNo=0;
		$.each(mstTableDataCnt,function(index)
		{	
			var bodyRow=$("<tr/>");
			bodyRow.append( $("<td/>").addClass("text-center").append(index+1));	
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].user_name));	
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].book_name));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].payment_amount));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].payment_date));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].paid_installment));
			var button=$("<button/>").addClass("btn btn-danger btn-sm label label-edit m-1 defaultPrivilege editButtonClassDesign removeExcelColumn").attr("type", "button").attr("onclick","deleteInstallment('"+mstTableDataCnt[index].emi_entry_id+"')");
			var bi=$("<i/>").addClass("fas fa-pencil-alt mr-1");			
						
			button.append("Delete");			
			bodyRow.append($("<td/>").addClass("removeExcelColumn").append(button));
			
			$("#dataTableId > tbody").append(bodyRow)
		});
		$('#dataTableId').DataTable();
	}
//  	setTableButtonClassDesign();
//  	$("#dataTableId").DataTable();
//  	SetTableMobileResponsive('dataTableId');
}

function saveMstCreateUser()
{ 	
	var flag=true;
 	flag=formValidate("validateDivId");
	let pay_flag=checkPaymentAmt();
 	if(flag && pay_flag)
 		{
 		    bootbox.confirm({
 		    title:'<%=Constants.PROJECT_TITLE%>',
 							message : "Are you sure want to submit data?",
 							buttons : confirmCancelButton,
 							callback : function(result) {
 								if (result) {
 										var serviceURL = '${pageContext.request.contextPath}/mainAjax/saveAddInstallment/'+user_id;
 	 	 								var serviceData = $("#CreateUserFormId").serialize();
										//svar form=$("#CreateUserFormId");
						                //var serviceData = new FormData(form[0]);
										//console.log(serviceData);
 										var map = saveFormApplication(serviceURL,serviceData, 'loader', 'CreateUserFormId');
 										var serviceStatus = map.get("serviceStatus");
 										var res = map.get("serviceResponse");
 										if (serviceStatus === 1) {
 											getMstCreateUserData();
 											resetData();
 										}
 								}
 							}
 						})
 			}
}
function getBookDetails(book_id) {
     var mstTableData = {"book_id":book_id};
	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getBookDetailsByBookId&serviceType=MASTER';
	 var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(mstTableData),"loader");
	 var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
	 var mstTableDataCnt=mstTableDataMap.get("serviceResponse"); 
     if (mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0) {
        $("#emi_start_date").val(mstTableDataCnt[0].emi_start_date);
        $("#capital_amount").val(mstTableDataCnt[0].capital_amount);
        $("#interest_per").val(mstTableDataCnt[0].interest_per);
        $("#interest_amount").val(mstTableDataCnt[0].interest_amount);
        $("#installment_amt").val(mstTableDataCnt[0].installment_amount);
		InstallmentAmount=mstTableDataCnt[0].installment_amount;
        $("#no_of_installment").val(mstTableDataCnt[0].no_of_installment);
		$("#no_of_paid_installment").val(mstTableDataCnt[0].no_of_paid_inst);
		$("#paid_amount").val(mstTableDataCnt[0].payment_amount);
		$("#remaining_amount").val(Number(mstTableDataCnt[0].capital_amount)-Number(mstTableDataCnt[0].payment_amount));
     }
}
function deleteInstallment(emi_entry_id)
{
	$("#emi_entry_id").val(emi_entry_id);
	$("#user_id").val("0");
	crtUser='${sessionScope.user_id}';
	bootbox.confirm({
		title : '<%=Constants.PROJECT_TITLE%>',
		message: "Are you sure want to delete Installment ?",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
				 var serviceURL='${pageContext.request.contextPath}/mainAjax/deleteInstallment/'+crtUser;
			  	 var serviceData=$("#CreateUserFormId").serialize();
			  	 var map=saveFormApplication(serviceURL,serviceData,"loader","CreateUserFormId");
			  	 var serviceStatus=map.get("serviceStatus");
			  	 var res=map.get("serviceResponse");
				   $("#emi_entry_id").val("0");
			  	 if(serviceStatus == 1)
			   	 {
			  		getMstCreateUserData();
			  		
			   	 }			  
	    	}
	    }
	});
}
function resetData()
{
	$("#saveBtn").removeClass("hide");
	$("#updateBtn").addClass("hide");
	$("#user_id").val('');
}
function calInterestAmount() {
	let cp_amount=$("#capital_amount").val();
	if (cp_amount== '' || isNaN(cp_amount) ) {
		cp_amount=0;
	}
	
	let interest_per=$("#interest_per").val();
	if (interest_per== '' || isNaN(interest_per)) {
		interest_per=0;
	}
	
	let interest_amount=(Number(cp_amount*interest_per)/100).toFixed(2);
	$("#interest_amount").val(interest_amount);

	let emi_amt=Number(cp_amount/100).toFixed(2);
	$("#installment_amt").val(emi_amt);

	let no_of_installment=(Number(cp_amount)/Number(emi_amt)).toFixed(0);
	$("#no_of_installment").val(no_of_installment);
}
function checkPaymentAmt() {
	let flag=false;
	let instAmount=InstallmentAmount;
	let payment_amount=$("#payment_amount").val();
	if(payment_amount=='' || isNaN(payment_amount)){
		payment_amount=0;
	}

	if (Number(payment_amount)%Number(instAmount) == 0) {
		flag=true;
	}else{
		toastr.info("Invalid Payment Amount","INFO",{
			closeButton:true,
			autohide:false
		});
	}
   return flag;
}
</script>

//<script src="https://kit.fontawesome.com/a076d05399.js"></script>