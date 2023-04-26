<%@page import="com.ict.utils.CommonUtility"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ict.mahadev.constant.Constants"%>
<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}
body {font-family: "Times New Roman", Georgia, Serif;}
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 1px;
}
</style>

<div class="wrapper">
  <!-- Left side column. contains the logo and sidebar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content">
    <div class="main-innerbody">
      <div class="row">
        <div class="col-12">
          <div class="box box-default" style="padding:100px 0px 150px 0px">
      
            <div class="box-body ">
            <div class="row d-flex justify-content-center aling-items-center">
            <header class="w3-display-container w3-content w3-wide text-center" style="max-width:100%;min-width:500px;" id="home">
<%--              <img src="<%=request.getContextPath()%>/resources/images/logo-light.png" alt="logo" class="light-logo"  width="300"> --%>
			  <div class="w3-display-bottomleft w3-padding-large w3-opacity text-center">
			   <h1 class="w3-xxlarge">Welcome to</h1>
			    <h1 class="w3-xxlarge"><%=Constants.PROJECT_NAME%></h1>
			  </div>
			</header>
            </div>
			    </div>
          </div>
       </div>
        </div>
      </div>
 
   </section>
 
   
   </div> 
   <script type="text/javascript">

   $(document).ready(function(){
	   var user_id='${user_id}';

		if(user_id !=null && user_id != '' && user_id !='undefined')
			{
// 					getUserSessionData(user_id);
			}
   });
   </script>

</div>
