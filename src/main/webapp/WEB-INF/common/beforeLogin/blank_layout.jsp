<!-- START :: BAGHEL MITKUMAR -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo-light.png">
<%-- <link href="<%=request.getContextPath()%>/css/_all-skins.css" rel="stylesheet" type="text/css" /> --%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-extend.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/master_style.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/fonts.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/_all-skins.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/sweetalert.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-select.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/select2.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-datepicker.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/toaster/jquery.toast.css"/>"></link>

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
<script src="<c:url value="/resources/js/datatable/data-table.js"/>"></script>
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
<script src="<c:url value="/resources/js/aes.js"/>"></script>
<!-- END :: JS -->

<title><tiles:insertAttribute name="title" /></title>
</head>
<body class="hold-transition sidebar-mini">
	<!--body part -->
		<div class="main-body1">
	   		<tiles:insertAttribute name="body" />
	    </div>
</body>
</html>