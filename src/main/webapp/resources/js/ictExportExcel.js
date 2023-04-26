/**
 * ExcellentExport.
 * A client side Javascript export to Excel.
 *
 * @author: Kuldipsinh Dabhi
 *
*/


var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
var fromCharCode = String.fromCharCode;
var INVALID_CHARACTER_ERR = ( function() {
        // fabricate a suitable error object
        try {
            document.createElement('$');
        } catch (error) {
            return error;
        }
    }());

// encoder
window.btoa || (window.btoa = function(string) {
	
    var a, b, b1, b2, b3, b4, c, i = 0, len = string.length, max = Math.max, result = '';

    while (i < len) {
        a = string.charCodeAt(i++) || 0;
        b = string.charCodeAt(i++) || 0;
        c = string.charCodeAt(i++) || 0;

        if (max(a, b, c) > 0xFF) {
            throw INVALID_CHARACTER_ERR;
        }

        b1 = (a >> 2) & 0x3F;
        b2 = ((a & 0x3) << 4) | ((b >> 4) & 0xF);
        b3 = ((b & 0xF) << 2) | ((c >> 6) & 0x3);
        b4 = c & 0x3F;

        if (!b) {
            b3 = b4 = 64;
        } else if (!c) {
            b4 = 64;
        }
        result += characters.charAt(b1) + characters.charAt(b2) + characters.charAt(b3) + characters.charAt(b4);
    }
    return result;
});

// decoder
window.atob || (window.atob = function(string) {
	
    string = string.replace(/=+$/, '');
    var a, b, b1, b2, b3, b4, c, i = 0, len = string.length, chars = [];

    if (len % 4 === 1)
        throw INVALID_CHARACTER_ERR;

    while (i < len) {
        b1 = characters.indexOf(string.charAt(i++));
        b2 = characters.indexOf(string.charAt(i++));
        b3 = characters.indexOf(string.charAt(i++));
        b4 = characters.indexOf(string.charAt(i++));

        a = ((b1 & 0x3F) << 2) | ((b2 >> 4) & 0x3);
        b = ((b2 & 0xF) << 4) | ((b3 >> 2) & 0xF);
        c = ((b3 & 0x3) << 6) | (b4 & 0x3F);

        chars.push(fromCharCode(a));
        b && chars.push(fromCharCode(b));
        c && chars.push(fromCharCode(c));
    }
    return chars.join('');
});


