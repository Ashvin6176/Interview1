<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<section class="bg-img h-p100" style="background-image: url(./images/6.jpg);">
		<div class="container h-p100">
		  <div class="row h-p100 align-items-center justify-content-center">
			<div class="col-12">
				<h1 class="error-title my-30">Internal Server Error !</h1>
				<div class="main-agileits bg-img">
					<h2 class="font-size-80">Internal <span class="font-weight-800 text-danger"><em>500</em></span> Server<br> Error !</h2>
					<p class="para-wthree">We are extremely sorry for the inconvenience but hopefully we will back much faster than you think.</p>
					 <form:form name="indexPage" class="flexbox w-p75" method="post" target="_blank" action="#">					  
							<div class="col-12">
                    			<input type="button" class="btn btn-success" value="Back" onclick="window.history.go(-1); return false;">
                  			</div> 
					  </form:form>
				</div>
				<footer class="main-footer bg-transparent text-white ml-0 text-center no-border">
				</footer>
			</div>			  
			
		  </div>
		</div>
</section>
<script type="text/javascript">
function loadCSDashboard() {
	document.indexPage.action="${pageContext.request.contextPath}/cs/indexPage";
	document.indexPage.submit();
}
</script>