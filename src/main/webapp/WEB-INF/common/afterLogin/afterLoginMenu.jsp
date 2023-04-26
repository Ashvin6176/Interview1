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
         		 <a href="#"><i class="fa fa-th"></i><span>Master Configuration</span><span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span></a>
		         <ul class="treeview-menu">
		         	<li><a href="#" onclick="loadManagePatient()"><i class="far fa-circle ion"></i>Manage Patient</a></li>
		         	<li><a href="#" onclick="loadManageCareGiver()"><i class="far fa-circle ion"></i>Manage Care Giver</a></li>
		            <li><a href="#" onclick="loadManageInsuranceCompany()"><i class="far fa-circle ion"></i>Manage Insurance Company</a></li>
<!-- 		            <li><a href="#" onclick="loadPatientApplDtls()"><i class="far fa-circle ion"></i>Patient Application Details</a></li> -->
<!-- 		            <li><a href="#" onclick="loadPatientCareGiverMapping()"><i class="far fa-circle ion"></i>Patient Care Giver Mapping</a></li> -->
		         </ul>	
         	</li>
         	<li class="treeview">
         		 <a href="#"><i class="fa fa-th"></i><span>Transactions</span><span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span></a>
		         <ul class="treeview-menu">
		         	<li><a href="#" onclick="loadUploadWeeklyBaseData()"><i class="far fa-circle ion"></i>Upload Weekly Base Data</a></li>
		         	<li><a href="#" onclick="loadGenerateBillingData()"><i class="far fa-circle ion"></i>Generate Billing Data</a></li>
		            <li><a href="#" onclick="loadGenerateSalaryData()"><i class="far fa-circle ion"></i>Generate Salary Data</a></li>
<!-- 		            <li><a href="#" onclick="loadComparisonGeneration()"><i class="far fa-circle ion"></i>Comparison Generation</a></li> -->
<!-- 		            <li><a href="#" onclick="loadComparisonReport()"><i class="far fa-circle ion"></i>Comparison Report</a></li> -->
<!-- 		            <li><a href="#" onclick="loadMonthlyAuthExpiryReport()"><i class="far fa-circle ion"></i>Monthly Authorization Expiry Report</a></li> -->
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
    
     <!--  <ul class="sidebar-menu" data-widget="tree">
        <li class="user-profile treeview">
          <a href="#"> -->
      		<%-- <img src="<%=request.getContextPath()%>/resources/images/TDS_000001.jpg" alt="user"> --%>
<!--             <span>Applicant</span> -->
            <!-- <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
      	  <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-user mr-5"></i>My Profile</a></li>
      		<li><a href="javascript:void()" onclick="loadLoginPage()"><i class="fa fa-power-off mr-5"></i>Logout</a></li>
          </ul>
        </li> -->
