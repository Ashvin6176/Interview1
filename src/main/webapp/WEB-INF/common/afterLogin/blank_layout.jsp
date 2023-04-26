<!-- START :: BAGHEL MITKUMAR -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>

<script type="text/javascript">

function exportList(tableId,headerName,seachingParam)
{
	 var seachingParam1="";
	 var seachingData="";
	
	if(seachingParam !=null && seachingParam != '' && seachingParam.includes("~"))
		{
	  seachingParam1=seachingParam.replaceAll("~","\r\n");
	  seachingData=seachingParam.split("~");
		}
	else
		{
		seachingParam1=seachingParam
		seachingData=seachingParam;
		}
	
	
		var currentTime = new Date();
	 	var month = currentTime.getMonth() + 1;
	 	var day = currentTime.getDate();
	 	var year = currentTime.getFullYear();
	 	var date = day + "/" + month + "/" + year;
	 	/* alert(date); */
		/* $('#dataList').DataTable();  */
		
		
var extraData = [
"hii",
"good"
];
		$('#'+tableId).DataTable({
			dom: 'Bfrtip',
	        buttons: [
	        	{
	        		   extend: 'excelHtml5',
	        		   //text:      '<img src="<c:url value="/resources/images/PrintExcel.jpg"/>"/> <b>EXPORT AS EXCEL</b>',
	        		   text: '<i class="fa fa-file-excel"></i>',
	                   titleAttr: 'Excel',
	        		   className: 'ecxelPdfIcon printPrivilege',
	        		   filename: headerName,
	        		   title: 'PANCHATANTRA' + '\r\n' + ' '+headerName+ '\r\n' +'Report Date :'+date+'\r\n'+seachingParam1,
	        		   customize: function(xlsx) {
	        			      var sheet = xlsx.xl.worksheets['sheet1.xml'];
	        			      var style = xlsx.xl['styles.xml'];
	        			      // set wrapText to true for horizontal alignment center style (assume the header is centered)
	        			      $('xf', style).find("alignment[vertical='center']").attr("wrapText", true);
	        			      // set height
//		        			      $('row', sheet).first().attr('ht', '120').attr('customHeight', "1");
//		        			      $('row:first c', sheet).attr('ht', '120').attr('customHeight', "1").attr( 's', '2' ).attr("wrapText", "1");
//		        			      $('row:first c', sheet).attr('ht', '120').attr('customHeight', "1").attr( 's', '55' )
	        			      $('row', sheet).first().attr('ht', '120').attr('customHeight', "1").attr("wrapText", "1").attr( 's', '2' )
	        			     /*  for(var i=0;i<seachingData.length;i++)
	        			    	  {
	        			    	  var extraData = [
	        			    		  seachingData[i]
	        			    		  ];
	        			    	  var j=i;
	        			    	  insertRowAfter( i, sheet );
		        		          populateRow( j+1,extraData, sheet );
		        		          extraData=[];
		        		          $( 'row c[r=A' + i + ']', sheet).attr( 'colspan', '2' );
	        			    	  } */
	        	
	        			    }
	        		  /*  exportOptions: {
//		        	            columns: 'th:not(:last-child)'
	        	         } */
	        		  /*  customize: function(doc) {
	        		     doc.styles.title = {
	        		       color: 'black',
	        		       fontSize: '40',
	        		       background: 'white',
	        		       alignment: 'center'
	        		     }   
	        		   }  */ 
	        	},
	        	{
	      		  extend: 'pdfHtml5',
		      	//  text:      '<img src="<c:url value="/resources/images/pdf.png"/>"/> <b>EXPORT AS PDF</b>',
		      	  text:      '<i class="fa fa-file-pdf"></i>',
		          titleAttr: 'PDF',
		          filename: headerName,
		          title: 'sds' + '\r\n' + ' '+headerName+ '\r\n' +'Report Date :'+date+'\r\n'+seachingParam1,
	      		 className: 'ecxelPdfIcon printPrivilege',
	      		//  orientation: 'landscape',
	      		customize: function(doc) {
	      			doc.styles.title.fontSize= 12;
		      		doc.defaultStyle.fontSize = 8; //<-- set fontsize to 16 instead of 10 
		      		doc.styles.tableHeader.fontSize = 8 ;   
		      		}
	      		/* exportOptions: {
//			            columns: 'th:not(:last-child)'
		         } */
	      		  /* customize: function(doc) {
	      		    doc.styles.title = {
	      		      color: 'black',
	      		      fontSize: '40',
	      		       background: 'white',
	      		      alignment: 'center'
	      		    }
	      		  }  */ 
	        	}
	        ]});
	
}


</script>

<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo-light.png">
<!-- START :: CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-extend.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/master_style.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/colorpicker/black_theme.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fonts.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/_all-skins.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sweetalert.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-select.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/responsive.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/toaster/toastr.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/gijgo.min.css"/>"/>

    <!-- Datatable -->
