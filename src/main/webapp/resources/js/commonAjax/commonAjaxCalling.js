function saveFormApplicationWithRequestType(serviceURL,ServiceData,loaderId,formId,requestType)
{
	var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{
		if(loaderId != "")
			$("#"+loaderId).css("display","block");
		$.ajax({
				type : requestType,
				data :  ServiceData,
				url : serviceURL,
				async:false,
				success : function(res) 
				{
					if(loaderId != "")
						$("#"+loaderId).css("display","none");
					
					if(res !=null)
					{
					if(res.status === 998)
						{
							 $.each(res.error_message,function(key,value)
								 {
									sessionOut(value);
								  });
						}
						if(res.status === 999)
						{
							if(res.return_message != null)
							{
								toastr.error(res.return_message,"ERROR",{
		  								closeButton:true
		   	                			});
							}
							else
							{
								 $.each(res.error_message,function(key,value)
								 {
									 toastr.error(value,"ERROR",{
		  								closeButton:true
		   	                			});
								  });
							}
							
						}
						else if(res.status === 200)
						{
						
							if(res.error_message !=null)
							{
							 $.each(res.error_message,function(key,value)
							     {
								
								 $("small."+key).remove();
									$('input[name='+key+']').addClass('validateStyle');
									$('select[name='+key+']').addClass('validateStyle');
									if(!$('select[name='+key+']').hasClass("select2")){
										$('select[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</small>');
									}else{
										$('select[name='+key+']').next('span').addClass(key).addClass("validateStyle");
										$('select[name='+key+']').next('span').after('<small class="error errorTag  text-danger  '+ key+ '" >'+value+'</small>');
									}
									$('textarea[name='+key+']').addClass('validateStyle');
									$('input[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									$('textarea[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									callErrorHideFunction()
								  });
								
								  map.set("serviceResponse",res);
								  map.set("serviceStatus",0);	
								}
							
						}
						else if(res.status === 1000)
						{
							map.set("serviceStatus",1);
							map.set("serviceResponse",res);
							toastr.success(res.return_message,"SUCCESS",{ closeButton:true});
	   	                			
							resetFormData(formId);
							return map;
						}
						else if(res.status === 0)
						{
							map.set("serviceStatus",0);
							
							toastr.error(res.return_message,"ERROR",{
	  								closeButton:true
	   	                			});
						}
						
					}
					else
					{
						map.set("serviceStatus",0);
						
						toastr.error("Response is null","ERROR",{
	  								closeButton:true
	   	                			});
					}
				},
				error : function(xhr, status, errorThrown) 
				{
				
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) 
					{
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    }
					else if (xhr.status == 404) 
					{
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } 
					else if (xhr.status == 500) 
					{
				    	map.set("serviceResponse","Internal Server Error [500].");
				    }
					else if (exception === 'parsererror') 
					{
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } 
					else if (exception === 'timeout') 
					{
				    	map.set("serviceResponse","Time out error.");
				    } 
					else if (exception === 'abort') 
					{
				    	map.set("serviceResponse","Ajax request aborted.");
				    } 
					else 
					{
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
				}, 
			
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

/**
 * @param serviceURL
 * @param ServiceData
 * @param loaderId
 * @param formId
 * @returns
 */
function saveFormApplication(serviceURL,ServiceData,loaderId,formId)
{
	debugger;
	var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{
		if(loaderId != "")
			$("#"+loaderId).css("display","block");
		$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				async:false,
				success : function(res) 
				{
					if(loaderId != "")
						$("#"+loaderId).css("display","none");
					
					if(res !=null)
					{
					if(res.status === 998)
						{
							 $.each(res.error_message,function(key,value)
								 {
									sessionOut(value);
								  });
						}
						if(res.status === 999)
						{
						if(res.error_message !=null)
							{
							 $.each(res.error_message,function(key,value)
							     {
							     toastr.error(value,"ERROR",{
		  								closeButton:true,
		  								autohide:false
		   	                			});
							     });
							}
							else if(res.return_message != null)
							{
								toastr.error(res.return_message,"ERROR",{
		  								closeButton:true,
		  								autohide:false
		   	                			});
							}
							else
							{
								 toastr.error(res.message_description,"ERROR",{
		  								closeButton:true,
		  								autohide:false
		   	                			});
							}
							
						}
						else if(res.status === 200)
						{
						
							if(res.error_message !=null)
							{
								 $.each(res.error_message,function(key,value)
							     {
								
								//	$("."+key).empty();
									 $("#"+formId).find("small."+key).remove();
									$('input[name='+key+']').addClass('validateStyle');
									$('select[name='+key+']').addClass('validateStyle');
									if(!$('select[name='+key+']').hasClass("select2")){
										$('select[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</small>');
									}else{
										$("#"+formId).find('select[name='+key+']').next('span').addClass(key).addClass("validateStyle");
										$("#"+formId).find('select[name='+key+']').next('span').after('<small class="error errorTag  text-danger  '+ key+ '" >'+value+'</small>');
									}
									$('textarea[name='+key+']').addClass('validateStyle');
									$('input[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									$('textarea[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									callErrorHideFunction()
								  });
								
								  map.set("serviceResponse",res);
								  map.set("serviceStatus",1);	
								}
							
						}
						else if(res.status === 1000)
						{
							map.set("serviceStatus",1);
							map.set("serviceResponse",res);
							
							toastr.success(res.message_description,"SUCCESS",{ closeButton:true,timeOut:0,autoDismiss :false});
							resetFormData(formId);
	   	                	//$("#"+formId)[0].reset();		
//							$("#"+formId).trigger("reset");
//							$("#myModal").modal('hide');
							//$('.select2').val('').trigger('change');
//							resetMaster("formId");

							return map;
						}
						else if(res.status === 0)
						{
							map.set("serviceStatus",0);
							
							toastr.error(res.return_message,"ERROR",{
	  								closeButton:true,
	  								autohide:false
	   	                			});
						}
						
					}
					else
					{
						map.set("serviceStatus",0);
						
						toastr.error("Response is null","ERROR",{
	  								closeButton:true,
	  								autohide:false
	   	                			});
					}
				},
				error : function(xhr, status, errorThrown) 
				{
				
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) 
					{
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    }
					else if (xhr.status == 404) 
					{
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } 
					else if (xhr.status == 500) 
					{
				    	map.set("serviceResponse","Internal Server Error [500].");
				    }
					else if (exception === 'parsererror') 
					{
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } 
					else if (exception === 'timeout') 
					{
				    	map.set("serviceResponse","Time out error.");
				    } 
					else if (exception === 'abort') 
					{
				    	map.set("serviceResponse","Ajax request aborted.");
				    } 
					else 
					{
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
				}, 
			
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function saveFormApplicationWithCustomToaster(serviceURL,ServiceData,loaderId,formId)
{
	debugger;
	var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{
		if(loaderId != "")
			$("#"+loaderId).css("display","block");
		$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				async:false,
				success : function(res) 
				{
					if(loaderId != "")
						$("#"+loaderId).css("display","none");
					
					if(res !=null)
					{
					if(res.status === 998)
						{
							 $.each(res.error_message,function(key,value)
								 {
									sessionOut(value);
								  });
						}
						if(res.status === 999)
						{
							if(res.return_message != null)
							{
								toastr.error(res.return_message,"ERROR",{
		  								closeButton:true,
		  								autohide:false
		   	                			});
							}
							else
							{
								 toastr.error(res.message_description,"ERROR",{
		  								closeButton:true,
		  								autohide:false
		   	                			});
							}
							
						}
						else if(res.status === 200)
						{
						
							if(res.error_message !=null)
							{
								 $.each(res.error_message,function(key,value)
							     {
								
								//	$("."+key).empty();
									 $("#"+formId).find("small."+key).remove();
									$('input[name='+key+']').addClass('validateStyle');
									$('select[name='+key+']').addClass('validateStyle');
									if(!$('select[name='+key+']').hasClass("select2")){
										$('select[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</small>');
									}else{
										$("#"+formId).find('select[name='+key+']').next('span').addClass(key).addClass("validateStyle");
										$("#"+formId).find('select[name='+key+']').next('span').after('<small class="error errorTag  text-danger  '+ key+ '" >'+value+'</small>');
									}
									$('textarea[name='+key+']').addClass('validateStyle');
									$('input[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									$('textarea[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
									callErrorHideFunction()
								  });
								
								  map.set("serviceResponse",res);
								  map.set("serviceStatus",1);	
								}
							
						}
						else if(res.status === 1000)
						{
							map.set("serviceStatus",1);
							map.set("serviceResponse",res);
							
							showSuccess(res.message_description);
							toastr.success(res.message_description,"SUCCESS",{ closeButton:true,timeOut:0,autoDismiss :false});
							resetFormData(formId);
	   	                	//$("#"+formId)[0].reset();		
//							$("#"+formId).trigger("reset");
//							$("#myModal").modal('hide');
							//$('.select2').val('').trigger('change');
//							resetMaster("formId");

							return map;
						}
						else if(res.status === 0)
						{
							map.set("serviceStatus",0);
							
							toastr.error(res.return_message,"ERROR",{
	  								closeButton:true,
	  								autohide:false
	   	                			});
						}
						
					}
					else
					{
						map.set("serviceStatus",0);
						
						toastr.error("Response is null","ERROR",{
	  								closeButton:true,
	  								autohide:false
	   	                			});
					}
				},
				error : function(xhr, status, errorThrown) 
				{
				
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) 
					{
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    }
					else if (xhr.status == 404) 
					{
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } 
					else if (xhr.status == 500) 
					{
				    	map.set("serviceResponse","Internal Server Error [500].");
				    }
					else if (exception === 'parsererror') 
					{
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } 
					else if (exception === 'timeout') 
					{
				    	map.set("serviceResponse","Time out error.");
				    } 
					else if (exception === 'abort') 
					{
				    	map.set("serviceResponse","Ajax request aborted.");
				    } 
					else 
					{
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
				}, 
			
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function callErrorHideFunction()
{
	  var cnt=0;
	$('.validateStyle').click(function(){
	var formId=$(this).closest("form").attr('id');
	  var select_id_of_select=$('#'+formId).find(this).siblings("select").prop('id');

	   if($("#" + formId + " #" + select_id_of_select).hasClass( "select2" ))
			   {
		   $.each($(this).prop('class').split(' '),function(key,value){
				if(value === select_id_of_select)
				{
					cnt=1;
				}
			}); 
			if(cnt == 1)
			{
				$("#"+formId).find('.' + select_id_of_select).siblings("select").removeClass("validateStyle");
				$("#"+formId).find('.' + select_id_of_select).removeClass("validateStyle");
				$("#"+formId).find('.' + select_id_of_select).next("small."+select_id_of_select).remove();
				$("#"+formId).find('.' + select_id_of_select).removeClass(select_id_of_select);
			}
			   }
	   else
		   {
			$("#"+formId).find('#'+this.id).removeClass("validateStyle");
			$("#"+formId).find("."+this.id).remove();
		   }
	

    });
    $('.validateStyle').change(function(){
    
     var formId=$(this).closest("form").attr('id');
  	//  var select_id_of_select=$('#'+formId).find(this).siblings("select").prop('id');
  	 var select_id_of_select='';
	  	if(this.id !=null && this.id !='')
	  	{
  		select_id_of_select =this.id;
  		 }
  		 else
  		 {
  		 select_id_of_select=$('#'+formId).find(this).siblings("select").prop('id');
  		 }
  	 // alert(select_id_of_select)
  	   if($("#" + formId + " #" + select_id_of_select).hasClass( "select2" ))
  			   {
  		   $.each($(this).prop('class').split(' '),function(key,value){
  				if(value === select_id_of_select)
  				{
  					cnt=1;
  				}
  			}); 
  			if(cnt == 1)
  			{
  				$("#"+formId).find('.' + select_id_of_select).siblings("select").removeClass("validateStyle");
  				$("#"+formId).find('.' + select_id_of_select).removeClass("validateStyle");
  				$("#"+formId).find('.' + select_id_of_select).next("small."+select_id_of_select).remove();
  				$("#"+formId).find('.' + select_id_of_select).removeClass(select_id_of_select);
  			}
  			   }
  	   else
  		   {
  			$("#"+formId).find('#'+this.id).removeClass("validateStyle");
  			$("#"+formId).find("."+this.id).remove();
  		   }
    });
    $('.validateStyle').focus(function(){
    	var formId=$(this).closest("form").attr('id');
    	  var select_id_of_select=$('#'+formId).find(this).siblings("select").prop('id');
  	   if($("#" + formId + " #" + select_id_of_select).hasClass( "select2" ))
  			   {
  		   $.each($(this).prop('class').split(' '),function(key,value){
  				if(value === select_id_of_select)
  				{
  					cnt=1;
  				}
  			}); 
  			if(cnt == 1)
  			{
  				$("#"+formId).find('.' + select_id_of_select).siblings("select").removeClass("validateStyle");
  				$("#"+formId).find('.' + select_id_of_select).removeClass("validateStyle");
  				$("#"+formId).find('.' + select_id_of_select).next("small."+select_id_of_select).remove();
  				$("#"+formId).find('.' + select_id_of_select).removeClass(select_id_of_select);
  			}
  			   }
  	   else
  		   {
  			$("#"+formId).find('#'+this.id).removeClass("validateStyle");
  			$("#"+formId).find("."+this.id).remove();
  		   }
    });
}

function ajaxCallForDownloadDoc(serviceURL,ServiceData)
{
	try
	{
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				
				success : function(res) 
				{
					
					if(res.status === 999)
					{
						$.each(res.error_message,function(key,value)
						{
								 openToastMessage("Error Message",value,"error");
						});
					}
					if(res !=null)
					{
						map.set("serviceStatus",1);
						map.set("serviceResponse",res);
						return res;
					}
				},
				async:false,
				error : function(jqXHR, status, errorThrown) 
				{
					map.set("serviceStatus",0);
					map.set("serviceResponse",jqXHR.statusText);
				}, 
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function downloadExcelPdf(tableId,fileName,data){

	$('#'+tableId).DataTable({
	    dom: 'Bfrtip',
	    buttons: [
	        {
	            extend: 'excelHtml5',
	            text: '<i class="fa fa-file-excel-o"></i>',
				className: 'excelPdfIcon',
				 title: "Panchatantra"+  '\n'  +fileName + '\n' + ' '+data,
				 customize: function(xlsx) {
   			      var sheet = xlsx.xl.worksheets['sheet1.xml'];
   			      var style = xlsx.xl['styles.xml'];
   			      $('xf', style).find("alignment[horizontal='center']").attr("wrapText", true);
   			      // set height
   			      $('row', sheet).first().attr('ht', '50').attr('customHeight', "1").attr("wrapText", "1").attr( 's', '2' )
   			
   	
   			    },
   		  
	        },
	        {
	            extend: 'pdfHtml5',
	            text: '<i class="fa fa-file-pdf-o"><i/>',
				className: 'excelPdfIcon',
	            title: "Panchatantra"+  '\r\n'  +fileName + '\r\n' + ' '+data
	        }
	    ]
	});
	
}

function downloadExcelPdfForBulkUpload(tableId,fileName,data){
	$('#'+tableId).DataTable({
	    dom: 'Bfrtip',
	    buttons: [
	        {
	            extend: 'excel',
	            title:'',
	            text: '<i class="fa fa-file-excel-o"></i>',
				className: 'excelPdfIcon',
				 customize: function(xls) {
   			      var sheet = xls.xl.worksheets['sheet1.xml'];
   			      var style = xls.xl['styles.xml'];
   			      $('xf', style).find("alignment[horizontal='center']").attr("wrapText", true);
   			      $('row', sheet).first().attr('ht', '50').attr('customHeight', "1").attr("wrapText", "1").attr( 's', '2' )
   			    },
	        }
	    ],searching: false, paging: false, info: false
	});
}

function genericAjaxCall(serviceURL,ServiceData)
{
	var map=new Map();
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	
	try
	{
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				
				success : function(res) 
				{
					
					if(res.status === 999)
					{
						$.each(res.error_message,function(key,value)
						{
								 openToastMessage("Error Message",value,"error");
						});
					}
					if(res !=null)
					{
						map.set("serviceStatus",1);
						map.set("serviceResponse",res);
						return res;
					}
				},
				async:false,
				error : function(jqXHR, status, errorThrown) 
				{
					map.set("serviceStatus",0);
					map.set("serviceResponse",jqXHR.statusText);
				}, 
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function fillDropdown(serviceURL,ServiceData,selectId)
{

var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	$("#loader").css("display","block");
	try
	{
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				async:false,
				contentType: "application/json; charset=utf-8",
				success : function(res) {
					
					$("#"+selectId).empty();
					$("#"+selectId).append($("<option/>").attr("value","").append('SELECT'));
					if(res !=null)
						{
						
						if(res.status === 999)
						{
							$("#"+selectId).empty();
							if(res.return_message != null)
							{
								toastr.error(res.return_message,"ERROR",{
		  								closeButton:true
		   	                			});
							}
							$("#loader").css("display","none");
						}
						if(res.status === 200)
						{
							$("#"+selectId).empty();
							$("#"+selectId).append($("<option/>").attr("value","").append('NO DATA FOUND'));
							$("#loader").css("display","none");
						}
						else
							{
//								var response=JSON.parse(res.responseData);
								var response=res;
								
								map.set("serviceResponse",response);
									if(response !=null && response.length > 0)
									 {
//										var form = $("#"+selectId).closest('form');
//										var form = selectId.form;
//										alert(form.attr('id'));
									
									 for(var i=0;i<response.length;i++)
										 {
											 var option1 = $("<option/>").attr("value",response[i].data_id).append(response[i].data_name)
										 	$("#"+selectId).append(option1); 
										 }
									 $("#loader").css("display","none");
									 }
									else
									{
											map.set("serviceStatus",0);
											$.each(res.error_message,function(key,value)
													 {
														 toastr.error(value,"ERROR",{
							  								closeButton:true
							   	                			});
													  });
											$("#loader").css("display","none");
										return false;
									}
									map.set("serviceStatus",1);
									$("#loader").css("display","none");
									return map;
									}
						}
				},
				async:false,
				error : function(xhr, status, errorThrown) {
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
			$("#loader").css("display","none");
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
		$("#loader").css("display","none");
	}
	$("#loader").css("display","none");
	return map;
}

// Added by Dhaval Patel
function fillDropdownWithAll(serviceURL,ServiceData,selectId)
{
var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	$("#loader").css("display","block");
	try
	{
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				async:false,
				contentType: "application/json; charset=utf-8",
				success : function(res) {
					
					$("#"+selectId).empty();
					$("#"+selectId).append($("<option/>").attr("value","").append('ALL'));
					if(res !=null)
						{
						
						if(res.status === 999)
						{
							$("#"+selectId).empty();
							if(res.return_message != null)
							{
								toastr.error(res.return_message,"ERROR",{
		  								closeButton:true
		   	                			});
							}
							$("#loader").css("display","none");
						}
						if(res.status === 200)
						{
							$("#"+selectId).empty();
							$("#"+selectId).append($("<option/>").attr("value","").append('NO DATA FOUND'));
							$("#loader").css("display","none");
						}
						else
							{
//								var response=JSON.parse(res.responseData);
								var response=res;
								
								map.set("serviceResponse",response);
									if(response !=null && response.length > 0)
									 {
//										var form = $("#"+selectId).closest('form');
//										var form = selectId.form;
//										alert(form.attr('id'));
									
									 for(var i=0;i<response.length;i++)
										 {
											 var option1 = $("<option/>").attr("value",response[i].data_id).append(response[i].data_value)
										 	$("#"+selectId).append(option1); 
										 }
									 $("#loader").css("display","none");
									 }
									else
									{
											map.set("serviceStatus",0);
											$.each(res.error_message,function(key,value)
													 {
														 toastr.error(value,"ERROR",{
							  								closeButton:true
							   	                			});
													  });
											$("#loader").css("display","none");
										return false;
									}
									map.set("serviceStatus",1);
									$("#loader").css("display","none");
									return map;
									}
						}
				},
				async:false,
				error : function(xhr, status, errorThrown) {
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
			$("#loader").css("display","none");
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
		$("#loader").css("display","none");
	}
	$("#loader").css("display","none");
	return map;
}


function fillDropdownWithLoader(serviceURL,ServiceData,selectId,loaderId)
{
	var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	$("#"+selectId).empty();
	try
	{
			$("#"+loaderId).css("display","block");
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				async:false,
				contentType: "application/json; charset=utf-8",
				success : function(res) 
				{
					$("#"+loaderId).css("display","none");
					if(res !=null)
					{
						if(res.P_STATUS === 999)
						{
							 $.each(res.error_message,function(key,value){
							 	toastr.error(value,"ERROR",{closeButton:true});
								 //openToastMessage("Error Message",value,"error");
							   });
						}
						else
						{ 
							var r=res;
							map.set("serviceResponse",res);
							if(res !=null && res.length > 0)
						 	{
								
								$("#"+selectId).append($("<option/>").attr("value","").append('select'));
								for(var i in res)
								{
									 var option1 = $("<option/>").attr("value",res[i].data_id).append(res[i].data_value)
								 	 $("#"+selectId).append(option1); 
								}
							}
							else
							{
								map.set("serviceStatus",0);
								toastr.error(r.P_SERVICE_RESPONSE,"ERROR",{closeButton:true});
								//openToastMessage("Error Message",r.P_SERVICE_RESPONSE,"error");
								return false;
							}
							map.set("serviceStatus",1);
							return map;
							}
						}
				},
				async:false,
				error : function(xhr, status, errorThrown) {
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function genericAjaxCallForJsonWithLoader(serviceURL,ServiceData,loaderId)
{
	var map=new Map();
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{

		$("#"+loaderId).css("display","block");
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				contentType: "application/json; charset=utf-8",
				success : function(res) 
				{
			
					
					$("#"+loaderId).css("display","none");
					if(res !=null)
					{
						if(res.status === 999)
						{
							
							 $.each(res.error_message,function(key,value){
								 	toastr.error(value,"ERROR",{
	  									closeButton:true
	   	                			});
								
							   });
						}
						else if(res.status === 200)
						{
							
							if(res.error_message !=null)
							{
								$.each(res.error_message,function(key,value)
								{
									 $("."+key).empty();
									 $('input[name='+key+']').addClass('validateStyle');
									 $('input[name='+key+']').after('<span class="error errorTag  text-danger '+key+'" >'+value+'</span>');
//									 openToastMessage("Error Message",value,"error");

								 });
								
								map.set("serviceResponse",res);
								map.set("serviceStatus",1);
							 }
							
						}
						else
						{
							
							var r=JSON.parse(res.responseData);
							
							map.set("serviceResponse",r);
			
							if(res.proc_status === 'FALSE')
							{
								map.set("serviceStatus",0);
								//openToastMessage("Error Message",r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"error");
								
								/*toastr.error(r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"ERROR",{
	  									closeButton:true
	   	                			});*/
	   	                			toastr.error(r[0].error_msg,"ERROR",{
	  									closeButton:true
	   	                			});
								return false;
							}
							else
							{
								map.set("serviceStatus",1);
								return map;
							}
						}
					}
				},
				async:false,
				error : function(xhr, status, errorThrown) {
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
	}
	catch(e)
	{
	
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}

function genericSaveApplication(serviceURL,ServiceData,loaderId)
{
var map=new Map();
	
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{
//		$("#"+loaderId).css("display","block");
			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				contentType: "application/json; charset=utf-8",
				success : function(res) {
//					alert(res.P_OUT[0].EMP_NAME)
//					$("#"+loaderId).css("display","none");
					if(res !=null)
						{
						if(res.status === 998)
						{
							 $.each(res.error_message,function(key,value)
								 {
									sessionOut(value);
								  });
						}
						if(res.status === 999)
						{
							 $.each(res.error_message,function(key,value){
								 openToastMessage("Error Message",value,"error");
								
							   });
						}
						else if(res.status === 200)
						{
							if(res.error_message !=null)
								{
								
										 $.each(res.error_message,function(key,value)
							     {
								
											 $("small."+key).remove();
												$('input[name='+key+']').addClass('validateStyle');
												$('select[name='+key+']').addClass('validateStyle');
												if(!$('select[name='+key+']').hasClass("select2")){
													$('select[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</small>');
												}else{
													$('select[name='+key+']').next('span').addClass(key).addClass("validateStyle");
													$('select[name='+key+']').next('span').after('<small class="error errorTag  text-danger  '+ key+ '" >'+value+'</small>');
												}
												$('textarea[name='+key+']').addClass('validateStyle');
												$('input[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
												$('textarea[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
												callErrorHideFunction()
								  });
								
										 map.set("serviceResponse",res);
										 map.set("serviceStatus",1);
								}
							
						}
						else
							{
							
//								var r=JSON.parse(res);
							var r=res;
//							var r=jQuery.parseJSON(res);
							
								map.set("serviceResponse",res);
								if(r.P_OUT_MSG === 'FALSE')
									{
									map.set("serviceStatus",0);
									openToastMessage("Error Message",r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"error");
									return false;
									}
								else
									{
									map.set("serviceStatus",1);
									return map;
									}
							
							}
							
						
						}
				},
				async:false,
				error : function(xhr, status, errorThrown) {
//					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	return map;
}


function saveFormApplicationWithMultiPart(serviceURL,ServiceData,loaderId,formId)
{
	let map = new Map();
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{
		$.ajax({
			type : "POST",
			data :  ServiceData,
			url : serviceURL,
			cache : false,
			contentType : false,
			processData : false,
			async:false,
		    beforeSend: function(){
		        $("#"+loaderId).show();
		    },
		    complete: function(){
		        $("#"+loaderId).hide();
		    },
			success : function(res) {
				if(res != null)
				{
					if(res.status === 998)
					{
						$.each(res.error_message,function(key,value)
						{
							sessionOut(value);
						});
					}
					if(res.status === 999)
					{
						map.set("serviceStatus",0);
						toastr.error(res.message_description,"ERROR",{ closeButton:true});
					}
					else if(res.status === 200)
					{
						if(res.error_message !=null)
						{
							$.each(res.error_message,function(key,value)
						    {
								$("small."+key).remove();
								$('input[name='+key+']').addClass('validateStyle');
								$('select[name='+key+']').addClass('validateStyle');
								if(!$('select[name='+key+']').hasClass("select2")){
									$('select[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</small>');
								}else{
									$('select[name='+key+']').next('span').addClass(key).addClass("validateStyle");
									$('select[name='+key+']').next('span').after('<small class="error errorTag  text-danger  '+ key+ '" >'+value+'</small>');
								}
								$('textarea[name='+key+']').addClass('validateStyle');
								$('input[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
								$('textarea[name='+key+']').after('<small class="error errorTag  text-danger '+key+'" >'+value+'</span>');
								callErrorHideFunction()
							 });
							 map.set("serviceResponse",res);
							 map.set("serviceStatus",1);
						}
					}
					else if(res.status === 1000)
					{
						map.set("serviceStatus",1);
						map.set("serviceResponse",res);
						toastr.success(res.message_description,"SUCCESS",{ closeButton:true});
						resetFormData(formId);
					}
					else if(res.status === 0)
					{
						map.set("serviceStatus",0);
						//openToastMessage("Error Message",res.return_message,"error");
						toastr.error(res.return_message,"ERROR",{ closeButton:true});
					}
				}
				else
				{
					map.set("serviceStatus",0);
					// openToastMessage("Error Message","Response is null","error");
					toastr.error("Response is null","ERROR",{ closeButton:true});
				}
				// callbackMethod(map);

			},
			error : function(xhr, status, errorThrown) {
				map.set("serviceStatus",0);
				if (xhr.status === 0) {
					map.set("serviceResponse","Not connect.\n Verify Network.");
			    } else if (xhr.status == 404) {
			    	map.set("serviceResponse","Requested page not found. [404]");
			    } else if (xhr.status == 500) {
			    	map.set("serviceResponse","Internal Server Error [500].");
			    } else if (exception === 'parsererror') {
			    	map.set("serviceResponse","Requested JSON parse failed.");
			    } else if (exception === 'timeout') {
			    	map.set("serviceResponse","Time out error.");
			    } else if (exception === 'abort') {
			    	map.set("serviceResponse","Ajax request aborted.");
			    } else {
			    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
			    }
			   // callbackMethod(map);
			}
		});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
		//callbackMethod(map);
	}
	return map;
}

function SingleDocumentUploadUsingAjax(serviceURL, ServiceData, fileId)
{
	let map = new Map();
	$("#loader").show();
	$.ajax({
		type : 'POST',
		enctype: 'multipart/form-data',
		url : serviceURL,
		data : ServiceData,
		cache : false,
		contentType : false,
		processData : false,
		async: false,
		success : function(res) {
			$('#' + fileId).val("");
			if(res != null){
			if(res.status === 998)
						{
							 $.each(res.error_message,function(key,value)
								 {
									sessionOut(value);
								  });
						}
				if(res.status === 999) {

					map.set("serviceStatus", 0);
					toastr.error(res.return_message, "ERROR", {
						closeButton:true
		    		});
				
				} else if (res.status === 1000){
					
					map.set("serviceStatus", 1);
					map.set("serviceResponse",res);
					map.set("doc", res.tableData);
					toastr.success(res.return_message,"SUCCESS",{ closeButton:true});
				
				}
			} else {
				toastr.error(res.return_message, "ERROR", {
					closeButton:true
	    		});
			}
		}
	});
	$("#loader").hide();
	return map;
}

function getAllDocuments(serviceURL, ServiceData)
{
	let map = new Map();
	$("#loader").show();
	$.ajax({
		type : 'POST',
		url : serviceURL,
		data : ServiceData,
		cache : false,
		contentType : false,
		processData : false,
		async: false,
		success : function(res) {
			map.set('allDoc', res);
		}
	});
	$("#loader").hide();
	return map;
}

function fillDropdownCommon(selectId,serviceName,serviceData)
{
	fillDropdown('../ajax/getMahadevMasterWebServices?service_name='+serviceName,serviceData,selectId);  
}

function fillDropdownCommonWithAll(selectId,serviceName,serviceData)
{
	fillDropdownWithAll('../ajax/getMahadevMasterWebServices?service_name='+serviceName,serviceData,selectId);  
}

function generatemain(tableId,reportname)
{
	let dbDate=getCurrentDbDate();
	let doc = new jsPDF( "p", "mm", "a4");
	let res = doc.autoTableHtmlToJson(document.getElementById(tableId));
	let header1 = function(data) {
		doc.setFontSize(10);
	    doc.setTextColor('#080808');
	    doc.setFontStyle('normal');
	    doc.setFontSize(30);
   		doc.text("Panchatantra"+ '\n',105, 20, 'center');
   		doc.setFontSize(15);
   		doc.text(reportname+'\n',105, 30, 'center');
  		doc.setFontSize(10);
  		doc.text("Report Date:"+' '+dbDate, 185, 47, 'right');
	};
	doc.autoTable(res.columns,res.data, {margin: {top: 50}, beforePageContent: header1});
	doc.save(reportname+"("+dbDate+").pdf");
}

function genericAjaxCallForJsonWithLoaderWithCallbackMethod(reqType,serviceURL,ServiceData,loaderId,callbackMethod)
{
	let map = new Map();
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	
	try
	{
		$.ajax({
			type : reqType,
			data :  ServiceData,
			url : serviceURL,
			contentType: "application/json; charset=utf-8",
			beforeSend: function(){
		        $("#"+loaderId).show();
		    },
		    complete: function(){
		        $("#"+loaderId).hide();
		    },
			success : function(res) 
			{
				if(res != null)
				{
					if(res.status === 999)
					{
						 $.each(res.error_message,function(key,value){
						 	toastr.error(value,"ERROR",{
								closeButton:true
                			});
						 });
					}
					else if(res.status === 200)
					{
						if(res.error_message != null)
						{
							$.each(res.error_message,function(key,value)
							{
								$("."+key).empty();
								$('input[name='+key+']').addClass('validateStyle');
								$('input[name='+key+']').after('<span class="error errorTag  text-danger '+key+'" >'+value+'</span>');
							});
							
							map.set("serviceResponse",res);
							map.set("serviceStatus",1);
						}
					}
					else
					{
						let r=res;
						map.set("serviceResponse",res);
						if(r.P_OUT_MSG === 'FALSE')
						{
							map.set("serviceStatus",0);
							toastr.error(r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"ERROR",{
  								closeButton:true,
   	                		});
						}
						else
						{
							map.set("serviceStatus",1);
						}
					}
				}
				callbackMethod(map);
			},
			error : function(xhr, status, errorThrown) 
			{
				map.set("serviceStatus",0);
				if (xhr.status === 0) {
					map.set("serviceResponse","Not connect.\n Verify Network.");
			    } else if (xhr.status == 404) {
			    	map.set("serviceResponse","Requested page not found. [404]");
			    } else if (xhr.status == 500) {
			    	map.set("serviceResponse","Internal Server Error [500].");
			    } else if (exception === 'parsererror') {
			    	map.set("serviceResponse","Requested JSON parse failed.");
			    } else if (exception === 'timeout') {
			    	map.set("serviceResponse","Time out error.");
			    } else if (exception === 'abort') {
			    	map.set("serviceResponse","Ajax request aborted.");
			    } else {
			    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
			    }
			    callbackMethod(map);
			}
		});
	}
	catch(e)
	{
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
		callbackMethod(map);
	}
}

function ictConfirm(message,callbackMethod,element)
{
	bootbox.confirm({
		title : 'HEALTH CARE GIVER',
		message: message,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
		    	callbackMethod(element);
	    	}
		}
	});
}

function ictAlert(message)
{
	bootbox.alert({
		title : '<i class="fas fa-exclamation-triangle" style="color: #c1a607;"></i> HEALTH CARE GIVER',
		message: message,
		buttons: alertButton,
		callback: function(result)
		{ 
		}
    });
}

function resetForm(formId)
{
	bootbox.confirm({
		title : 'HEALTH CARE GIVER',
		message: "Are you sure want to reset from data !!",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
	    		resetFormData(formId)
	    	}
		}
	});
}

function resetFormWithCallbackMethod(formId,callbackfunction)
{
	bootbox.confirm({
		title : 'HEALTH CARE GIVER',
		message: "Are you sure want to reset from data !!",
		buttons: confirmCancelButton,
	    callback: function(result)
	    { 
	    	if(result)
	    	{
	    		resetFormData(formId)
	    	 	callbackfunction();
	    	}
		}
	});
}

function resetFormData(formId)
{
	$('#'+formId).find('.validateStyle').removeClass("validateStyle");
	$('#'+formId).find(".select2").val('').change()
	$('#'+formId).find('.is-invalid').removeClass("is-invalid");
	$('#'+formId).find('.invalid-feedback').empty()
	$('#'+formId).find('.has-error-regex').empty();
	$('#'+formId).find('.errorTag').empty();
	$('.hideClassReset').addClass('d-none').hide();
	$('.showClassReset').removeClass('d-none').show();
	
	$('#'+formId).find('.textAreaLengthClassForSpan').html('');
	$('#'+formId).find('.validateStyle').removeClass("validateStyle");
    $("#"+formId).trigger("reset");
}

window.onerror = function (msg, url, lineNo, columnNo, error) {
   	let string;
   	let substring = "script error";
   	
   	if(msg != null && msg != ""){
		string = msg.toLowerCase();
	}
	
	
  	if(string.indexOf(substring) > -1){
    	alert('Script Error: See Browser Console for Detail');
  	} else {
    	let message = [
      		'Message: ' + msg,
	      	'URL: ' + url,
	      	'Line: ' + lineNo,
	      	'Column: ' + columnNo,
	      	'Error object: ' + JSON.stringify(error)
    	].join(' - ');

    	alert(message);
  	}

	return false;
};

function checkForCSS(strVal){
	let regexpforHTMLTag1=/(<|&#60|u003C)\s*(\S+)\s*[^>]*\s*(>|&#62|u003E)(.*)(<|&#60|U003C)\/\s*\2\s*(>|&#62|u003E)/i;
	let regexpforHTMLTag2=/(<|&#60|u003C)\s*(\S+)\s*([^>]*)\s*(>|&#62|u003E)/i;
	let regexpforXMLTag=/((<|&#60|u003C).[^(><.)]+(>|&#62|u003E))/i;
	let regexpForEqualVal=/(\s*\w+\s*)=\1/i;
	
	return !(regexpforHTMLTag2.test(strVal) || regexpforHTMLTag1.test(strVal) || regexpforXMLTag.test(strVal) 
				|| regexpForEqualVal.test(strVal) || !sqlInjection(strVal) )
}

function sqlInjection(strVal){
	let regexpforMETACHAR1=/(\%27)|(&#32)|(u0027)|(\')|(\-\-)|(\%23)|(&#35)|(u0023)|(#)/i;
	let regexpforMETACHAR2=/((\%3D)|(&#61)|(u003D)|(=))[^\n]*((\%27)|(&#32)|(u0027)|(\')|(\-\-)|(\%3B)|(&#59)|(u003B)|(;))/i;
	let regexpforORclause=/\w*((\%27)|(&#32)|(u0027)|(\'))(\s*)((\%6F)|(&#111)|(u006F)|o|(\%4F)|(&#79)|(u004F))((\%72)|(&#114)|(u0072)|r|(\%52)|(&#82)|(u0052))/i;
	let regexpforSQLwords=/((\%27)|(&#32)|(u0027)|(\'))(\s*)(union|select|insert|update|delete|drop)/i;
	let regexpforMsSQL=/exec(\s|\+)+(s|x)p\w+/i;
	
	return !(regexpforMETACHAR1.test(strVal) || regexpforMETACHAR2.test(strVal) || regexpforORclause.test(strVal)
				|| regexpforSQLwords.test(strVal) || regexpforMsSQL.test(strVal) )
}

function play_succsess_beap() {
    let audio = document.getElementById("audio");
    audio.play();
}

function showSuccess(message)
{
	play_succsess_beap();
	$('#successMessageBox').find('.success_message').text(message);
	$('#successMessageBox').modal('show');
}
function viewDocument1(file_bytes,extension){

	if(extension == ".pdf"){
		$("#viewUploadedDocumentId").append(
			$("<iframe/>").attr("height","600px").attr("width","100%").attr("alt","UMS").attr('src', 'data:application/pdf;base64,'+file_bytes)
		);
	}else{
		$("#viewUploadedDocumentId").append($('<div/>').attr("class","scroll-img").append(
			$("<img/>").attr("href","#").attr("width","100%").attr("height","400px").attr("alt","UMS").attr('src', 'data:image/jpg;base64,'+file_bytes))
		);
	}
openViewUploadedDocumentModel();
					
} 
function genericAjaxCallWithCallback(serviceURL,ServiceData,isAsync,loader,fnCallback)
{
	let loader_id="";
	var map=new Map();
	map.set("serviceStatus",0);
	map.set("serviceResponse",null);
	try
	{

			$.ajax({
				type : "POST",
				data :  ServiceData,
				url : serviceURL,
				headers: {
	                    "Authorization": "Bearer " + localStorage.getItem("jwtToken")
	                 },
				contentType: "application/json; charset=utf-8",
				async : isAsync,
				beforeSend: function() {
					loader != null ? $(loader).css("display","block") : '';
				},
				success : function(res) 
				{
					
					if(res !=null)
					{
							if(res.status === 996)
							{
								if(refreshToken())
								{
								 	 map.set("serviceStatus",1);
									 genericAjaxCallWithCallback(serviceURL,ServiceData,isAsync,loader,fnCallback);
								}
							}
							if(res.status === 998)
							{
								 $.each(res.error_message,function(key,value)
									 {
										sessionOut(value);
									  });
									  return;
							}	
							if(res.status === 999)
							{
								
								 $.each(res.error_message,function(key,value){
									 	toastr.error(value,"ERROR",{
		  									closeButton:true
		   	                			});
									
								   });
								   return;
							}
							else if(res.status === 1000)
							{
								
								var r=JSON.parse(res.responseData);
								map.set("serviceResponse",r);
								if(res.proc_status === 'FALSE')
								{
									map.set("serviceStatus",0);
									//openToastMessage("Error Message",r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"error");
									
									/*toastr.error(r.P_OUT[0].ERROR_MSG+"="+serviceURL.split("=")[1],"ERROR",{
		  									closeButton:true
		   	                			});*/
		   	                			toastr.error(r[0].error_msg,"ERROR",{
		  									closeButton:true
		   	                			});
									return;
								}
								else
								{
									map.set("serviceStatus",1);
								}
								if(fnCallback != null){
									fnCallback(map);
								}
							}
							else
							{
								$.each(res.error_message,function(key,value){
									toastr.error(value,"ERROR",{
										closeButton:true
									});
								});
								return;
							}
					}
				},
				complete: function() {
					loader != null ? $(loader).css("display","none") : '';
				},
				error : function(xhr, status, errorThrown) {
					$("#"+loaderId).css("display","none");
					map.set("serviceStatus",0);
					if (xhr.status === 0) {
						map.set("serviceResponse","Not connect.\n Verify Network.");
				    } else if (xhr.status == 404) {
				    	map.set("serviceResponse","Requested page not found. [404]");
				    } else if (xhr.status == 500) {
				    	map.set("serviceResponse","Internal Server Error [500].");
				    } else if (exception === 'parsererror') {
				    	map.set("serviceResponse","Requested JSON parse failed.");
				    } else if (exception === 'timeout') {
				    	map.set("serviceResponse","Time out error.");
				    } else if (exception === 'abort') {
				    	map.set("serviceResponse","Ajax request aborted.");
				    } else {
				    	map.set("serviceResponse","Uncaught Error.\n'" + xhr.responseText);
				    }
//					map.set("serviceResponse",jqXHR.statusText);
					
					
				}, 
			
			});
	}
	catch(e)
	{
	
		map.set("serviceStatus",0);
		map.set("serviceResponse",e.message);
	}
	if(fnCallback == null){
		return map;
	}
}