<!--         <li class="treeview">
          <a href="#">
          <i class="fa fa-th"></i>
            <span>Application</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadMenu();"><i class="far fa-circle ion"></i>Application</a></li>
          </ul>
        </li>
         <li class="treeview">
          <a href="#">
          <i class="fa fa-th"></i>
            <span>Citizen Registration</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadCitizenReg();"><i class="far fa-circle ion"></i>Citizen Registration</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>GP Screen</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
				<li><a href="#" onclick="loadGPScreens()"><i class="far fa-circle ion"></i>GP Screens</a></li> 
				<li><a href="#" onclick="loadGPSDashboard()"><i class="far fa-circle ion"></i>GPS Dashboard</a></li> 
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>PDO Screen</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
				<li><a href="#" onclick="loadpdoScreens()"><i class="far fa-circle ion"></i>PDO Screens</a></li>
				<li><a href="#" onclick="loadPDODashboard()"><i class="far fa-circle ion"></i>PDO Dashboard</a></li>  
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Payment Screen</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
				<li><a href="#" onclick="loadPaymentScreen()"><i class="far fa-circle ion"></i>Payment</a></li> 
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
          <i class="fa fa-th"></i>
            <span>List Of Application</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadListOfAppl();"><i class="far fa-circle ion"></i>List Of Application(Applicant)</a></li>
            <li><a href="#" onclick="loadListOfApplGP();"><i class="far fa-circle ion"></i>List Of Application(GP)</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Status</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadApplStatus()"><i class="far fa-circle ion"></i>Status</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>SMS Event</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadNotificationTemplate()"><i class="far fa-circle ion"></i>Notification Template</a></li>
            <li><a href="#" onclick="loadSMSEventMst()"><i class="far fa-circle ion"></i>SMS Event</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Master</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadMasterService()"><i class="far fa-circle ion"></i>Master Service</a></li>
            <li><a href="#" onclick="loadSubCategoryMst()"><i class="far fa-circle ion"></i>Sub Category Master</a></li>
            <li><a href="#" onclick="loadCategoryMaster()"><i class="far fa-circle ion"></i>Category Master</a></li>
            <li><a href="#" onclick="loadDocumentMaster()"><i class="far fa-circle ion"></i>Document Service</a></li>
            <li><a href="#" onclick="loadInstructionMaster()"><i class="far fa-circle ion"></i> Instruction Master</a></li>
             <li><a href="#" onclick="loadApplicationMaster()"><i class="far fa-circle ion"></i>Application Service</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Label</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadLabelScreen()"><i class="far fa-circle ion"></i>Add Label</a></li>
          </ul>
        </li> 
        
		<li class="treeview">
			 <a href="#">
	            <i class="fa fa-th"></i>
	            <span>Admin & User Management</span>
	            <span class="pull-right-container">
	              <i class="fa fa-angle-right pull-right"></i>
	            </span>
	         </a>
	         <ul class="treeview-menu">
	         	
	         	<li class="treeview">
	         		 <a href="#">
			            <i class="fa fa-th"></i>
			            <span>User Management</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-right pull-right"></i>
			            </span>
			         </a>
			         <ul class="treeview-menu">
			         	<li><a href="#" onclick="loadAddUser()"><i class="far fa-circle ion"></i>Add User</a></li>
			            <li><a href="#" onclick="loadDeleteUser()"><i class="far fa-circle ion"></i>Delete User</a></li>
			            <li><a href="#" onclick="loadChangePassword()"><i class="far fa-circle ion"></i>Change Password</a></li>
			            <li><a href="#" onclick="loadResetPassword()"><i class="far fa-circle ion"></i>Reset Password</a></li>
			            <li><a href="#" onclick="loadServiceConfiguration()"><i class="far fa-circle ion"></i>Service Wise Workflow Configuration</a></li>
			         </ul>	
	         	</li>
	         	<li class="treeview">
	         		 <a href="#">
			            <i class="fa fa-th"></i>
			            <span>Role Management</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-right pull-right"></i>
			            </span>
			         </a>
			         <ul class="treeview-menu">
			         	<li><a href="#" onclick="loadRoleCreation()"><i class="far fa-circle ion"></i>Role Creation</a></li>
			            <li><a href="#" onclick="loadAddRoleMenu()"><i class="far fa-circle ion"></i>Add Menu</a></li>
			            <li><a href="#" onclick="loadAssignMenu()"><i class="far fa-circle ion"></i>Assign Menu</a></li>
			            <li><a href="#" onclick="loadAssignChildMenu()"><i class="far fa-circle ion"></i>Assign Child Menu</a></li>
			            <li><a href="#" onclick="loadViewMenu()"><i class="far fa-circle ion"></i>View Menu</a></li>
			            <li><a href="#" onclick="assignFunctionalityAccessOfScreen()"><i class="far fa-circle ion"></i>Access Screen Rights to Role</a></li>
			            <li><a href="#" onclick="loadMstDataAccessPrivileges()"><i class="far fa-circle ion"></i>Data Access privileges</a></li>
			            <li><a href="#" onclick="loadMpgRoleUser()"><i class="far fa-circle ion"></i>Role User Mapping</a></li>
			            <li><a href="#" onclick="loadCopyRoleUser()"><i class="far fa-circle ion"></i>Copy Role User Mapping</a></li>
			                        <li><a href="#" onclick="loadMenuMapping()"><i class="far fa-circle ion"></i>Role Menu Mapping</a></li>
			         </ul>	
	         	</li>
	         	<li class="treeview">
	         		 <a href="#">
			            <i class="fa fa-th"></i>
			            <span>Master Configuration</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-right pull-right"></i>
			            </span>
			         </a>
			         <ul class="treeview-menu">
			         	<li><a href="#" onclick="loadMasterTableMst()"><i class="far fa-circle ion"></i>New Screen Entry</a></li>
			         	<li><a href="#" onclick="loadDesignationMaster()"><i class="far fa-circle ion"></i>Designation Master</a></li>
			            <li><a href="#" onclick="loadStageMaster()"><i class="far fa-circle ion"></i>Stage Master</a></li>
			            <li><a href="#" onclick="loadActionMaster()"><i class="far fa-circle ion"></i>Action Master</a></li>
			         </ul>	
	         	</li>
	         </ul>
        </li> -->
        <!-- START : SAJJAD -->
        
        <!-- <li>
          			<a href="#" onclick="loadGpDashboard()"><i class="fa fa-th"></i> <span>GP Dashboard</span></a>
          	</li>
            <li>
            		<a href="#" onclick="loadAddOperation()"><i class="fa fa-th"></i> <span>GP Profile</span></a>
            </li>
            <li>
            		<a href="#" onclick="loadGPStaffList()"><i class="fa fa-th"></i> <span>GP Staff</span></a>
            </li>
            <li>
             		<a href="#" onclick="loadGPData()"><i class="fa fa-th"></i> <span>GP Demographic Information</span></a>
            </li>
            <li>
             		<a href="#" onclick="loadGPVillages()"><i class="fa fa-th"></i> <span>GP Villages</span></a>
            </li>
            <li>
              		<a href="#" onclick="loadAvailBenificiaries()"><i class="fa fa-th"></i> <span>Available Beneficiaries</span></a>
            </li>
            <li>
            		<a href="#" onclick="loadDuplicateBenificiaries()"><i class="fa fa-th"></i> <span>Duplicate Beneficiaries</span></a>
            </li>
 
            <li>
            		<a href="#" onclick="loadBeneficiaries()"><i class="fa fa-th"></i> <span>Beneficiaries</span></a>
           </li>
            <li>
            		<a href="#" onclick="loadschemes()"><i class="fa fa-th"></i> <span>Schemes</span></a>
            </li>
            <li>
            		<a href="#" onclick="loadGpProfileReport()"> <i class="fa fa-th"></i> <span>Gp Profile Report</span></a>
            </li>
               <li>
             		<a href="#" onclick="loadGPApprovalListPDO()"><i class="fa fa-th"></i> <span>GP Approval List (PDO)</span></a>
            </li>
            <li>
             		<a href="#" onclick="loadGPApprovalListPresident()"><i class="fa fa-th"></i> <span>GP Approval List (President)</span></a>
            </li> -->
            
     <!--   <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Operations</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="#" onclick="loadGpDashboard()"><i class="far fa-circle ion"></i>GP Dashboard</a></li>
            <li><a href="#" onclick="loadAddOperation()"><i class="far fa-circle ion"></i>GP Profile</a></li>
            <li><a href="#" onclick="loadGPStaffList()"><i class="far fa-circle ion"></i>GP Staff</a></li>
             <li><a href="#" onclick="loadGPData()"><i class="far fa-circle ion"></i>GP Demographic Information</a></li>
             <li><a href="#" onclick="loadGPVillages()"><i class="far fa-circle ion"></i>GP Villages</a></li>
              <li><a href="#" onclick="loadAvailBenificiaries()"><i class="far fa-circle ion"></i>Available Beneficiaries</a></li>
               <li><a href="#" onclick="loadDuplicateBenificiaries()"><i class="far fa-circle ion"></i>Duplicate Beneficiaries</a></li>
            <li><a href="#" onclick="loadNewScheme()"><i class="far fa-circle ion"></i>New Scheme</a></li>
             <li><a href="#" onclick="loadBuildingNote()"><i class="far fa-circle ion"></i>Delete Employee</a></li>
             Start :: Mitesh Chaudhari   :: //
            <li><a href="#" onclick="loadBeneficiaries()"><i class="far fa-circle ion"></i>Beneficiaries</a></li>
            <li><a href="#" onclick="loadschemes()"><i class="far fa-circle ion"></i>Schemes</a></li>
            <li><a href="#" onclick="loadGPDemographicInfo()"><i class="far fa-circle ion"></i>GP Demographic Information</a></li>
           
             End :: Mitesh Chaudhari   :: //

          </ul>
        </li>
 -->         <!--   <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>HRMS</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="loadEmployeeDetails()"><i class="far fa-circle ion"></i>Employee Registration</a></li>
            <li><a href="#" onclick="loadRecruitmentDetails()"><i class="far fa-circle ion"></i>Recruitment Details</a></li>
             <li><a href="#" onclick="loadBuildingNote()"><i class="far fa-circle ion"></i>Delete Employee</a></li>

          //   Start  :: Mitesh Chaudahri   ::   //
             <li><a href="#" onclick="loadMonthlySalaryPDO()"><i class="far fa-circle ion"></i>Monthly Salary -PDO Digital Sign</a></li>
             <li><a href="#" onclick="loadMonthlySalaryPresentDigitalSign()"><i class="far fa-circle ion"></i>Monthly Salary -Present Digital Sign</a></li>
             <li><a href="#" onclick="auxiliarybill()"><i class="far fa-circle ion"></i>Auxiliary Bill</a></li>
             <li><a href="#" onclick="prsentauxiliarybill()"><i class="far fa-circle ion"></i>Present Processing Auxiliary Bill</a></li>
             <li><a href="#" onclick="GpApprovalOfInquiry()"><i class="far fa-circle ion"></i>GP Approval Of Inquiry</a></li>
             <li><a href="#" onclick="AppealRequestForTermination()"><i class="far fa-circle ion"></i>Appeal Request for Termination</a></li>
             <li><a href="#" onclick="TrackOfTerminationApplication()"><i class="far fa-circle ion"></i>Track Of Termination Application</a></li>
             <li><a href="#" onclick="AppealAprovalForTermination()"><i class="far fa-circle ion"></i>Appeal Approval  for Termination</a></li>
             <li><a href="#" onclick="GenerateTerminationLetter()"><i class="far fa-circle ion"></i>Generate Termination Letter</a></li>
             <li><a href="#" onclick="GpApprovalRecruitmentForm()"><i class="far fa-circle ion"></i>GP Approval Recruitment Form</a></li>
             <li><a href="#" onclick="CommitteeApprovalRecruitmentForm()"><i class="far fa-circle ion"></i>Committee Approval Recruitment Form</a></li>
             <li><a href="#" onclick="IssueOfAnAdvertisement()"><i class="far fa-circle ion"></i>Issue of an Advertisement</a></li>
             <li><a href="#" onclick="SanctionedPostDetails()"><i class="far fa-circle ion"></i>Sanctioned Post Details</a></li>
             <li><a href="#" onclick="ApprovalOfSanctionedPostDetails()"><i class="far fa-circle ion"></i>Approval of Sanctioned Post Details</a></li>
             <li><a href="#" onclick="CriteriaofRecruitment()"><i class="far fa-circle ion"></i>Criteria of Recruitment</a></li>
             <li><a href="#" onclick="FinalizePromoteCandidate()"><i class="far fa-circle ion"></i>Finalize Promote Candidate</a></li>
           //   End  :: Mitesh Chaudahri   ::   //
 				
 				Start By :: Payal Patanvadiya
				<li><a href="#" onclick="loadResignationForm()"><i class="far fa-circle ion"></i>Employee Resignation Form</a></li>
				<li><a href="#" onclick="loadResignationList()"><i class="far fa-circle ion"></i>Review of Resignation List</a></li>
				<li><a href="#" onclick="loadRetirementListofEmployee()"><i class="far fa-circle ion"></i>Generate Retirement List</a></li>
				<li><a href="#" onclick="loadTerminationRequestListofEmployee()"><i class="far fa-circle ion"></i>Generate Termination List</a></li>
				<li><a href="#" onclick="loadInquiryProcess()"><i class="far fa-circle ion"></i>Inquiry Details</a></li>
				<li><a href="#" onclick="InquiryApprovalProcess()"><i class="far fa-circle ion"></i> Approval Inquiry</a></li>
				<li><a href="#" onclick="loadRecruitmentRequestForm()"><i class="far fa-circle ion"></i>Request For Recruitment</a></li>
				<li><a href="#" onclick="loadRecruitmentRequestList()"><i class="far fa-circle ion"></i>Recruitment Request's List</a></li>
 				End By :: Payal Patanvadiya
             
             

          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Survey</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            START AMI SONI Master Screen
             <li><a href="#" onclick="loadIntegrationMaster()"><i class="far fa-circle ion"></i>Integration Master</a></li>

             <li><a href="#" onclick="loadIntegrationFieldMaster()"><i class="far fa-circle ion"></i>Integration Field Master</a></li>
           
              <li><a href="#" onclick="loadSurveySectorMaster()"><i class="far fa-circle ion"></i>Survey Sector Master</a></li>
              <li><a href="#" onclick="loadSurveyTypeMaster()"><i class="far fa-circle ion"></i>Survey Type Master</a></li>
              <li><a href="#" onclick="loadSurveyDepartmentMaster()"><i class="far fa-circle ion"></i>Department Type Master</a></li>
              <li><a href="#" onclick="loadSurveyCategoryMaster()"><i class="far fa-circle ion"></i>Survey Category Master</a></li>
             END AMI SONI  Master Screen
                 
            <li><a href="#" onclick="loadSurveyDemo()"><i class="far fa-circle ion"></i>Survey Demo</a></li>
           	 <li><a href="#" onclick="loadSurveyTemplete()"><i class="far fa-circle ion"></i>Survey Template</a></li>
            
            START AMI SONI
              <li><a href="#" onclick="loadMasterSurveyQuestionnaires()"><i class="far fa-circle ion"></i>Master Survey Questionnaires</a></li>
            END AMI SONI
            START :: SHUBHAM
              <li><a href="#" onclick="loadCreateandConductSurvey()"><i class="far fa-circle ion"></i>Create and Conduct Survey</a></li>
              <li><a href="#" onclick="loadSurveyDetails()"><i class="far fa-circle ion"></i>Survey Entry</a></li>
              <li><a href="#" onclick="loadRollbackUpdateSurveyDetail()"><i class="far fa-circle ion"></i>Rollback Update Survey Detail</a></li>              
              <li><a href="#" onclick="loadSurveyList()"><i class="far fa-circle ion"></i>Survey Approval</a></li>
            END :: SHUBHAM
          </ul>
        </li>
        
        START AMI SONI
         <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Planning</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a> 
          <ul class="treeview-menu"> 
             <li><a href="#" onclick="loadSabhaTypeMaster()"><i class="far fa-circle ion"></i>Sabha Type Master</a></li>
             <li><a href="#" onclick="loadSchemeCategoryMaster()"><i class="far fa-circle ion"></i>Scheme Category Master</a></li>
             <li><a href="#" onclick="loadDepartmentMaster()"><i class="far fa-circle ion"></i>Department Master</a></li>
             <li><a href="#" onclick="loadFundTypeMaster()"><i class="far fa-circle ion"></i>Fund Type Master</a></li>
			 <li><a href="#" onclick="loadBeneficiariesTypeMaster()"><i class="far fa-circle ion"></i>Beneficiaries Type Master</a></li>
			 <li><a href="#" onclick="loadSectorMaster()"><i class="far fa-circle ion"></i>Sector Master</a></li>
			 <li><a href="#" onclick="loadNatureofFunding()"><i class="far fa-circle ion"></i>Nature of Funding</a></li>
			 <li><a href="#" onclick="loadWorkGroupMaster()"><i class="far fa-circle ion"></i>Work Group Master</a></li>
			 <li><a href="#" onclick="loadWorkCategoryMaster()"><i class="far fa-circle ion"></i>Work Category Master</a></li>
			 <li><a href="#" onclick="loadWorkTypeMaster()"><i class="far fa-circle ion"></i>Work Type Master</a></li>
			 <li><a href="#" onclick="loadoperationTypeMaster()"><i class="far fa-circle ion"></i>Operation Type Master</a></li>
			 <li><a href="#" onclick="loadTrainingCategory()"><i class="far fa-circle ion"></i>Training Category</a></li>
			 <li><a href="#" onclick="loadTrainingOrganizerEntitymaster()"><i class="far fa-circle ion"></i>Training Organizer Entity Master</a></li>
			 <li><a href="#" onclick="loadCommunityServiceMaster()"><i class="far fa-circle ion"></i>Community Service Master</a></li>
			 <li><a href="#" onclick="loadAssetTypeMaster()"><i class="far fa-circle ion"></i>Asset Type Master</a></li>
			 <li><a href="#" onclick="loadAssetCategoryMaster()"><i class="far fa-circle ion"></i>Asset Category Master</a></li>
			 <li><a href="#" onclick="loadAssetSubCategoryMaster()"><i class="far fa-circle ion"></i>Asset Sub Category Master</a></li>
			 <li><a href="#" onclick="loadAssetUnitMaster()"><i class="far fa-circle ion"></i>Asset Unit Master</a></li>
			 <li><a href="#" onclick="loadCreateScheme()"><i class="far fa-circle ion"></i>Create Scheme</a></li>
			 <li><a href="#" onclick="loadMapSchemetoGP()"><i class="far fa-circle ion"></i>Map Scheme to GP</a></li>	
			 <li><a href="#" onclick="loadBudgetAllocationtoGP()"><i class="far fa-circle ion"></i>Budget Allocation to GP</a></li>	
			 <li><a href="#" onclick="loadResourceEnvelope()"><i class="far fa-circle ion"></i>Resource Envelope</a></li>	
			 <li><a href="#" onclick="loadCreateWork()"><i class="far fa-circle ion"></i>Create Work</a></li>	
			 <li><a href="#" onclick="loadCreatePlanUsingSetofWork()"><i class="far fa-circle ion"></i>Create Plan Using Set of Work</a></li>	
			 <li><a href="#" onclick="loadTechnicalApproval()"><i class="far fa-circle ion"></i>Technical Approval</a></li>	
			 <li><a href="#" onclick="loadAdminApproval()"><i class="far fa-circle ion"></i>Admin Approval</a></li>
			 <li><a href="#" onclick="loadAddSuggestion()"><i class="far fa-circle ion"></i>Add Suggestion</a></li>	
			 <li><a href="#" onclick="loadWorkOutputMaster()"><i class="far fa-circle ion"></i>Work Output Master</a></li>	
			  
          </ul> 
        </li>
        END AMI SONI
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Revenue Collection</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
       <li><a href="#" onclick="loadSurveyTemplete()"><i class="far fa-circle ion"></i>Survey Template</a></li>
            <li><a href="#" onclick="PropertyTax()"><i class="far fa-circle ion"></i>Property Tax</a></li>
            <li><a href="#" onclick="OtherTax()"><i class="far fa-circle ion"></i>Other Tax</a></li>
            <li><a href="#" onclick="ServiceTax()"><i class="far fa-circle ion"></i>Service Tax</a></li>
            <li><a href="#" onclick="TaxCollectionMonitoringReport()"><i class="far fa-circle ion"></i>Tax Collection Monitoring Report</a></li>
            <li><a href="#" onclick="TaxDueMonitoringReport()"><i class="far fa-circle ion"></i>Tax Due Monitoring Report</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i>
            <span>Demo
            </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
				<li><a href="#" onclick="loadDemo()"><i class="far fa-circle ion"></i>Demo</a></li>
				  <li class="treeview">
		          <a href="#">
		            <i class="fa fa-th"></i>
		            <span>Demo
		            </span>
		            <span class="pull-right-container">
		              <i class="fa fa-angle-right pull-right"></i>
		            </span>
		          </a>
		          <ul class="treeview-menu">
						<li><a href="#" onclick="loadDemo()"><i class="far fa-circle ion"></i>Demo</a></li> 
		          </ul>
		        </li>
	        </ul>
		</li> 
          </ul>
        </li> -->
<!--        </ul> -->
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