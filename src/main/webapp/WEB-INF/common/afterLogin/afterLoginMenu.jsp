<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- START :: BAGHEL MITKUMAR -->
<fmt:setBundle basename="Config.CommonConfig" var="commonConfig" scope="request"/>
<%-- <fmt:message bundle="${commonConfig}" key="getMenuUrl" var="getMenuUrl"/> --%>
<fmt:message bundle="${commonConfig}" key="commonAdminAndUserService" var="commonAdminAndUserService"/>
<form:form name="menuFrom" id="menuFromId">
</form:form>
 <aside class="main-sidebar">
    <section class="sidebar">
    
    <div id="div_menu_id">
        <ul class="sidebar-menu" data-widget="tree">
        	<li class="treeview">
         		 <a href="#" onclick="loadCreateUser()"><i class="far fa-circle ion"></i>Create User</a>
         		 <a href="#" onclick="loadAddBookEntry()"><i class="far fa-circle ion"></i>Add Book Entry</a>
         	</li>
         	<li class="treeview">
         		 <a href="#"><i class="fa fa-th"></i><span>Transactions</span><span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span></a>
		         <ul class="treeview-menu">
		         	<li><a href="#" onclick="loadUploadWeeklyBaseData()"><i class="far fa-circle ion"></i>Upload Weekly Base Data</a></li>
		         	<li><a href="#" onclick="loadGenerateBillingData()"><i class="far fa-circle ion"></i>Generate Billing Data</a></li>
		            <li><a href="#" onclick="loadGenerateSalaryData()"><i class="far fa-circle ion"></i>Generate Salary Data</a></li>
		         </ul>	
         	</li>
         	<li class="treeview">
         		 <a href="#"><i class="fa fa-th"></i><span>Reports</span><span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span></a>
		         <ul class="treeview-menu">
		         	<li><a href="#" onclick="loadPatientwiseDaywiseBillingReport()"><i class="far fa-circle ion"></i>Patientwise Daywise Billing Report</a></li>
		         </ul>
		    </li>
    	</ul>    
    </div>
    </section>
  </aside>
  <jsp:include page="../loadJSPfunction.jsp"/>  
  
  
  <script>
  getMenuXmlRoleWise();
  function getMenuXmlRoleWise(){
	  var webMenuUrl='${commonAdminAndUserService}';
//		if(!$('#div_menu_id').is(':empty')){
		
		var moduleId=localStorage.getItem("module_id");
		var roleId=localStorage.getItem("role_id");
//			localStorage.getItem("role_id");
//		alert(moduleId);
		if(moduleId != null && roleId !=null){
//			alert(moduleId);
		$('#div_menu_id').empty();
//		alert(moduleId);
		$.ajax({ 
	        type: "POST",
//	        url: "../resources/ROLEXML/Role"+roleId+".xml?v="+Math.floor((Math.random() * 1000) + 1),
		 url:webMenuUrl+"ajax/getXmlFile/"+roleId, 
	        dataType: "xml",
	        async:false,
	        success: function(xml)
	        {
	        	 var ul_main=$("<ul/>").addClass("sidebar-menu").attr("data-widget","tree");
	             $(xml).find("menu").each(function(){ 
	            	 
	            	 if($(this).attr("moduleId") == moduleId){
		            	 if($(this).children().length)
			             {
		            		 var ulSub=$("<ul class='treeview-menu'/>");
			                  $(this).children().each(function()
			    	          {
			                	  
			                	 if($(this).children().length)
					             {
			                		 var ulSub1=$("<ul class='treeview-menu'/>");
			                		 $(this).children().each(function()
			   			    	     {
			                			 ulSub1.append("<li><a  href='#' onclick='"+$(this).attr("menuFunction")+"'  ><i class='far fa-circle ion'></i><span>"+$(this).attr("menuName")+"</span></a></li>");
			   			    	     })
			   			    	     var li1=$("<li class='treeview'><a href='#'><i class='fa fa-th-list'></i><span>"+$(this).attr("menuName")+"</span><span class='pull-right-container'><i class='fa fa-angle-right pull-right'></i></span></a></li>");
			                		 ulSub.append(li1.append(ulSub1));
					             }else{
			                	  ulSub.append("<li><a  href='#' onclick='"+$(this).attr("menuFunction")+"'  ><i class='far fa-circle ion'></i><span>"+$(this).attr("menuName")+"</span></a></li>");
					             }
					           })
			    	          
			    	          var li=$("<li class='treeview'><a href='#'><i class='fa fa-th'></i><span>"+$(this).attr("menuName")+"</span><span class='pull-right-container'><i class='fa fa-angle-right pull-right'></i></span></a></li>");
			                  ul_main.append(li.append(ulSub));
							  
			             }else{
		            	 
							ul_main.append("<li><a  href='#' onclick='"+$(this).attr("menuFunction")+"'  ><i class='fa fa-th'></i><span>"+$(this).attr("menuName")+"</span></a></li>");
			             }
	            	 }
	            	});
	             
	            $("#div_menu_id").append(ul_main);
	            
	        }
	    });
		
	}
	}

  
  
  </script>
  
  
  <!-- END :: BAGHEL MITKUMAR -->