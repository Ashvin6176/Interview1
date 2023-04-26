<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:message bundle="${commonConfig}" key="commonAdminAndUserService" var="commonAdminAndUserServiceNew"/>
<style>
.backbutton0 i {
    font-size: 14px;
    color: #ffffff;
    background: #153d77;
    border-radius: 50%;
    padding: 7px;
    box-shadow: 0px 0px 6px 0px #cecece;
}
i.fa.fa-info {
    font-size: 16px;
	color: #ffffff;
	background: #153d77;
	border-radius: 50%;
	padding: 5px 10px;
	box-shadow: 0px 0px 6px 0px #cecece;
}
.iconsright{
position: relative;
    top: -19px;
}
</style>
	<div class="tile-header">
		<div class="row">
			<div class="col-lg-4">
				<div >
					<c:if test="${param.isBack eq 'Y'}">
						<div class="text-left">
							 <c:choose>
								<c:when test="${not empty param.backHref}">
									<a class="backbutton0" href="${param.backHref}"><i class="fa fa-arrow-left"></i></a>
								</c:when>
								<c:otherwise>
									<a class="backbutton0" href="../masterView/loadMasterScreen"><i class="fa fa-arrow-left"></i></a> 
								</c:otherwise>
							</c:choose> 
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-4">
				 <div class="text-center">
				  <h3 class="box-title">${param.jspHeaderName }</h3>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="text-right" >
					<c:if test="${param.isDescription eq 'Y'}">
						<span>
						<a data-toggle="modal" data-target="#modal-center" class="" href="${param.backHref}"><i class="fa fa-info"></i></a>
<%-- 							<jsp:include page="../MasterInfo/Instruction.jsp"></jsp:include> --%>
						</span>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	
	
	 <!-- Modal -->
				<div class="modal center-modal fade" id="modal-center" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content">
					  <div class="modal-header">
						<h5 class="modal-title">Screen Guidance</h5>
						<button type="button" class="close defaultPrivilege" data-dismiss="modal">
						  <span aria-hidden="true" >&times;</span>
						</button>
					  </div>
					  <div class="modal-body">
						<div class="media-list media-list-hover" id="instructionDivId">
				  		</div>
					  </div>
					  <div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-bold btn-pure btn-secondary defaultPrivilege pull-right" data-dismiss="modal">Close</button>
					  </div>
					</div>
				  </div>
				</div>
			  <!-- /.modal -->
	
	
	
	
	

<!-- Screen Privillages jsp -->
<%-- <jsp:include page="commonScreenRights.jsp">
<jsp:param value="${param.jspCode }" name="screen_code"/>
</jsp:include> --%>

<script>
function getScreenInstructions(screen_id){
// 	alert(screen_id);
	var webData = {'screen_id':screen_id};
	
	var commonAdminAndUserServiceNew='${commonAdminAndUserServiceNew}';
	var webDataUrl =commonAdminAndUserServiceNew+"getUserManagementWebService?serviceName=getScreenInstructions&serviceType=OTHER";
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
	if (webDataStatus === 1 && webDataCnt.length > 0) {
		$.each(webDataCnt, function(index) {
			
			var hrefId=$('<a/>').addClass("media media-single");
			if(webDataCnt[index].inst_color != null && webDataCnt[index].inst_color == 'red')
				{
					var divId=$('<div/>').addClass("media-body pl-15 bl-5 rounded border-warning");
				}
			else{
					var divId=$('<div/>').addClass("media-body pl-15 bl-5 rounded border-primary");
				}
			var paraId=$('<p/>').html(webDataCnt[index].inst_description);//.css('color',webDataCnt[index].inst_color);
			var spanId=$('<span/>').addClass("font-size-18 text-gray iconsright hover-info pull-right");
			if(webDataCnt[index].document_name != null && webDataCnt[index].document_name != '')
				{
					spanId.append($('<i/>').addClass("fa fa-download")
							.attr("onclick","viewDocument('"+webDataCnt[index].document_name+"','instructionDocumentFor')")
							);
				}
			divId.append(paraId).append(spanId);
			hrefId.append(divId);
			$('#instructionDivId').append(hrefId);
		});
				
	}
}	
getScreenInstructions('${param.jspCode }');
</script>