<%-- 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/datatable/dataTables.bootstrap4.min.css"/>" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/datatable/data-tableresponsive.bootstrap4.min.css"/>" /> --%>


<!-- END :: CSS -->

<!-- START :: JS -->
<script src="<c:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<script src="<c:url value="/resources/js/demo.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.slimscroll.js"/>"></script>
<script src="<c:url value="/resources/js/template.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.steps.js"/>"></script>
<script src="<c:url value="/resources/js/steps.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/resources/js/select2.full.js"/>"></script>
<script src="<c:url value="/resources/js/advanced-form-element.js"/>"></script>
<script src="<c:url value="/resources/js/commonAjax/AllValidation.js"/>"></script>
<script src="<c:url value="/resources/js/commonAjax/commonAjaxCalling.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrapValidate/bootstrap-validate.js"/>"></script>
<script src="<c:url value="/resources/js/moment.min.js"/>"></script>
<script src="<c:url value="/resources/js/icheck.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap-datepicker.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap-datepicker.min.js"/>"></script>
<%-- <script src="<c:url value="/resources/js/datatable/data-table.js"/>"></script> --%>
<script src="<c:url value="/resources/js/datatable/datatables.min.js"/>"></script>
<script src="<c:url value="/resources/js/datatable/project-table.js"/>"></script>
<script src="<c:url value="/resources/js/bootbox/bootbox.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootbox/bootbox.min.js"/>"></script>
<script src="<c:url value="/resources/js/toastr/OpenToaster.js"/>"></script>
<script src="<c:url value="/resources/js/toastr/toastr.js"/>"></script>
<script src="<c:url value="/resources/js/gijgo.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.inputmask.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.inputmask.extensions.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.inputmask.date.extensions.js"/>"></script>
<script src="<c:url value="/resources/js/daterangepicker.js"/>"></script>
<script src="<c:url value="/resources/js/ictExportExcel.js"/>"></script>



<script src="<c:url value="/resources/js/datatable/jszip.min.js"/>"></script>
<script src="<c:url value="/resources/js/datatable/pdfmake.min.js"/>"></script>
<script src="<c:url value="/resources/js/datatable/vfs_fonts.js"/>"></script>
<script src="<c:url value="/resources/js/datatable/buttons.html5.min.js"/>"></script>



<!-- END :: JS -->

<title><tiles:insertAttribute name="title" /></title>

<style>
	
.ictEcxelIcon{
    height: 45px;
    width: 45px; 
    border-radius: 5px;
    border-block-end-style: none;
    color: #153d77 !important; 
    border:1px solid black !important;
    transform:scale(.8) !important;
    background-color: var(--button-color-blue);
    border-color: var(--button-color-blue);
    font-size: 28px;
    margin:0% !important;
    padding:0% !important;
    box-shadow: 1px 1px 1px 1px #adadad;
/*     button-hover-color-blue: #05a4de; */
/*     padding-top: 11px; */
}
.ictPdfIcon{
    height: 45px;
    width: 45px; 
    border-radius: 5px;
    border-block-end-style: none;
    color: #153d77 !important; 
    border:1px solid black !important;
    transform:scale(.8) !important;
    background-color: var(--button-color-blue);
    border-color: var(--button-color-blue);
    font-size: 28px;
    margin:0% !important;
    padding:0% !important;
    box-shadow: 1px 1px 1px 1px #adadad;
/*     button-hover-color-blue: #05a4de; */
/*     padding-top: 11px; */
}

 .ecxelPdfIcon:hover{
    color:#153d77;
    background-color:var(--button-color-blue);
    border-color:var(--button-color-blue);
    overflow: hidden;
 	position: relative; 
 	transition: all 200ms linear; 
	box-shadow: 1px 2px 2px 2px #adadad;
	text-shadow:2px 8px 3px rgba(0,0,0,0.24);
} 

</style>

</head>
<body class="hold-transition sidebar-mini">

	<div class="bg-main">
	 
    </div>
    <!-- Header part-->    
	   <tiles:insertAttribute name="header" />
	<!-- Menu part -->
	   <tiles:insertAttribute name="menu" />
	<!--body part -->
<div class="main-body">
	   <tiles:insertAttribute name="body" />
	   </div>
	<!--Footer part -->
	   <tiles:insertAttribute name="footer" />
	   
	   <aside class="control-sidebar control-sidebar-light">
