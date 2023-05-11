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

.tempCardClass:hover{
	background-color: white !important;
	transform: none !important;
}
	.userProfileDataCard:hover{
background-color: unset !important;
transform:scale(1) !important;
}
.mb-3{
margin-bottom: 1rem;
}
.mr-0{
margin-right: 0px !important;
}
ml-0{
margin-left: 0px !important;
}.buttons > button{
letter-spacing: 1.5px;
font-weight: 550;
box-shadow: none !important;
}
#center-chart > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(3),
#center-chart > div > svg > g > g:nth-child(2) > g:nth-child(2) > g > g:nth-child(4)
{
	display: none !important;
}
.modal.fade .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(.5);transform: translate(0,0)scale(.5);}
.modal.show .modal-dialog.modal-dialog-zoom {-webkit-transform: translate(0,0)scale(1);transform: translate(0,0)scale(1);}
.FontLblClass{
color: #153d77;
}

#div_dashboard_count .card {
		color: #000;
	    background: #fff;
	    position: relative;
	    border: 1px solid #f1f3f7;
	    border-radius: 19px;
	    margin: 1px;
	    box-shadow: 1px 1px 5px gray;
	}
	
	.card .card-block {
	    padding: 10px;
	}
		
	.card-title {
		text-align: center;
	}
	
	.card-content {
		text-align: center;
	}
	
	.card-content h3 {
		font-weight: bold;
	}
	
	.card-foot {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.card-foot div {
		color: #ff7468;
	}
	
	.fa-refresh {
		color: #ff7468;
	}
	
	i.refresh-icon {
		font-size: 15px;
		box-shadow: gray 0px 1px 3px;
		cursor: pointer;
	}
	
	i.fa.fa-refresh.text-right {
    	float: right;
	    position: relative;
	    text-align: right;
	    width: 0px;
	    position: absolute;
	    right: 26px;
	    bottom: 22px;
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
            
				<b><h3>Dashboard</h3></b>						
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<!-- Nav tabs -->
				<ul class="nav  justify-content-start" role="tablist">
					<li class="nav-item">
					<!-- <p align="left"><b style="color: red;" class="medetoryClassNote"></b></p> -->
					 </li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content ">
					<div class="tab-pane active" id="builLicenseId" role="tabpanel">
					     <div class="pad">
					     	<div id="validateDivId">
                  <div class="row m-0 p-0">
                    <div class="col-lg-12 ">
                      <div class="tab-content ">
                        <div class="tab-pane active" id="builLicenseId" role="tabpanel">
                            <div id="div_dashboard_count" class="row"></div>
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
const dashboardCountServList = [{index:0, title:'REGISTERED PATIENTS', servName:'getRegisteredPatientCount', servType:'COUNT', icon_path:'../resources/images/dashboard/meeting.png', hasRefresh:true},
			{index:1, title:'REGISTERED CARE GIVERS', servName:'getRegisteredCareGiverCount', servType:'COUNT', icon_path:'../resources/images/dashboard/user.png', hasRefresh:true}];
	
$('document').ready(function() {
  getDashBardData();
//   let cardRow = $('#div_dashboard_count');
// 		$.each(dashboardCountServList, (i, obj) => {
// 			let cardHeaderEle = getCardHeaderElement(obj.index, obj);
			
// 			let cardBodyEle = $('<div/>').addClass('card-content').attr({"id":"card_content_id"+obj.index})
// 									.append($('<h3/>').text(0));
			
// 			let cardFooterEle = getCardFooterElement(obj.index, obj);
			
// 			let cardEle = $('<div/>').addClass('col-md-4 col-xl-3').attr({"style":"margin-bottom: 20px;"})
// 							.append(
// 								$('<div/>').addClass('card')
// 									.append(
// 										$('<div/>').addClass('card-block')
// 											.append(getCardLoaderElement(obj.index)) 
// 											.append(cardHeaderEle)
// 											.append(cardBodyEle)
// 											.append(cardFooterEle)
// 									)
// 							);
			
// 			cardRow.append(cardEle);
// 		});
});
function getCardLoaderElement(cardIndex) {
		let iconEle = $('<i/>').addClass('fa fa-spinner fa-spin').attr({"style":"font-size: 30px; color: rgba(0, 0, 0, .7);"});
		let spanEle = $('<span/>').addClass('font-weight-bold').attr({"style":"letter-spacing: 1px"}).append(iconEle);
		let divEle = $('<div/>').addClass('overlay-body d-flex justify-content-center h-100 w-100 align-items-center').attr({"style":"margin: auto;"}).append(spanEle);
		let cardLoader = $('<div/>').addClass('card-overlay').attr({"id":"card-loader"+cardIndex})
							.attr({"style":"position: absolute; width: 100%; height: 100%; z-index: 2; background: rgba(255, 255, 255, .6); display: none;"})
							.append(divEle);
		return cardLoader;
	}
	
	function getCardHeaderElement(cardIndex, cardObj) {
		let img_path="../resources/images/dashboard/"+cardObj.card_img;
		return $('<div/>').addClass('row')
					
					.append(
							$('<div/>').addClass('col-9 card-title').attr({"id":"card_title_id"+cardIndex})
							.append($('<h5/>').text(cardObj.heading))
					).append(
							$('<div/>').addClass('col-3 card-icon')
								.append($('<img/>').attr({"src":img_path, "width":"60"}))
						);
	}
	
	function getCardFooterElement(cardIndex, cardObj) {
		return "";
	}
function getDashBardData() {
  var mstTableData = {};
  var mstTableDataUrl='${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getDashBoardCard&serviceType=MASTER';
  var mstTableDataMap=genericAjaxCallForJsonWithLoader(mstTableDataUrl,JSON.stringify(mstTableData),"loader");
  var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
  var mstTableDataCnt=mstTableDataMap.get("serviceResponse");
  console.log(mstTableDataCnt);
  var dashCnt=0;
  if (mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0) {
    let cardRow = $('#div_dashboard_count');
		$.each(mstTableDataCnt, (i, obj) => {
			let cardHeaderEle = getCardHeaderElement(obj.index, obj);
			
			let cardBodyEle = $('<div/>').addClass('card-content').attr({"id":"card_content_id"+obj.index})
									.append($('<h3/>').attr("id","dashCnt"+obj.dash_id).text(0));
			
			let cardFooterEle = getCardFooterElement(obj.index, obj);
			
			let cardEle = $('<div/>').addClass('col-md-4 col-xl-3').attr({"style":"margin-bottom: 20px;"})
							.append(
								$('<div/>').addClass('card')
									.append(
										$('<div/>').addClass('card-block')
											.append(getCardLoaderElement(obj.index)) 
											.append(cardHeaderEle)
											.append(cardBodyEle)
											.append(cardFooterEle)
									)
							);
			
			cardRow.append(cardEle);
			setDashCount(obj.dash_id,obj.dash_id);
		});
  }
function setDashCount(query_id,ind) {
	var webData = {'query_id' : query_id };
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getDashBoardQuery&serviceType=MASTER';
	var mstTableDataMap=genericAjaxCallForJsonWithLoader(webDataUrl,JSON.stringify(webData),"loader");
    var mstTableDataStatus=mstTableDataMap.get("serviceStatus");
    var mstTableDataCnt=mstTableDataMap.get("serviceResponse");
    
    if (mstTableDataStatus === 1 &&  mstTableDataCnt.length > 0) {
		$("#dashCnt"+ind).empty().text(mstTableDataCnt[0].count_data);
    }
}  
 // setDashboard();
}
function setValueToBox(webDataCnt){
	$('div#div_dashboard_count').empty();
	let i = 0;
	var fmtMap = new Map();
	fmtMap.set('male','<fmt:message bundle="${operationalLabels}" key="MALE"/>');
	fmtMap.set('female','<fmt:message bundle="${operationalLabels}" key="FEMALE"/>');
	fmtMap.set('transgender','<fmt:message bundle="${operationalLabels}" key="TRANSGENDER"/>');
	fmtMap.set('gp_staff','<fmt:message bundle="${operationalLabels}" key="GP_STAFF"/>');
	fmtMap.set('gp_govt_staff','<fmt:message bundle="${operationalLabels}" key="GP_GOVT_STAFF"/>');
	fmtMap.set('upcoming','<fmt:message bundle="${operationalLabels}" key="UPCOMING"/>');
	fmtMap.set('completed','<fmt:message bundle="${operationalLabels}" key="COMPLETED"/>');
	fmtMap.set('total_collected','<fmt:message bundle="${operationalLabels}" key="TOTAL_COLLECTED"/>');
	fmtMap.set('total_balance','<fmt:message bundle="${operationalLabels}" key="TOTAL_BALANCE"/>');
	fmtMap.set('total_applications','<fmt:message bundle="${operationalLabels}" key="TOTAL_APPLICATIONS"/>');
	fmtMap.set('delivered','<fmt:message bundle="${operationalLabels}" key="DELIVERED"/>');
	fmtMap.set('pending','<fmt:message bundle="${operationalLabels}" key="PENDING"/>');
	fmtMap.set('rejected','<fmt:message bundle="${operationalLabels}" key="REJECTED"/>');
	webDataCnt.get("serviceResponse").forEach(obj => {
		let col_div = $('<div/>').addClass('col-lg-6 col-md-6 px-1 mb-2');
		let crd_div = $('<div/>').addClass('card p-3 mb-0 min-height195 boxColor1 '+(obj.method_name != null && obj.method_name != '' ? 'cursor-pointer' : '')).attr("onclick",(obj.method_name != null && obj.method_name != '' ? obj.method_name+"(this)" : "")).css({"height":"150px","border-radius":"10px"});
		let crd_bdy_div = $('<div/>').addClass('card-body p-0 m-0').css({"height":"100%"});
		let crd_bdy_row = $('<div/>').addClass('w-100 card-1 row p-0 m-0');
		let crd_bdy_crd_text = $('<div/>').addClass('d-flex justify-content-between col-12 p-0 m-0');
		let crd_bdy_crd_text_right = $('<div/>').addClass('right-content text-right');
		let crd_bdy_crd_h5 = $('<h5/>').text("${sessionScope.lang}" == "kn" ? obj.label_name_kn : obj.label_name);
		let crd_bdy_crd_h3 = $('<h3/>').addClass('mb-1');
		let crd_bdy_crd_spin = $('<i/>').addClass('fa fa-spinner fa-spin');
		crd_bdy_crd_text_right.append(crd_bdy_crd_h5).append(crd_bdy_crd_h3.append(crd_bdy_crd_spin));
		
		let crd_bg_img = $('<img/>').attr('style','width:60px;height:70px').attr({"src":"../resources/images/dashboard/"+obj.icon_name,"alt":"icon"});
		crd_bdy_crd_text.append(crd_bg_img).append(crd_bdy_crd_text_right);
		crd_bdy_row.append(crd_bdy_crd_text);
		getDashboardCount(obj.dtl_id,function(count_dataObj){
			if(count_dataObj != null){
				if(count_dataObj.count_data != null && count_dataObj.count_data != '' && count_dataObj.count_data >= 0 ){
					crd_div.attr("onclick", "loadSubCount('"+obj.method_name+"')");
				} 
				crd_bdy_crd_h3.html(obj.dtl_id === '20' ? count_dataObj.count_data.toLocaleString('en-IN') : count_dataObj.count_data);
				if("sub_counts" in count_dataObj){
					let subCounts = JSON.parse(count_dataObj.sub_counts);
					if(Object.keys(subCounts).length > 0){
						let crd_bdy_rw_scl12 = $('<div/>').addClass('gender-count col-12 p-0 d-flex align-items-center').attr('style',(obj.dtl_id === '20' ? 'margin-top:5px !important' : 'margin-top:25px !important'));
						let sc = 0;
						$.each(subCounts, function (key, value) { 
							let crd_bdy_rw_cl12_sct = "";
							if(obj.dtl_id === '17'){
								let classes = '';
								if(sc === 0){
									classes = 'gender-count-content card-text font-weight-normal col-lg-4 col-md m-0 p-0 d-flex justify-content-end flex-wrap text-right';
								} else if(sc === 1){
									classes = 'gender-count-content card-text font-weight-normal col-lg-4 col-md-4 m-0 p-0 d-flex justify-content-end flex-wrap text-right';
								} else {
									classes = 'gender-count-content card-text font-weight-normal col-lg col-md-5 m-0 p-0 d-flex justify-content-end flex-wrap text-right';
								}
								crd_bdy_rw_cl12_sct = $('<p/>').addClass(classes).css({"font-size":"15px"}).html(fmtMap.get(key.toString().toLowerCase())+'&nbsp;:&nbsp;');
								sc++;
							} else {
								crd_bdy_rw_cl12_sct = $('<p/>').addClass('gender-count-content card-text font-weight-normal col-lg col-md m-0 p-0 d-flex justify-content-end flex-wrap').css({"font-size":"15px"}).html(fmtMap.get(key.toString().toLowerCase())+'&nbsp;:&nbsp;');
							}
							let crd_bdy_rw_cl12_sct_spn = $('<span/>').addClass('font-weight-bold').attr('id','male_count__ID').append(obj.dtl_id === '20' ? $('<i/>').addClass('fa fa-rupee mr-1').attr('aria-hidden','true') : '').append(' '+(value.toLocaleString('en-IN')));
							crd_bdy_rw_cl12_sct.append(crd_bdy_rw_cl12_sct_spn);
							crd_bdy_rw_scl12.append(crd_bdy_rw_cl12_sct);
						});
						crd_bdy_row.append(crd_bdy_rw_scl12);
					}
				}
			} 
		});
		
		crd_bdy_div.append(crd_bdy_row);
		crd_div.append(crd_bdy_div);
		col_div.append(crd_div);
		
		$('div#div_dashboard_count').append(col_div);
	});
}
function setDashboard(webDataCnt) {
  webDataCnt.forEach(obj => {
		let col_div = $('<div/>').addClass('col-lg-3 col-md-6 px-1 mb-2');
		let crd_div = $('<div/>').addClass('card p-3 mb-0 min-height195 boxColor1 '+(obj.method_name != null && obj.method_name != '' ? 'cursor-pointer' : '')).attr("onclick",(obj.method_name != null && obj.method_name != '' ? obj.method_name+"(this)" : "")).css({"height":"150px","border-radius":"10px"});
		let crd_bdy_div = $('<div/>').addClass('card-body p-0 m-0').css({"height":"100%"});
		let crd_bdy_row = $('<div/>').addClass('w-100 card-1 row p-0 m-0');
		let crd_bdy_crd_text = $('<div/>').addClass('d-flex justify-content-between col-12 p-0 m-0');
		let crd_bdy_crd_text_right = $('<div/>').addClass('right-content text-right');
		let crd_bdy_crd_h5 = $('<h5/>').text("${sessionScope.lang}" == "kn" ? obj.heading : obj.heading);
		let crd_bdy_crd_h3 = $('<h3/>').addClass('mb-1');
		let crd_bdy_crd_spin = $('<i/>').addClass('fa fa-spinner fa-spin');
		crd_bdy_crd_text_right.append(crd_bdy_crd_h5).append(crd_bdy_crd_h3.append(crd_bdy_crd_spin));
		
		let crd_bg_img = $('<img/>').attr('style','width:60px;height:70px').attr({"src":"../resources/images/dashboard/"+obj.card_img,"alt":"icon"});
		crd_bdy_crd_text.append(crd_bg_img).append(crd_bdy_crd_text_right);
		crd_bdy_row.append(crd_bdy_crd_text);


    var webData = {'query_id' : obj.dash_id };
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getDashBoardQuery&serviceType=MASTER';
  map=genericAjaxCallForJsonWithLoader(webDataUrl,JSON.stringify(webData),"loader");
	 // genericAjaxCallWithCallback(webDataUrl.trim(), JSON.stringify(webData),true,null,function(map){
		var webDataStatus = map.get("serviceStatus");
		var webDataCnt = map.get("serviceResponse");
    console.log(webDataStatus);
    crd_bdy_crd_h3.html( webDataCnt[0].count_data);
  //});
		// getDashboardCount(obj.dash_id,function(count_dataObj){
    //   console.log(count_dataObj);
		// 	if(count_dataObj != null){
				
		// 		crd_bdy_crd_h3.html( count_dataObj.count_data);
				
		// 	} 
		// });
		
		crd_bdy_div.append(crd_bdy_row);
		crd_div.append(crd_bdy_div);
		col_div.append(crd_div);
		
		$('div#div_dashboard_count').append(col_div);
	});
}
function getDashboardCount(dtlid,fnCountCallBack){
	var webData = {'query_id' : dtlid };
	var webDataUrl = '${pageContext.request.contextPath}/ajax/getWebServicesData?serviceName=getDashBoardQuery&serviceType=MASTER';
	genericAjaxCallWithCallback(webDataUrl.trim(), JSON.stringify(webData),true,null,function(map){
		var webDataStatus = map.get("serviceStatus");
		var webDataCnt = map.get("serviceResponse");
    console.log(webDataStatus);
		if(webDataStatus === 1)
		{
			return fnCountCallBack(webDataCnt[0]);
		}else{
			return null;	 
		}
	});
}

//new Devlopment

</script>

//<script src="https://kit.fontawesome.com/a076d05399.js"></script>