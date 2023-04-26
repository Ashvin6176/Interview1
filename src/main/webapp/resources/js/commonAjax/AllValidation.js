// Start By :: Payal Patanvadiya
	function checkFromDateAndToDateCommonValidation(fromDateId,toDateId){
		var flag = true;
		var fromDatePara =$("#"+fromDateId).val();
		var toDatePara =$("#"+toDateId).val();
		if(fromDatePara != null && fromDatePara != "" && toDatePara != null && toDatePara != "" ){
			var fromDateTemp = fromDatePara.split("/");
			var toDateTemp = toDatePara.split("/");
			// month is 0-based, that's why we need fromDateTemp[1] - 1
			var fromDate = new Date(+fromDateTemp[2], fromDateTemp[1] - 1, +fromDateTemp[0]); 
			var toDate = new Date(+toDateTemp[2], toDateTemp[1] - 1, +toDateTemp[0]);
			if(fromDate > toDate ){
				toastr.error("From Date cannot be greater than To Date..!",
						"ERROR", {
							closeButton : true
						});
				
				$("#"+toDateId).val("");
				flag= false;
			}
		}
		return flag;
	}
	
	function checkPastdate(form) {
		// the date format should be dd/mm/yyyy don't change date format this
		// function
		var chkDate = form.value;
		var dateTemp = chkDate.split("/");
		var myDate = new Date( dateTemp[2]+"-"+dateTemp[1]+"-"+dateTemp[0]);
		myDate.setHours(0,0,0,0);
		var today = new Date();
		today.setHours(0,0,0,0)
		if (myDate < today) {
		
			
			toastr.error("You Can't Enter Past Date",
					"ERROR", {
						closeButton : true
					});
			form.value = "";
			form.focus();
			return false;
		} else {
		
			return true;
		}
	}
	
	function checkFutureDateMonFrmt(form) 
{
	var fdate=form.value;
	var monthfield = fdate.split("-")[1];	
	var dayfield = fdate.split("-")[0];
	var yearfield = fdate.split("-")[2];
	var tmpdate = monthfield + "/" +  dayfield + "/" + yearfield;
	var myDate = new Date(tmpdate);
	var today = new Date();

	if (myDate > today) {
		alert("You cannot enter future date!");
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}

}
function checkPastDateMonFrmt(form) 
{
	var fdate=form.value;
	var monthfield = fdate.split("-")[1];	
	var dayfield = fdate.split("-")[0];
	var yearfield = fdate.split("-")[2];
	var tmpdate = monthfield + "/" +  dayfield + "/" + yearfield;
	var myDate = new Date(tmpdate);
	var today = new Date();

	if (myDate < today) {
		alert("You cannot enter past date!");
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}

}
	// End By :: Payal Patanvadiya