<!-- 				<ul class="nav nav-tabs nav-justified control-sidebar-tabs"> -->
<!-- 					<li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li> -->
<!-- 					<li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-cog fa-spin"></i></a></li> -->
<!-- 				</ul> -->

				<div class="tab-content">
					<div class="tab-pane" id="control-sidebar-home-tab">
						<h3 class="control-sidebar-heading">Recent Activity</h3>
						<ul class="control-sidebar-menu">
							<li><a href="javascript:void(0)"> <i
									class="menu-icon fa fa-birthday-cake bg-danger"></i>
									<div class="menu-info">
										<h4 class="control-sidebar-subheading">Admin Birthday</h4>

										<p>Will be July 24th</p>
									</div>
							</a></li>
		<!-- 					<li><a href="javascript:void(0)"> <i
									class="menu-icon fa fa-user bg-warning"></i>

									<div class="menu-info">
										<h4 class="control-sidebar-subheading">Jhone Updated His
											Profile</h4>

										<p>New Email : jhone_doe@demo.com</p>
									</div>
							</a></li>
							<li><a href="javascript:void(0)"> <i
									class="menu-icon fa fa-envelope-o bg-info"></i>

									<div class="menu-info">
										<h4 class="control-sidebar-subheading">Disha Joined
											Mailing List</h4>

										<p>disha@demo.com</p>
									</div>
							</a></li>
							<li><a href="javascript:void(0)"> <i
									class="menu-icon fa fa-file-code-o bg-success"></i>

									<div class="menu-info">
										<h4 class="control-sidebar-subheading">Code Change</h4>

										<p>Execution time 15 Days</p>
									</div>
							</a></li> -->
						</ul>

						<h3 class="control-sidebar-heading">Tasks Progress</h3>
						<ul class="control-sidebar-menu">
							<li><a href="javascript:void(0)">
									<h4 class="control-sidebar-subheading">
										Web Design <span class="label label-danger pull-right">40%</span>
									</h4>

									<div class="progress progress-xxs">
										<div class="progress-bar progress-bar-danger"
											style="width: 40%"></div>
									</div>
							</a></li>
				<!-- 			<li><a href="javascript:void(0)">
									<h4 class="control-sidebar-subheading">
										Update Data <span class="label label-success pull-right">75%</span>
									</h4>

									<div class="progress progress-xxs">
										<div class="progress-bar progress-bar-success"
											style="width: 75%"></div>
									</div>
							</a></li>
							<li><a href="javascript:void(0)">
									<h4 class="control-sidebar-subheading">
										Order Process <span class="label label-warning pull-right">89%</span>
									</h4>

									<div class="progress progress-xxs">
										<div class="progress-bar progress-bar-warning"
											style="width: 89%"></div>
									</div>
							</a></li>
							<li><a href="javascript:void(0)">
									<h4 class="control-sidebar-subheading">
										Development <span class="label label-primary pull-right">72%</span>
									</h4>

									<div class="progress progress-xxs">
										<div class="progress-bar progress-bar-primary"
											style="width: 72%"></div>
									</div>
							</a></li> -->
						</ul>


					</div>

					<div class="tab-pane" id="control-sidebar-stats-tab">Stats
						Tab Content</div>

					<div class="tab-pane" id="control-sidebar-settings-tab">
						<form method="post">
							<h3 class="control-sidebar-heading">General Settings</h3>

							<div class="form-group">
								<input type="checkbox" id="report_panel" class="chk-col-grey">
								<label for="report_panel" class="control-sidebar-subheading ">Report
									panel usage</label>

								<p>general settings information</p>
							</div>


					<!-- 		<div class="form-group">
								<input type="checkbox" id="allow_mail" class="chk-col-grey">
								<label for="allow_mail" class="control-sidebar-subheading ">Mail
									redirect</label>

								<p>Other sets of options are available</p>
							</div>


							<div class="form-group">
								<input type="checkbox" id="expose_author" class="chk-col-grey">
								<label for="expose_author" class="control-sidebar-subheading ">Expose
									author name</label>

								<p>Allow the user to show his name in blog posts</p>
							</div>


							<h3 class="control-sidebar-heading">Chat Settings</h3>

							<div class="form-group">
								<input type="checkbox" id="show_me_online" class="chk-col-grey">
								<label for="show_me_online" class="control-sidebar-subheading ">Show
									me as online</label>
							</div>


							<div class="form-group">
								<input type="checkbox" id="off_notifications"
									class="chk-col-grey"> <label for="off_notifications"
									class="control-sidebar-subheading ">Turn off
									notifications</label>
							</div>


							<div class="form-group">
								<label class="control-sidebar-subheading"> <a
									href="javascript:void(0)" class="text-red margin-r-5"><i
										class="fa fa-trash-o"></i></a> Delete chat history
								</label>
							</div> -->

						</form>
					</div>

				</div>
			</aside>
			<div class="control-sidebar-bg"></div>
			
			<script type="text/javascript">
			$(document).ready(function(){
// 				$('.screen-loader').removeClass("d-flex");
				$("#loader").removeClass("d-block");
			});
			</script>
</body>
</html>