ExcellentExport = (function() {
	
    var version = "1.3";
    var uri = {excel: 'data:application/vnd.ms-excel;base64,', csv: 'data:application/csv;base64,'};
   /* var template = {excel: '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'};
    */
    var template = {excel: '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><div><font></font>{table}</div></html>'};
    var base64 = function(s) {
        return window.btoa(unescape(encodeURIComponent(s)));
    };
    var format = function(s, c) {
    	
        return s.replace(/{(\w+)}/g, function(m, p) {
            return c[p];
        });
    };

    var get = function(element) {
    	
        if (!element.nodeType) {
        	
            return document.getElementById(element);
          
        }
        return element;
    };

    var fixCSVField = function(value) {
    	
    	
        var fixedValue = value;
        var addQuotes = (value.indexOf(',') !== -1) || (value.indexOf('\r') !== -1) || (value.indexOf('\n') !== -1);
        var replaceDoubleQuotes = (value.indexOf('"') !== -1);

        if (replaceDoubleQuotes) {
            fixedValue = fixedValue.replace(/"/g, '""');
        }
        if (addQuotes || replaceDoubleQuotes) {
            fixedValue = '"' + fixedValue + '"';
        }
        return fixedValue;
    };

    var tableToCSV = function(table) {
        var data = "";
        for (var i = 0, row; row = table.rows[i]; i++) {
            for (var j = 0, col; col = row.cells[j]; j++) {
                data = data + (j ? ',' : '') + fixCSVField(col.innerHTML);
            }
            data = data + "\r\n";
           
        }
        return data;
    };

    var ee = {
        /** @expose */
    	   	
      /*  excelWithHeader: function(anchor, table, name, div,HeaderDiv) 
        {
        	
        	
        	if($('#'+table+' > tbody > tr').length>0)
    		{
        		 
        		var dataTableFlag=false;
            	// check table is data table then remove data table
            	if($.fn.DataTable.isDataTable( '#'+table )){
            		$('#'+table).DataTable().destroy();
            		dataTableFlag=true;
            		
            	}
//---------------------------------------------------------------------------------kuldipsinh----------------------------------
            
            	
            	//create clone of orignal div and header div
			var cloneDiv=jQuery("#"+div).clone(true);
			var cloneHeaderDiv=null;
			var cloneHeaderDivId=null;
			
			
			
			//set new id to clone div so we can use and igone the confit
             cloneDiv[0].setAttribute('id','exportExcelPdfDiv');
            
             
             var cloneDivId=cloneDiv[0].getAttribute('id');
            
             
             //append clone div after orignal div
              $("#"+div).after(cloneDiv[0]);
          
             
             //set style to display none so user can not see a screen side 
              $("#"+cloneDivId).css('display','none');
              
              //assign id to table using class name in clone table which are our main table
             $("#"+cloneDivId).find('.exportExcelTableClass').attr('id','exportExcelPdfDivTable');
             
             //remove last column if that column contain action type like edit,save etc remove button column
           //  $('#'+exportExcelPdfDivTable.id+' tr').find('th:last, td:last').remove();
              $('#'+exportExcelPdfDivTable.id+' tr').find('.removeExcelColumn').remove();
             
             //if header div available 
             if(HeaderDiv !=null && HeaderDiv != '')
			{
			cloneHeaderDiv=jQuery("#"+HeaderDiv).clone(true);
			cloneHeaderDiv[0].setAttribute('id','exportExcelPdfHeaderDiv');
			cloneHeaderDivId=cloneHeaderDiv[0].getAttribute('id');
			$("#"+cloneDivId).find('#'+exportExcelPdfDivTable.id).before(cloneHeaderDiv[0].innerHTML);
			}
             
            
            
              // console.log( cloneDiv[0])
              
            
         
         
            	 // hide export to excel and pdf div 
            	 $(".exportReportTitleDiv").removeClass("d-none");
            	 $(".exportExcelPdfDiv").addClass("d-none");
            	
        		// div = get($("#exportDivForExcel").prop('id'));
        		
        		//assign new clone div for generate excel
        		div= cloneDiv[0];
        		$("#"+cloneDivId).remove();
        		
 //------------------------------------------------------------------------------------kuldipsinh--------------------------------------------------
        		
                 var ctx = {worksheet: name || 'Worksheet', table: div.innerHTML};
               
             
                 var hrefvalue = uri.excel + base64(format(template.excel, ctx));
                 
                 anchor.href = hrefvalue;
                 // Return true to allow the link to work
                 
                 if(dataTableFlag){
        			 $('#'+table).DataTable();
        		 }
        		 
        		 $(".exportReportTitleDiv").addClass("d-none");
        		 $(".exportExcelPdfDiv").removeClass("d-none");
        		 
                 return true;
                 
            }
        	else
        	{
        		alert("No Record Found");
        		return false;
        	}
        },*/
    	
    	
        excel: function(anchor, table, name, div,HeaderDiv) 
        {
        	
        	    	
        	if($('#'+table+' > tbody > tr').length>0)
    		{
        		 
        		var dataTableFlag=false;
            	// check table is data table then remove data table
            	if($.fn.DataTable.isDataTable( '#'+table )){
            		$('#'+table).DataTable().destroy();
            		dataTableFlag=true;
            		
            	}
//---------------------------------------------------------------------------------kuldipsinh----------------------------------
            
            	
            	//create clone of orignal div and header div
			var cloneDiv=jQuery("#"+div).clone(true);
			var cloneHeaderDiv=null;
			var cloneHeaderDivId=null;
			
			
			
			//set new id to clone div so we can use and igone the confit
             cloneDiv[0].setAttribute('id','exportExcelPdfDiv');
            
             
             var cloneDivId=cloneDiv[0].getAttribute('id');
            
             
             //append clone div after orignal div
              $("#"+div).after(cloneDiv[0]);
          
             
             //set style to display none so user can not see a screen side 
              $("#"+cloneDivId).css('display','none');
              
              //assign id to table using class name in clone table which are our main table
             $("#"+cloneDivId).find('.exportExcelTableClass').attr('id','exportExcelPdfDivTable');
             
             //remove last column if that column contain action type like edit,save etc remove button column
           //  $('#'+exportExcelPdfDivTable.id+' tr').find('th:last, td:last').remove();
              $('#'+table+' tr').find('.removeExcelColumn').remove();
             
             //if header div available 
             if(HeaderDiv !=null && HeaderDiv != '')
			{
			cloneHeaderDiv=jQuery("#"+HeaderDiv).clone(true);
			cloneHeaderDiv[0].setAttribute('id','exportExcelPdfHeaderDiv');
			cloneHeaderDivId=cloneHeaderDiv[0].getAttribute('id');
			$("#"+cloneDivId).find('#'+exportExcelPdfDivTable.id).before(cloneHeaderDiv[0].innerHTML);
			}
             
            
            
              // console.log( cloneDiv[0])
              
            
         
         
            	 // hide export to excel and pdf div 
            	 $(".exportReportTitleDiv").removeClass("d-none");
            	 $(".exportExcelPdfDiv").addClass("d-none");
            	
        		// div = get($("#exportDivForExcel").prop('id'));
        		
        		//assign new clone div for generate excel
        		div= cloneDiv[0];
        		$("#"+cloneDivId).remove();
        		
 //------------------------------------------------------------------------------------kuldipsinh--------------------------------------------------
        		
                 var ctx = {worksheet: name || 'Worksheet', table: div.innerHTML};
               
             
                 var hrefvalue = uri.excel + base64(format(template.excel, ctx));
                 
                 anchor.href = hrefvalue;
                 // Return true to allow the link to work
                 
                 if(dataTableFlag){
        			 $('#'+table).DataTable();
        		 }
        		 
        		 $(".exportReportTitleDiv").addClass("d-none");
        		 $(".exportExcelPdfDiv").removeClass("d-none");
        		 
                 return true;
                 
            }
        	else
        	{
        		alert("No Record Found");
        		return false;
        	}
        },
        /** @expose */
        csv: function(anchor, table) {
            table = get(table);
            var csvData = tableToCSV(table);
            var hrefvalue = uri.csv + base64(csvData);
            anchor.href = hrefvalue;
            return true;
        }
    };

    return ee;
}());
