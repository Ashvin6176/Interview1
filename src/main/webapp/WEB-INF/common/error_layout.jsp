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
<%-- <link href="<%=request.getContextPath()%>/css/_all-skins.css" rel="stylesheet" type="text/css" /> --%>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-extend.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/master_style.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/fonts.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/_all-skins.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/sweetalert.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-select.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/select2.min.css"/>"></link>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap-datepicker.min.css"/>"></link>

<script src="<c:url value="/js/jquery-3.4.1.min.js"/>"></script>
<script src="<c:url value="/js/popper.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/demo.js"/>"></script>
<script src="<c:url value="/js/jquery.slimscroll.js"/>"></script>
<script src="<c:url value="/js/template.js"/>"></script>
<script src="<c:url value="/js/jquery.steps.js"/>"></script>
<script src="<c:url value="/js/steps.js"/>"></script>
<script src="<c:url value="/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/js/select2.full.js"/>"></script>
<script src="<c:url value="/js/advanced-form-element.js"/>"></script>
<script src="<c:url value="/js/commonAjax/AllValidation.js"/>"></script>
<script src="<c:url value="/js/commonAjax/commonAjaxCalling.js"/>"></script>
<script src="<c:url value="/js/bootstrapValidate/bootstrap-validate.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.min.js"/>"></script>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body class="hold-transition">
	   <tiles:insertAttribute name="body" />
</body>
</html>