// CHANGES BY BAGHEL MITKUMAR FOR REMOVE VALIDATION ON HIDE FIELDS
function formValidate(divName) {

	var flag = true;
	/* for textbox , radio button , password */
	var dataInput = $('#'+ divName +' input[type="text"].ValidateInput, #'+ divName +' input[type="number"].ValidateInput, #'+ divName +' input[type="email"].ValidateInput, #'+ divName +' input[type="file"].ValidateInput');
	for (var i = 0; i < dataInput.length; i++) 
	{
		if ($.trim(dataInput[i].value) == '' && dataInput[i].offsetParent != null)
		{
			$("." + dataInput[i].id).empty();
			$("#" + divName + " #" + dataInput[i].id).addClass("validateStyle");
			$("#" + divName + " #" + dataInput[i].id).after('<small class="error errorTag  text-danger '+ dataInput[i].id+ '" >You Can \'t Leave this Empty</small>');
			flag = false;
		}
		if (dataInput[i].offsetParent == null) 
		{
			$("." + dataInput[i].id).empty();
			$("#" + divName + " #" + dataInput[i].id).removeClass("validateStyle");
		}
	}
	//input type password where view icon is availbel
	var dataInputPwd = $('#'+ divName+  ' input[type="password"].ValidateInput');
	for (var i = 0; i < dataInputPwd.length; i++) 
	{
		if ($.trim(dataInputPwd[i].value) == '' && dataInputPwd[i].offsetParent != null)
		{
			$("." + dataInputPwd[i].id).empty();
			$("#" + divName + " #" + dataInputPwd[i].id).addClass("validateStyle");
			if($("#" + divName + " #" + dataInputPwd[i].id).next().is('div'))
			{
			$("#" + divName + " #" + dataInputPwd[i].id).next("div").after('<small class="error errorTag error-textbuttoom text-danger '+ dataInputPwd[i].id+ '" >You Can \'t Leave this Empty</small>');
			}
			else if($("#" + divName + " #" + dataInputPwd[i].id).next().is('a'))
			{
			$("#" + divName + " #" + dataInputPwd[i].id).next("a").after('<small class="error errorTag  text-danger '+ dataInputPwd[i].id+ '" >You Can \'t Leave this Empty</small>');
			}
			else
			{
			
			$("#" + divName + " #" + dataInputPwd[i].id).after('<small class="error errorTag error-textbuttoom text-danger '+ dataInputPwd[i].id+ '" >You Can \'t Leave this Empty</small>');
			}
			flag = false;
		}
		if (dataInputPwd[i].offsetParent == null) 
		{
			$("." + dataInputPwd[i].id).empty();
			$("#" + divName + " #" + dataInputPwd[i].id).removeClass("validateStyle");
		}
	}
	/* for radio button */
	var dataRadio = $('#' + divName + ' input[type="radio"].ValidateInput');
	for (var i = 0; i < dataRadio.length; i++) 
	{
		var radioGroupName = $("input[type='radio']#" + dataRadio[i].id)[0].attributes['name'].textContent;
		if (!$("input[name='" + radioGroupName + "']").is(":checked")) 
		{
			$("input[name='" + radioGroupName + "']").addClass("validateStyle");
			flag = false;
		}
	}
	/* for textarea */
	var dataTextArea = $('#' + divName + ' textarea.ValidateInput');
	for (var i = 0; i < dataTextArea.length; i++)
	{
		if ($.trim(dataTextArea[i].value) == ''	&& dataTextArea[i].offsetParent != null) {
			$("." + dataTextArea[i].id).empty();
			$("#" + divName + " #" + dataTextArea[i].id).addClass("validateStyle");
			$("#" + divName + " #" + dataTextArea[i].id).after('<small class="error errorTag  text-danger '+ dataTextArea[i].id+ '" >You Can \'t Leave this Empty</small>');
			flag = false;
		}
		if (dataTextArea[i].offsetParent == null) 
		{
			$("." + dataTextArea[i].id).empty();
			$("#" + divName + " #" + dataTextArea[i].id).removeClass("validateStyle");
		}
	}
	/* for select tag */
	var dataSelect = $('#' + divName + ' select.ValidateInput');
	for (var i = 0; i < dataSelect.length; i++) 
	{
		if ((dataSelect[i].value == '' && dataSelect[i].offsetParent != null) || (dataSelect[i].value == '-1' && dataSelect[i].offsetParent != null)) 
		{
			
			
			if($("#" + divName + " #" + dataSelect[i].id).hasClass( "select2" ))
			{
			$("." + dataSelect[i].id).next('small.errorTag').remove();
			$("#" + divName + " #" + dataSelect[i].id).next('span')
			$("#" + divName + " #" + dataSelect[i].id).addClass("validateStyle");
			$("#" + divName + " #" + dataSelect[i].id).next('span').addClass(dataSelect[i].id).addClass("validateStyle");
			$("#" + divName + " #" + dataSelect[i].id).next('span').after('<small class="error errorTag  text-danger  '+ dataSelect[i].id+ '" >You Can \'t Leave this Empty</small>');
			}
			else
			{
			$("." + dataSelect[i].id).empty();
			$("#" + divName + " #" + dataSelect[i].id).after('<small class="error errorTag  text-danger '+ dataSelect[i].id+ '" >You Can \'t Leave this Empty</small>');
			$("#" + divName + " #" + dataSelect[i].id).addClass("validateStyle");
			
			}
			
			
			if (dataSelect[i].className.includes("select2-hidden-accessible")) 
			{
				if (dataSelect[i].attributes.name == dataSelect[i].nextElementSibling.previousElementSibling.attributes.name) 
				{
					$(dataSelect[i].nextElementSibling).addClass("validateStyle");
				}
			}
			flag = false;
		}
		else 
		{
			$("#" + divName + " #" + dataSelect[i].id).removeClass("validateStyle");
			$(dataSelect[i].nextElementSibling).removeClass("validateStyle");
		}
		if (dataSelect[i].offsetParent == null) 
		{
			$("." + dataSelect[i].id).empty();
			$("#" + divName + " #" + dataSelect[i].id).removeClass("validateStyle");
		}
	}
	
	
	
	
	/* for hidden for file only */
	var dataFileInput = $('#' + divName + ' input[type="hidden"].ValidateInput');
	for (var i = 0; i < dataFileInput.length; i++) 
	{
		if ($.trim(dataFileInput[i].value) == '') 
		{
			$("." + dataFileInput[i].id + "File").empty();
			$("#" + divName + " #" + dataFileInput[i].id + "File").addClass("validateStyle");
			flag = false;
		}
	}
	
	
	
	$('#' + divName + ' .validateStyle').click(function() {
		   console.log($(this).prop('class'))
		   var cnt=0;
		   var select_id_of_select=$(this).siblings("select").prop('id');
		   if($("#" + divName + " #" + select_id_of_select).hasClass( "select2" ))
				   {
				   $.each($(this).prop('class').split(' '),function(key,value){
						if(value === select_id_of_select)
						{
							cnt=1;
						}
					}); 
					if(cnt == 1)
					{
						$("#"+divName).find('.' + select_id_of_select).siblings("select").removeClass("validateStyle");
						$("#"+divName).find('.' + select_id_of_select).removeClass("validateStyle");
						$("#"+divName).find('.' + select_id_of_select).next("small."+select_id_of_select).remove();
						$("#"+divName).find('.' + select_id_of_select).removeClass(select_id_of_select);
					}
				/*else
				{
				
					$('#' + this.id).removeClass("validateStyle");
					$("."+this.id).remove();
				}*/
			
		}
		else
		{
			$("#"+divName).find('#' + this.id).removeClass("validateStyle");
			
			$("#"+divName).find("."+this.id).remove();
		}
	});
	$('#' + divName + '.validateStyle').change(function() {
		console.log(this)
			$("#"+divName).find('#' + this.id).removeClass("validateStyle");
		$("#"+divName).find("." + this.id).empty();
	});
	$('#' + divName + '.validateStyle').focus(function() {
		console.log(this)
			$("#"+divName).find('#' + this.id).removeClass("validateStyle");
		$("#"+divName).find("." + this.id).empty();
	});
	if ($('#' + divName).find(".is-invalid").length > 0 || flag == false) {
		flag = false;
	} else {
		flag = true;
	}
	return flag;
}

