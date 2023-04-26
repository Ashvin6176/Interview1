<%@page import="com.ict.utils.CommonUtility"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.field_set{
  border-color: #F00;
  border-style: solid;
}

</style>

							           <div class="row">
						            			<div class="col-12">
						            			<div class="card userProfileDataCard" style="box-shadow: none !important;">
													 
													  <div class="card-body text-center">
													    <div class="row">
															<div class="col-12 col-md-4 col-lg-4">
																<img src="" id="show_user_profile_photo" class="rounded-circle"  style="background-size: cover;" onerror="this.src='<%=request.getContextPath()%>/resources/images/TDS_000001.jpg';this.onerror='';" alt="User Photo" width="200" height="200"> 
															</div>
															<div class="col-12 col-md-8 col-lg-8">
																<table class="table table-borderless" id="show_user_profileTable">
																	<tbody>
																		<tr>
																			<th>Name</th>
																			<th> : </th>
																			<td><label id="user_name_forModal">ADMIN</label></td>
																		</tr>
																		<!-- <tr>
																			 <th>Kgid No</th>
																			 <th> : </th>
																			 <td><label id="user_kgid_forModal"></label></td>
																		 </tr>
																		 <tr>
																			 <th>Category</th>
																			 <th> : </th>
																			 <td><label id="user_category_forModal"></label> </td>
																		 </tr> -->
																		 <tr>
																			<th>Designation</th>
																			<th> : </th>
																			<td><label id="user_designation_forModal">SYSTEM ADMIN</label> </td>
																		</tr> 
																		 <!-- <tr>
																			 <th>Default Role</th>
																			 <th> : </th>
																			 <td><label id="user_default_role_forModal"></label> </td>
																		 </tr> -->
																		<tr>
																			 <th>Mobile No</th>
																			 <th> : </th>
																			 <td><label id="user_mobile_no_forModal">9876543210</label> </td>
																		 </tr>
																		 
																		 <tr>
																			 <th>Email Id</th>
																			 <th> : </th>
																			 <td><label id="user_email_id_forModal">admindemo@ict.com</label> </td>
																		 </tr>
																		 
																		 
																		
																	</tbody>
																</table>
															</div>

														</div>
															
													  </div>
													</div>
						            			</div>
						            			
						            			
		            			       </div>
