<%@page import="com.mahadev.constant.Constants"%>
<%-- <%@page import="com.ict.mahadev.constant.UrlOperationalConstant"%> --%>
<%@page import="com.utils.CommonUtility"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}
.p-normal{
padding: 5px 15px !important;
}
</style>
<form:form name="CreateUserForm" method="post" id="CreateUserFormId" >
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
            
				<b><h3>My Office</h3></b>						
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
						              	
											Owner Name:
											<select class="form-control ValidateInput" name="user_id" id="user_id" onchange="">
												<option value="">--Select--</option>
											</select>
									 </div>
								</div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                         
                                           Operation:
                                           <select class="form-control ValidateInput" name="operation" id="operation" onchange="">
                                               <option value="">--Select--</option>
                                               <option value="W">Withdrawal</option>
                                               <option value="E">Expence</option>
                                               <option value="C">Capital</option>
                                           </select>
                                    </div>
                               </div>
							</div>	
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										   Amount:<input type="text" class="form-control  ValidateInput" id="amount" name="amount" onchange="validateRegex(this);"  onkeyup="validateRegex(this);"/> 
									</div>
							   </div> 
								<div class="col-md-4">
									<div class="form-group">
										   Payment Date:<input type="text" class="form-control  ValidateInput date_class" id="payment_date" name="payment_date" onchange="validateRegex(this);"  onkeyup="validateRegex(this);"/> 
									</div>
								</div>
                                
							</div>	
							<div class="row">
                                <div class="col-md-8">
									<div class="form-group">
										   Description:<textarea  class="form-control  ValidateInput " id="description" name="description" onchange="validateRegex(this);"  onkeyup="validateRegex(this);"></textarea> 
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
														<th>Owner Name</th>
				            							<th>Operation</th>
				            							<th>Amount</th>
				            							<th>Payment Date</th>
				            							<th>Description</th>
				            							
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
$('document').ready(function() {
	let webData={};
	fillDropdownCommon("user_id","getAllOwner",JSON.stringify(webData));
	$('#user_id').select2({
	  closeOnSelect: true
	});
    $('#operation').select2({
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


function getMstCreateUserData(){
	$('#dataTableId').DataTable().destroy();
	$("#dataTableId > tbody").empty();
	 var mstTableData = {};
	 var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getMyOfficeTra&serviceType=MASTER';
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
			
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].owner_name));
            let op="";
            if (mstTableDataCnt[index].operation == 'C') {
                op="Capital";
            }else if (mstTableDataCnt[index].operation == 'E') {
                op="Expence";
            }else{
               op="Withdrawal" 
            }	
			bodyRow.append( $("<td/>").addClass("text-center").append(op));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].amount));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].payment_date));
			bodyRow.append( $("<td/>").addClass("text-center").append(mstTableDataCnt[index].description));
			
				var button1=$("<button/>").addClass("btn btn-danger btn-sm label label-activate m-1 activatePrivilege activateButtonClassDesign").attr("type","button").attr("onclick","deleteTransaction('"+mstTableDataCnt[index].office_id+"')");
				button1.append("Delete");			
			
			bodyRow.append($("<td/>").addClass("removeExcelColumn").append("&nbsp;").append(button1));
			
			$("#dataTableId > tbody").append(bodyRow)
		});
		// $('#dataTableId').DataTable();
	}
//  	setTableButtonClassDesign();
 	$("#dataTableId").DataTable();
//  	SetTableMobileResponsive('dataTableId');
}

function saveMstCreateUser()
{ 	
	var flag=true;
 	flag=formValidate("validateDivId");
 	if(flag)
 		{
 		    bootbox.confirm({
 		    title:'<%=Constants.PROJECT_TITLE%>',
 							message : "Are you sure want to submit data?",
 							buttons : confirmCancelButton,
 							callback : function(result) {
 								if (result) {
 										var serviceURL = '${pageContext.request.contextPath}/mainAjax/saveOfficeTransaction/'+user_id;
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

function resetData()
{
	$("#saveBtn").removeClass("hide");
	$("#updateBtn").addClass("hide");
	$("#user_id").val('');
}
</script>

//<script src="https://kit.fontawesome.com/a076d05399.js"></script>