function checkfuturedate(form) {
	// the date format should be dd/mm/yyyy don't change date format this
	// function
	var chkDate = form.value;
	var dateTemp = chkDate.split("/");
	var myDate = new Date(+dateTemp[2], dateTemp[1] - 1, +dateTemp[0]);
	var today = new Date();
	if (myDate > today) {
//		alert("You cannot enter future date.");
		toastr.error("You Can,t Enter Future Date",
				"ERROR", {
					closeButton : true
				});
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}
}


function onlynumbers(form) {
	if (isNaN(form.value)) {
		alert('Please Enter a Number.');
		form.focus();
		form.value = "";
		return false;
	} else
		return true;
}

var a = [ '', 'one ', 'two ', 'three ', 'four ', 'five ', 'six ', 'seven ',
		'eight ', 'nine ', 'ten ', 'eleven ', 'twelve ', 'thirteen ',
		'fourteen ', 'fifteen ', 'sixteen ', 'seventeen ', 'eighteen ',
		'nineteen ' ];
var b = [ '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy',
		'eighty', 'ninety' ];

function convertAmountInWords(num) {
	if ((num = num.toString()).length > 9)
		return 'overflow';
	n = ('000000000' + num).substr(-9).match(
			/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
	if (!n)
		return;
	var str = '';
	str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]])
			+ 'crore ' : '';
	str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]])
			+ 'lakh ' : '';
	str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]])
			+ 'thousand ' : '';
	str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]])
			+ 'hundred ' : '';
	str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
			+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
	return str;
}

