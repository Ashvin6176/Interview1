<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:message bundle="${commonConfig}" key="commonAdminAndUserService" var="commonAdminAndUserServiceNew"/>

<script>
//============Screeen Privillages Access ===========

// var PrivillagesMap=new Map();
// PrivillagesMap.set("defaultPrivilege","Y");
var PrivillagesArr = [];
PrivillagesArr.push("defaultPrivilege");

function checkPrivillages(){
// 	$("button[type=button],input[type=button]").attr("disabled",true).attr("data-toggle","tooltip").attr("title","You have no rights access the data");
		
 	$("button[type=button],input[type=button]").each(function(e){
 		
			var buttonClass=$(this).prop('class').split(" ");
			if(buttonClass !=null)
			{
				var isFounded = buttonClass.some(ai => PrivillagesArr.includes(ai));
				if(!isFounded)
					{				
						$(this).removeAttr("onclick").attr("disabled",true).attr("data-toggle","tooltip").attr("title","You have no rights access the data");
					}
				
				/* for(var i=0;i<buttonClass.length;i++)
					{
// 					 if(buttonClass.includes('defaultPrivilege')){
// 						$('.'+buttonClass[i]).attr("disabled",false);
// 					} 
					 if(buttonClass[i] != null && buttonClass[i] == 'defaultPrivilege')
						{
							$('.'+buttonClass[i]).attr("disabled",false);
						}
					else if(PrivillagesMap.has(buttonClass[i]))
						{
							if(PrivillagesMap.has(buttonClass[i])){
								var privData=PrivillagesMap.get(buttonClass[i]);
								 if (privData != null && privData == "Y"){
								 $('.'+buttonClass[i]).attr("disabled",false);
								}
							 else{
								 $('.'+buttonClass[i]).removeAttr("onclick");
							 }
						}
					
					} */
				
			}
		});
 	 
}

function getScreenPrivillages(role_id,Screen_id){
// 	alert(role_id+"---"+Screen_id);
	var webData = {'role_id':role_id,'screen_id':Screen_id};
	var commonAdminAndUserServiceNew='${commonAdminAndUserServiceNew}';
	var webDataUrl =commonAdminAndUserServiceNew+"getUserManagementWebService?serviceName=getScreenPrivillages&serviceType=OTHER";
	var webDataMap = genericAjaxCallForJsonWithLoader(webDataUrl, JSON.stringify(webData), "loader");
	var webDataStatus = webDataMap.get("serviceStatus");
	var webDataCnt = webDataMap.get("serviceResponse");
	if (webDataStatus === 1 && webDataCnt.length > 0) {
	
		 if(webDataCnt[0].view_rights != null && webDataCnt[0].view_rights== 'Y')
		 {
			 	PrivillagesArr.push("viewPrivilege");
		 }
		 if(webDataCnt[0].add_rights != null && webDataCnt[0].add_rights== 'Y')
		 {
			 	PrivillagesArr.push("addPrivilege");
		 }
		 if(webDataCnt[0].save_rights != null && webDataCnt[0].save_rights== 'Y')
		 {
				PrivillagesArr.push("savePrivilege");
	 	 }
		 if(webDataCnt[0].update_rights != null && webDataCnt[0].update_rights== 'Y')
		 {
				PrivillagesArr.push("updatePrivilege");
		 }
		 if(webDataCnt[0].delete_rights != null && webDataCnt[0].delete_rights== 'Y')
		 {
		 		PrivillagesArr.push("deletePrivilege");
		 }
		 if(webDataCnt[0].search_rights != null && webDataCnt[0].search_rights== 'Y')
		 {
				 PrivillagesArr.push("searchPrivilege");
		 }
		 if(webDataCnt[0].activate_rights != null && webDataCnt[0].activate_rights== 'Y')
		 {
				 PrivillagesArr.push("activatePrivilege");
		 }
		 if(webDataCnt[0].deactivate_rights != null && webDataCnt[0].deactivate_rights== 'Y')
		 {
				 PrivillagesArr.push("deactivatePrivilege");
		 }
		 if(webDataCnt[0].export_as_pdf_rights != null && webDataCnt[0].export_as_pdf_rights== 'Y')
		 {
				 PrivillagesArr.push("exportAsPdfPrivilege");
		 }
		 if(webDataCnt[0].export_as_excel_rights != null && webDataCnt[0].export_as_excel_rights== 'Y')
		 {
				 PrivillagesArr.push("exportAsExcelPrivilege");
		 }
		 if(webDataCnt[0].print_rights != null && webDataCnt[0].print_rights== 'Y')
		 {
				 PrivillagesArr.push("printPrivilege");
		 }
		 if(webDataCnt[0].generate_rights != null && webDataCnt[0].generate_rights== 'Y')
		 {
				 PrivillagesArr.push("generatePrivilege");
		 }
		 if(webDataCnt[0].upload_rights != null && webDataCnt[0].upload_rights== 'Y')
		 {
				 PrivillagesArr.push("uploadPrivilege");
		 }
		 if(webDataCnt[0].download_rights != null && webDataCnt[0].download_rights== 'Y')
		 {
				 PrivillagesArr.push("downloadPrivilege");
		 }
		 if(webDataCnt[0].import_rights != null && webDataCnt[0].import_rights== 'Y')
		 {
				 PrivillagesArr.push("importPrivilege");
		 }
		 if(webDataCnt[0].export_rights != null && webDataCnt[0].export_rights== 'Y')
		 {
				 PrivillagesArr.push("exportPrivilege");
		 }
		 if(webDataCnt[0].access_rights != null && webDataCnt[0].access_rights== 'Y')
		 {
				 PrivillagesArr.push("accessPrivilege");
		 }
		 if(webDataCnt[0].edit_rights != null && webDataCnt[0].edit_rights== 'Y')
		 {
				 PrivillagesArr.push("editPrivilege");
		 }
		 
	}
	checkPrivillages();
}	

$(document).ready(function($) {
	
	getScreenPrivillages(localStorage.getItem("role_id"), '${param.screen_code}');
	
	$(document).on('mouseover touchend','button,input[type=button]',function() {
		  checkPrivillages();
		});
	
	
});
</script>