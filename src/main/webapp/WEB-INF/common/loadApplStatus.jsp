<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}
</style>
<div class="wrapper">
  <!-- Left side column. contains the logo and sidebar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Application</h1>
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
	        <li class="breadcrumb-item"><a href="#">Application</a></li>
	        <li class="breadcrumb-item active">Application Menu</li>
	      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
	    <div class="main-innerbody">
	      <!-- tabs -->
	      <div class="row">
	        <div class="col-12">
	          <div class="box box-default">
	            <div class="box-header with-border">
	              <h3 class="box-title">Application Menu</h3>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	            	<div id="contentDiv">
	            		<div id="validateDivId">
	            			<div class="row">
	            				<div class="col-xs-12 col-sm-12 col-md-12 col-ld-12">
	            					<p align="left"><b>Fields marked with a <b style="color: red;">*</b> for a successful submission are mandatory</b></p>
	            				</div>
	            			</div>
		            		<form:form id="applMenuFormId" name="applMenuForm">
		            			<input type="hidden" name="applMenuId" id="applhiddenMenuId">
				            		<div class="row">
							    		<div class="col-md-6">
							              <div class="form-group">
							                <label for="applicantName">Application Number<span style="color: red">*</span>:</label>
							                <input type="text" name="applNumber" class="form-control">
							              </div>
							            </div>
									  </div>
									  <div class="row">
								    	<div class="col-md-12 mt-4">
								    		<div class="form-group">
								    			<input type="button" class="btn btn-success" value="SUBMIT">
								    		</div>
								    	</div>
								  	  </div>
								  </form:form>
							  </div>
	            			</div>
				          </div>
				       </div>
				     </div>
				   </div>
	      		 </div>
    	</section>
  	</div>
</div>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>