// end vivek

// start added by dhaval patel

function toUppperCaseText(data) {
	if ($.trim($('#' + data.id).val()) != null
			&& $.trim($('#' + data.id).val()) != "") {
		$('#' + data.id).val($.trim($('#' + data.id).val().toUpperCase()));
	}
}

function validateChequeNo(form) {

	var inputvalues = form.value;
	var reg = /[0-9]{6}$/;
	if (inputvalues.match(reg)) {
		return true;
	} else {
		$("#" + form.id).val("");
		alert("You entered invalid cheque No");
		return false;
	}

}
function validateIFSCCode(form) {
	var inputvalues = form.value;
	var reg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;
	if (inputvalues.match(reg)) {
		return true;
	} else {
		$("#" + form.id).val("");
		alert("You entered invalid IFSC code");
		return false;
	}
}

// end of added by dhaval patel

/**********************BAGHEL MITKUMAR**********************************************************/

function validateRegex(element) {
	let a = element.className;
	if (a.includes("OnlyNumberRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[0-9]*$:Please Enter Only Number');
	}
	if (a.includes("OnlyNumberWithPointRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[0-9.]*$:Please Enter Only Number');
	} else if (a.includes("EmailRegexClass")) {
		bootstrapValidate('#' + element.id, 'email:Please Enter Valid Email');
	} else if (a.includes("MobileNumberRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([6-9]{1}[0-9]{9})?$:Please Enter Valid Mobile Number[Start With 6-9]');
	} else if (a.includes("SimpleTextRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z\t]*$:Please Enter Only Text With No Space');
	} else if (a.includes("SimpleTextWithSpaceRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z ]*$:Please Enter Only Text');
	} else if (a.includes("SimpleTextWithCoomaRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z,]*$:Please Enter Valid Text(Only Cooma Allowed)');
	} else if (a.includes("SimpleTextWithUnderScoreAndNumberRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z0-9_ ]*$:Please Enter Valid Text(Only UnderScore Allowed)');
	} else if (a.includes("SimpleTextKannadaAndEnglishRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z \u00A1-\uFFFF]*$:Please Enter Valid  Kannada Text');
	} else if (a.includes("SimpleTextWithSpaceKannada")) {
		bootstrapValidate('#' + element.id,
				'regex:^[\u00A1-\uFFFF ]*$:Please Enter Valid  Kannada Text');
	} else if (a.includes("SimpleTextKannadaCoomaRegexClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:^[a-zA-Z \u00A1-\uFFFF,]*$:Please Enter Valid Kannada Text(Only Cooma Allowed)');
	} else if (a.includes("PercantageRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[0-9][0-9]\.[0-9][0-9]$:Please enter valid ');// ^[0-9]{1,2}+\.[0-9][0-9]$
	} else if (a.includes("GradeRegexClass")) {
		bootstrapValidate('#' + element.id, 'regex::Please enter valid value');
	} else if (a.includes("PayScaleRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[0-9]{1,6}(-)[0-9]{1,6}?$:Please Enter Valid PayScale');
	} else if (a.includes("AlphaNumericRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z0-9 ]*$:Please Enter Alpha Numeric Value');
	} else if (a.includes("AlphaNumericWithoutSpaceRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-zA-Z0-9]*$:Please Enter Valid Value');
	} else if (a.includes("YearRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([2][0-9]{3}[-][0-9]{4})*$:Please Enter Valid Year');
	} else if (a.includes("PassingYearRegClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([0-9]{4})*$:Please enter valid passing year');
	} else if (a.includes("PincodeRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([0-9]{6})?$:Please Enter Valid Pincode');
	} else if (a.includes("NumberSizeOneRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([1-9]{1})?$:Please Enter Only One Digit');
	} else if (a.includes("NumberSizeThreeRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([1-9]{1,3})?$:Please Enter Only Three Digit');
	} else if (a.includes("NumberSizeFiveRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([1-9]{1,5})?$:Please Enter Only Five Digit');
	} else if (a.includes("TextareaRegexWithoutSpecialCharacterClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[a-z(?,-.) A-Z(?,-.) 0-9(?,-.)]*$:Please Enter Valid Text');
	} else if (a.includes("TextareaRegexWithSpecialCharacterClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:^[a-z(?,-.) A-Z(?,-.) 0-9(?,-.) ?*!@#$%^&*()_;:]*$:Please Enter Valid Text');
	} else if (a.includes("TextareaRegexWithSpecialCharacterInKannadaClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:^[\u00A1-\uFFFF 0-9(?,-.) ?*!@#$%^&*()_;:]*$:Please Enter Valid Text');
	} else if (a.includes("AgeRegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([4-9]([0-9]))?$:Please Enter Valid Age');
	} else if (a.includes("0to100RegexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^([1-9][0-9]?)?$:Please Enter Valid Age');
	} else if (a.includes("PdfFileExtentionRegexClass")) {
		var FileName = element.value;
		var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1)
				.toLowerCase();
		if (element.files.length > 0) {
			var FileSize = element.files[0].size;
			if (FileExt == "pdf" && FileSize < 5242880) {
				$('.invalid-feedback').empty();
				return true;
			} else {
				var error = "Please make sure your file is in pdf format and less than 5 MB.";
				bootstrapValidate('#' + element.id,
						'regex:^(([a-zA-Z0-9])*([.])([pdf])*)?$:Please Enter Valid File');
				alert(error);
				$("#" + element.id).val("");
				return false;
			}
		}
	} else if (a.includes("FloatValueRegexClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:^([0-9]{2}(\.))?([0-9]{2})?$:Please Enter Valid Value After Point Enter Two Digit');
	} else if (a.includes("DateFormatRegexClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:b(?:Jan?|?:Feb?|?:Mar?|?:Apr?|?:May?|?:Jun?|?:Jul?|?:Aug?|?:Sep?|?:Oct?|?:Nov?|?:Dec?) [0-9]{1,2}[,] (?:19[7-9]\d|2\d{3})(?=\D|$):Please Enter Valid Date');
	} else if (a.includes("TestingClass")) {
		bootstrapValidate(
				'#' + element.id,
				'regex:^(0?[1-9]\/\[12][0-9]|3[01])[\/\-]([Jan][\/]Aug])*[\/\-]\d{4}$:Please Enter Valid Age')
	} else if (a.includes("AadharNoregexClass")) {
		bootstrapValidate('#' + element.id,
				'regex:^[1-9]{12}$:Please Enter Valid Aadhar No')
	} else if(a.includes("PasswordregxClass")){
		bootstrapValidate('#' + element.id,
		        'regex:^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$:Please Enter Valid Password');
	} else if (a.includes("AlphaNumericWithSpaceKannada")) {
		bootstrapValidate('#' + element.id,
		'regex:^[\u00A1-\uFFFF0-9 ]*$:Please Enter Valid  Kannada Text');
	}	
	else if (a.includes("SimplePasswordRegexClass")) {
		bootstrapValidate('#' + element.id,
		'regex:^(([a-zA-Z0-9]).{7})*$:Please Enter Valid  Password(8 Digit password Special Charcter Not Allowed)');
	}	
	
	
}

function HideError(element) {
	var name = $("#" + element.id).attr("name");
	$('#' + element.id).removeClass("validateStyle");
	$("span" + "." + name).remove();
}

function onlyNumber(form) {
	if (form.value != null && form.value != "") {

		// var numbers = /^[-+]?[0-9]+$/;
		// if(!element.value.match(numbers))
		// {
		// alert("Only numbers are allowed");
		// form.value="";
		// element.empty();
		// form.focus();

		if (isNaN(form.value)) {
			alert('Only numbers are allowed');
			form.focus();
			form.value = "";
			return false;
		} else
			return true;
	}

}

function resetMaster(formId) {
	$(':input', '#' + formId).not(':button, :submit, :reset, :hidden').val('')
			.prop('checked', false).prop('selected', false)
	// .removeClass("validateStyle");
	$.each($('.ValidateInput'), function() {
		$('#' + this.id).removeClass("validateStyle");
		$("." + this.id).empty();
	});

	$.each($('.is-valid'), function() {
		$('#' + this.id).removeClass("is-valid");
		$("." + this.id).empty();
	});
}

function validateEmail(txtinput) {
	var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([A-Za-z]{2,6}(?:\.[a-z]{2})?)$/;
	{
		if (!txtinput.value == "") {
			if (txtinput.value.match(ck_email)) {
				return true;
			} else {
				txtinput.value = "";
				txtinput.focus();
				bootbox.confirm({
					title : "Panchatantra",
					message : "Please enter valid Email !",
					callback : function(result) {
						$('#' + txtinput.id).val('');
					}
				});
				return false;
			}
		}
	}
}
function checkOnlyNumber(element) {
	var number = /^([0-9][0-9]?$|^100)?$/;
	{
		if (!element.value == "") {
			if (element.value.match(number)) {
				return true;
			} else {
				element.value = "";
				element.focus();
				bootbox.confirm({
					title : "Panchatantra",
					message : "Please enter valid range (0 to 100) of mark !",
					callback : function(result) {
						$('#' + element.id).val('');
					}
				});
				return false;
			}
		}
	}
}

/**
 * ********************BAGHEL
 * MITKUMAR*********************************************************
 */

// LALJI LILAPARA :: START
function getFormatDate(javaDate) {
	if (javaDate != null) {
		var monthfield = javaDate.split("-")[1];
		var dayfield = javaDate.split("-")[2];
		var yearfield = javaDate.split("-")[0];

		dayfield = dayfield.substring(0, 2);

		var fDt = dayfield + "/" + monthfield + "/" + yearfield;

		return fDt;
	}
}

function setFormatDate(javaDate) {
	if (javaDate != null) {
		var monthfield = javaDate.split("-")[1];
		var dayfield = javaDate.split("-")[2];
		var yearfield = javaDate.split("-")[0];

		dayfield = dayfield.substring(0, 2);

		var fDt = yearfield + "-" + monthfield + "-" + dayfield;

		return fDt;
	}
}

// LALJI LILAPARA :: END

function resetMaster(formId) {
	$(':input', '#' + formId).not(':button, :submit, :reset, :hidden').val('')
			.prop('checked', false).prop('selected', false)
	// .removeClass("validateStyle");
	$.each($('.ValidateInput'), function() {
		$('#' + this.id).removeClass("validateStyle");
		$("." + this.id).empty();
	});

	$.each($('.is-valid'), function() {
		$('#' + this.id).removeClass("is-valid");
		$("." + this.id).empty();
	});
}

function hideError(elementId) {
	document.getElementById(elementId.id).style.border = "";
	document.getElementById(elementId.id).style.background = "";
	$("#" + elementId.id).removeClass('validateStyle');
}

function checkFileUploadPDfImage100KB(file) {

	var FileName = file.value;
	var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1);
	var FileSize = file.files[0].size;
	var size = (FileSize / 1024).toFixed(2);

	if ((FileExt == "pdf" || FileExt == "PDF" || FileExt == "png"
			|| FileExt == "PNG" || FileExt == "jpg" || FileExt == "JPG"
			|| FileExt == "jpeg" || FileExt == "JPEG")
			&& size < 100) {
		return true;
	} else {
		var error = "Please make sure your file is in PDF, PNG, JPG, JPEG format and  maximum Document size should be 100 KB";
		alert(error);
		file.value = "";
		return false;
	}

}

function checkFileForMultipuleFormat(file) {

	var FileName = file.value;
	var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1);

	if ((FileExt == "pdf" || FileExt == "PDF" || FileExt == "png"
			|| FileExt == "PNG" || FileExt == "jpg" || FileExt == "JPG"
			|| FileExt == "jpeg" || FileExt == "JPEG")) {
		return true;
	} else {
		var error = "Please make sure your file is in PDF, PNG, JPG, JPEG format.";
		alert(error);
		file.value = "";
		return false;
	}

}

function onlyDocuments(file) {

	var FileName = file.value;
	var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1);
	var FileSize = file.files[0].size;
	var size = (FileSize / 1024).toFixed(2);

	if ((FileExt == "pdf" || FileExt == "PDF")
			|| (FileExt == "png" || FileExt == "PNG")
			|| (FileExt == "jpg" || FileExt == "JPG")
			|| (FileExt == "jpeg" || FileExt == "JPEG") && size < 2048.1) {
		return true;
	} else {
		var error = "Please make sure your file is in PDF, PNG, JPG, JPEG format and  maximum Document size should be 2mb";
		alert(error);
		file.value = "";
		return false;
	}

}

function onlyImage(file) {

	var FileName = file.value;
	var FileExt = FileName.substr(FileName.lastIndexOf('.') + 1);
	var FileSize = file.files[0].size;
	var size = (FileSize / 1024).toFixed(2);

	if ((FileExt == "png" || FileExt == "PNG")
			|| (FileExt == "jpg" || FileExt == "JPG")
			|| (FileExt == "jpeg" || FileExt == "JPEG") && size < 2048.1) {
		return true;
	} else {
		var error = "Please make sure your file is in PNG, JPG, JPEG format and  maximum Document size should be 2mb";
		alert(error);
		file.value = "";
		return false;
	}

}

// Added by Rohan Parmar

function checkDateValidation(fromDate, toDate) {
	if (new Date($('#' + fromDate).val()) > new Date($('#' + toDate).val())) {
		toastr.error("From Date cannot be greater than To Date", "ERROR", {
			closeButton : true
		});
		$('#' + toDate).val('');

		return false;
	}
}

function serializeFormData(a) {
	var o = {};
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
}
// end

function age(form) {
	var monthfield = form.split("/")[1];
	var dayfield = form.split("/")[0];
	var yearfield = form.split("/")[2];
	var tmpdate = monthfield + "/" + dayfield + "/" + yearfield;
	var doj = new Date(tmpdate);

	var dob = new Date();
	var age = dob.getFullYear() - doj.getFullYear();
	alert(age)

	if (age < 5) {
		alert("not eligible for registration!");
	}
}

function validDob(element) {
	var form = element.value;
	var monthfield = form.split("/")[1];
	var dayfield = form.split("/")[0];
	var yearfield = form.split("/")[2];
	var tmpdate = monthfield + "/" + dayfield + "/" + yearfield;
	var doj = new Date(tmpdate);

	var dob = new Date();

	var age = dob.getFullYear() - doj.getFullYear();
	// alert(age)
	if (age <= 13) {
		// alert("Not eligible for registration!");
		bootbox.confirm({
			title : "Panchatantra",
			message : "Age should be atleast 14 years or above!",
			callback : function(result) {
				$('#' + element.id).val('');
			}
		})
	}
}

// Added By Maitri Rami
function checkYear(evt) {
	var dob = $('#' + evt.id).val();
	
	var dob_dt = new Date(dob.split("/")[1] + "/" + dob.split("/")[0] + "/"
			+ dob.split("/")[2]);
	var today_dt = new Date();
	var age_v = today_dt.getFullYear() - dob_dt.getFullYear();
	var mo = today_dt.getMonth() - dob_dt.getMonth();
	if (mo < 0 || (mo === 0 && today_dt.getDate() < dob_dt.getDate())) {
		age_v--;
	}
	if (age_v >= 0) {
		if (age_v < 18) {
			toastr.error("Please enter date of birth greater than 18 years.",
					"ERROR", {
						closeButton : true
					});
			$('#' + evt.id).val("");
		}
	} else {
		toastr.error("You Can,t Enter Future Date", "ERROR", {
			closeButton : true
		});
		$('#' + evt.id).val("");
	}

}
// Ended By Maitri Rami

// start jaydeep chauhan
function removeDoubleSpace(txtId) {
	var stringData = txtId.value;
	stringData = stringData.replace(/\s{2,}/g, ' ');
	$("#" + txtId.id).val(stringData);
}
// end jaydeep chauhan



//START : SAJJAD RANASARIYA

function checkTextareaLength(element) {
	
	let el = $(element).attr('class');
	if (el.includes("checkTextareaLength")) {
		if ($(element).val().length > 0) {
			let span_tag = document.createElement('span');
			span_tag.className = 'float-right textAreaLengthClassForSpan';
			span_tag.innerHTML = 'Max : <strong>'+$(element).attr('maxLength') +'/'+ ($(element).attr('maxLength') - $(element).val().length) +'</strong>';
			if ($(element).next('span').length > 0) {
				let color="";
				if($(element).val().length > 0 && $(element).val().length < ($(element).attr('maxLength')-10))
				{
					color="green";
				}
				else{
					color="red";
				}
				span_tag.style = "font-size:12px;color:"+color;
				$(element).next('span').html(span_tag);
			} else {
				span_tag.style = "font-size:12px;color:green";
				$(element).after(span_tag);
			}
		}
		else{
			$(element).next('span').remove();
		}
	}
}


function totalDays(fromDateId,toDateId)
{
	 
  	var flag = true;
	var fDatePara =$("#"+fromDateId).val();
	var tDatePara =$("#"+toDateId).val();
    if(fDatePara != null && fDatePara != "" && tDatePara != null && tDatePara != "" ){
        var fDateTemp = fDatePara.split("/");
		var tDateTemp = tDatePara.split("/");    	  
          var dt1 = new Date(fDateTemp[2], fDateTemp[1] - 1, fDateTemp[0]); 
			var dt2 = new Date(tDateTemp[2], tDateTemp[1] - 1, tDateTemp[0]);

          var time_difference = dt2.getTime() - dt1.getTime();
         
          var result = time_difference / (1000 * 60 * 60 * 24);
    	  
          $('.totalDays').val(result+1);
		}
      
    else{
    	$('.totalDays').val('');
    }
	
}

function checkFutureYear(element)
{
    var year = $('#' + element.id).val();
	var today_dt = new Date();
	if (year > today_dt.getFullYear()) {		
			toastr.error("You Can,t Enter Future Year",
					"ERROR", {
						closeButton : true
					});
			$('#' + element.id).val("");
			$('#' + element.id).focus();
	}

}

//END : SAJJAD RANSARIYA

const numberFormatWithCommas = (num) => {
	return num !== undefined && num != null && num != '' ? 
			Number.parseFloat(num).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") 
		: '0.00';
}

const totalForPagination = (tableName,sc,tc,skipColumnForTotal) => {
    let tfoot = $("<tr/>").addClass('text-center');
    tfoot.append($('<th/>').addClass('totalTh tfootclassTable').append('PAGE TOTAL / GRAND TOTAL'));
    for (let index = Number(sc); index < Number(tc); index++) {
        tfoot.append($('<th/>').addClass('totalGpreg'+index+' text-right tfootclassTable'));
    }
    $("#"+tableName+" > tfoot").empty().append(tfoot);
	$(".totalTh").attr("colspan",sc).css("text-align","right !important");
	
	if(skipColumnForTotal != null && skipColumnForTotal != ""){
	    var skipColumnArray=skipColumnForTotal.split("-");	
	}else{
	    var skipColumnArray=null;
	}
	
	$("#"+tableName).dataTable({
        "lengthMenu": [ [ 10,20,50, -1], [ 10,20,50, "All"] ],
        "footerCallback" : function(row, data, start, end, display) {
			var api = this.api(), data;
		
			// Remove the formatting to get integer data for summation
			var intVal = function(i) {
			    return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
			};
			
			// Total over all pages
			for(var tstart=parseInt(sc);tstart<parseInt(tc);tstart++)
			{
				if($.inArray(tstart.toString(),skipColumnArray) >= 0) {
					$(api.column( tstart ).footer() ).html('-');
				}
				else {
					total = api
						.column( tstart )
						.data()
						.reduce( function (a, b) {
							return intVal(a) + intVal(b);
						} );
					
					pageTotal = api
						.column( tstart, { page: 'current'} )
						.data()
						.reduce( function (a, b) {
							return intVal(a) + intVal(b);
						}, 0 );
					
					$("."+$(api.column( tstart ).footer()).prop('class').split(" ")[0]).html(
							numberFormatWithCommas((Number(pageTotal)).toFixed(2)) + " / " 
								+ numberFormatWithCommas((Number(total)).toFixed(2))
						);
				}
			}
		}
	});
}