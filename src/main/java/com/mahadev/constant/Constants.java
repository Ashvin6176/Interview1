package com.mahadev.constant;

/**
 * @author Baghel Mit
 * for constants
 */
public class Constants
{
	private Constants()
	{
		
	}
	//START : SAJJAD
	 public static final int SECRATE_KEY_ERROR_CODE=997;
	/*	toaster constat*/
	public static final String MSG_PRIORITY="msg_priority";
	public static final String MSG_PRIORITY_SUCCESS="success";
	public static final String MSG_PRIORITY_ERROR="danger";
	public static final String MSG_PRIORITY_INFO="info";
	public static final String MSG_PRIORITY_WARNING="warning";
	public static final String MSG_TITLE="title";
	public static final String MSG_NAME="msg";
	public static final String MSG_VALIDATION_ERRORS="validationErrors";
	public static final String ERROR_MSG="Something wrong, Please try again....!!!";
	//end toaster
	// START :: ABHAY DODIYA 
	
	public static String ITEM_PENDING="1";
	public static String ITEM_APPROVED="2";
	public static String ITEM_REJECTED="0";
	public static String ELIGIBLE_SCANNING ="N";
	public static final String YES_STATUS="Y";
	public static final String NO_STATUS="N";
	// END :: ABHAY DODIYA
	/** Start By :: Payal Patanvadiya */
	public static int USER_ID=12;
	public static int DEVLOPER_ROLE_ID=34;
	public static int EMP_ROLE_ID=99;
	public static String IGNOR_ROLE = "34,44,49,66";
	public static final int RETAILER_ROLE_ID=67;
	
	public static String SUCCESS="SUCCESS";
	public static String REJECTED="REJECTED";
	public static String ERROR="ERROR";
	public static final int SUCCESS_CODE=1000;
	public static final int ERROR_CODE=999;
	public static final int TOKEN_ERROR_CODE=998;
	public static final String MSG_ERROR="ERROR";
	public static String SAVE="save";
	public static String UPDATE="update";
	public static String DELETE="delete";
	public static String ACTIVE="active";
	public static String IN_ACTIVE="inactive";
	public static String ACTIVE_STATUS="1";
	public static String IN_ACTIVE_STATUS="0";
	public static String SERVICE_FLAG_ACTIVE="Y";
	public static String SERVICE_FLAG_IN_ACTIVE="N";
	public static int SUPPLIER_RETAILER_ACCESS_LEVEL=3;
	public static final String FINAL_SUBMIT="F";
	public static final String SAVE_AS_DRAFT="D";
	public static final String PENDING_STATUS="P";
	public static final String PENDING="PENDING";
	public static final int APR_APPL_ID =45;
	public static final int LEAVE_APPL_ID =44;
	public static final int EMP_PROMOTION = 6;
	public static final int EMP_TRANSFER = 7;
	public static final int EMP_REPATRIATIER = 8;
	public static final int EMP_INCREMENT = 9;
	public static final int EMP_RETIRE = 2;
	public static final int EMP_VRS = 3;
	public static final int EMP_DEATH = 5;
	public static final String DATE_FORMATE_JSP="dd-MMM-yyyy";
	
	public static final String ALPHA_NUMERIC_REGEX_UN_SCORE="^[a-zA-Z0-9 _()]*$";
	public static final String ALPHA_NUMERIC_REGEX_UN_SCORE_MSG="Enter Alpha Numberic Text with underscore";
	public static final String ALPHANUMRIC_TEXT_WITH_COMMA_SPACE_SPEICAL_DOT="^([a-zA-Z0-9 ,_\\-\\'\\/]+ )*(.)*[a-zA-Z0-9 ,_\\-\\'\\/]*$";
	public static final String ALPHA_NUMERIC_REGEX_WITH_COMMA_MSG="Enter Alphabet and Numeric with some special character";
	
	public static final String number_validation="^[1-9]*$";
	public static final String SIMPLE_TEXT="^[a-zA-Z]*$";
	public static final String SIMPLE_TEXT_WITH_SPLACE="^[a-zA-Z ]*$";
	public static final String SIMPLE_TEXT_WITH_SINGLE_SPLACE="^([a-zA-Z]+ )*[a-zA-Z]*$";
	public static final String SIMPLE_TEXT_WITH_COMMA="^[a-zA-Z,]*$";
	public static final String SIMPLE_TEXT_WITH_COMMA_SPACE="^([a-zA-Z,]+ )*[a-zA-Z,]*$";
	public static final String SIMPLE_TEXT_WITH_COMMA_SPACE_SPECIAL="^([a-zA-Z0-9,\\-.()\\'\\/]+ )*[a-zA-Z0-9,\\-.()\\'\\/]*$";
	public static final String FUNCTION_PATTREN="^([a-zA-Z0-9,\\-.()#\\'\\/]+ )*[a-zA-Z0-9,\\-.()#\\'\\/]*$";
	public static final String TEXT_WITH_SPECIAL_CHAR="^([a-zA-Z\\-.()&]+ )*([a-zA-Z\\-.()&])*$";
	
	public static final String ALPHANUMRIC_UPPER_TEXT="^[A-Z0-9]*$";
	public static final String ALPHANUMRIC_UPPER_TEXT_WITH_UDERSCORE="^[a-zA-Z0-9_ ]*$";
	public static final String ALPHANUMRIC_UPPER_TEXT_WITH_SPACE_SPEICAL="^[a-zA-Z0-9_\\-() ]*$";
	public static final String ALPHANUMRIC_TEXT="^[a-zA-Z0-9]*$";
	public static final String ALPHANUMRIC_TEXT_WITH_COMMA="^[a-zA-Z0-9,]*$";
	public static final String ALPHANUMRIC_TEXT_WITH_COMMA_SPACE="^([a-zA-Z0-9,]+ )*[a-zA-Z0-9,]*$";
	public static final String ALPHANUMRIC_TEXT_WITH_COMMA_SPACE_SPEICAL="^([a-zA-Z0-9 ,\\.\\-\\'\\/]+ )*[a-zA-Z0-9 ,\\-\\'\\/]*$";
	
	public static final String ONLY_DIGIT_WITH_DOT="[0-9]*(.){1}[0-9]*$";
	public static final String YEAR_VALIDATE="^([0-9]{4})$";
	public static final String AADHAR_NO="^([0-9]{12})$";
	public static final String MOBILE_NO="^(((6|7|8|9))[0-9]{9})$";
	public static final String MOBILE_NO_WITH_NULL="^(((6|7|8|9))[0-9]{9})*$";
	public static final String EMAIL_ID_WITH_NULL="^([a-zA-Z]{1}[\\w\\-\\.]*\\@([\\da-zA-Z\\-]{1,}\\.){1,}[\\da-zA-Z\\-]{2,4})*$";
	public static final String PINCODE="([0-9]{6})*$";
	public static final String PERCENTAGE_WITH_NUMBER="(^100(\\.0{1,2})?$)|(^([4-8]([0-9])?|9[0-9])(\\.[0-9]{1,2})?$)";
	public static final String CHECK_BLOOD_GROUP="^[A|B|O]{1,2}[+,-]$";
	public static final String CHECK_URL="(((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*))||(((http|https):\\/\\/)[a-zA-Z0-9.]*:[0-9]{2,6}\\/[a-zA-Z0-9._\\/]*)";
	public static final String CHECK_POSTAL_CODE="^[0-9]{5}(?:-[0-9]{4})?$";
	public static final String CHECK_POSTAL_CODE_NULL="^([0-9]{5}(?:-[0-9]{4})?)*$";
	public static final String PHONE_NO_WITH_NULL="^((\\+\\d{1,3}( )?)?((\\(\\d{3}\\))|\\d{3})[- .]?\\d{3}[- .]?\\d{4}$)*" 
												+ "|^((\\+\\d{1,3}( )?)?(\\d{3}[ ]?){2}\\d{3}$)*" 
												+ "|^((\\+\\d{1,3}( )?)?(\\d{3}[ ]?)(\\d{2}[ ]?){2}\\d{2}$)*";
	public static final String FAX_NO_WITH_NULL="^(\\+(91)[- ]{1}[0-9]{1,4}[- ]{1}[0-9]{6,8})*$";
			
	
	public static final String DATE_FORMAT_PATTERN_DASH_WITH_NULL  = "^((([0-9])|([0-2][0-9])|([3][0-1]))\\-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\\-\\d{4})*$";
	public static final String DATE_FORMATE_DD_MM_YYYY_PATTERN = "^([0]?[1-9]|[1|2][0-9]|[3][0|1])[\\/]([0]?[1-9]|[1][0-2])[\\/]([0-9]{4})*$";
//			"^(([0-2][0-9]|(3)[0-1])(\\/)(((0)[0-9])|((1)[0-2]))(\\/)\\d{4})*$";
	public static final String CHECK_ACA_YEAR="^[2][0-9]{3}-[2][0-9]{1,3}$";
	public static final String CHECK_ACA_YEAR_NULL="^([2][0-9]{3}-[2][0-9]{3})*$";
	
	public static final String ONE_OR_TWO= "1|2";
	
	public static final String SIMPLE_TEXT_MSG="Please enter only alphabets";
	public static final String SIMPLE_TEXT_WITH_SPLACE_MSG="Please enter only alphabets with single space";
	public static final String ALPHANUMRIC_TEXT_MSG="Please enter alpha numeric";
	public static final String ALPHANUMRIC_TEXT_WITH_SPACE_MSG="Please enter alpha numeric with single space";
	
	public static final String FUNCTION_MSG="Please enter only validate function";
	public static final String MOBILE_NO_MSG="Please enter valid mobile number";
	public static final String PINCODE_MSG="Please enter valid pincode";
	public static final String PERCENTAGE_MSG="Please enter valid percentage";
	public static final String AADHAR_MSG="Please enter valid aadhar number";
	public static final String BLOOD_GROUP_MSG="Please enter valid blood group";
	public static final String URL_MSG="Please enter valid URL";
	public static final String POSTAL_CODE_MSG="Please enter valid postal code";
	public static final String PHONE_NO_MSG="Please enter valid phone number";
	public static final String FAX_NO_MSG="Please enter valid fax number";
	public static final String ACA_YEAR_MSG="Please enter valid academic year";
	public static final String DATE_FORMATE_MSG="Please enter date dd-Mon-YYYY formate";
	public static final String DATE_FORMATE_DD_MM_YYYY_MSG="Please enter date DD/MM/YYYY formate";
	public static final String TEXT_WITH_SPECIAL_CHAR_MSG="Please enter alphabets with only (-,.,(),&) characters are allowed";
	/** End By :: Payal Patanvadiya */
	//Start :: Farman
	
	public static final String ALPHABET_WITH_SPACE="^[a-zA-Z ]*$";
	public static final String SIMPLE_TEXT_REGEX="^[a-zA-Z\\t]*$";
	public static final String ALPHA_NUMERIC_REGEX="^[a-zA-Z0-9 ]*$";
	public static final String ALPHA_DOT_DESH_PARENTHESES_REGEX="^[a-zA-Z ()-.]*$";
	
	public static final String ALPHABET_WITH_SPACE_MSG="Enter Alphabet With Space";
	public static final String SIMPLE_TEXT_REGEX_MSG="Enter Only Alphabet With No Space";
	public static final String ALPHA_NUMERIC_REGEX_MSG="Enter Only Alphabet and Numeric";
	public static final String ALPHA_DOT_DESH_PARENTHESES_REGEX_MSG="Please Enter Valid Name";
	
	
	//End :: Farman
	
	//Start :: Dangi Ashish :: //
	
	public static final String KANNADA_ENGLISH_TEXT_WITH_COMMA_SPACE="^[\u00A1-\uFFFF(/,-.) a-z(/,-.) A-Z(/,-.) 0-9(/,-.) ,]*$";
	public static final String KANNADA_ENGLISH_TEXT_WITH_COMMA_SPACE_REGEX_MSG="Please Enter Valid Text";
	public static final String ONLY_DIGIT="[0-9]*$";
	public static final String ONLY_DIGIT_MSG="Please Enter Only Number";
	public static final String EMAIL_ID="^([a-zA-Z]{1}[\\w\\-\\.]*\\@([\\da-zA-Z\\-]{1,}\\.){1,}[\\da-zA-Z\\-]{2,4})$";
	public static final String EMAIL_ID_MSG="Please enter valid email id";
	
	//End :: Dangi Ashish :: //
	
	//LALJI
	public static final String SPIRIT_SUPPLIER_ROLE="101";
	public static final String BUYER_SUPPLIER_ROLE="102";
	
	//LALJI
	
	//Anita
	public static final String KSBCL_ASSISTANT_PERSON_ROLE_ID="43";
	public static final String SUPPLIER_ENLISTMENT_ROLE_ID="44";
	public static final String SUPPLIER_ID="49";
	public static final String REAPPLY_REMARK="Application Reapplied By Applicant";
	public static final String PULLBACK_REMARK="Application Pullback by";
	public static final String FILE_APPROVED="A";
	public static final String FILE_REJECT="R";
	public static final String FILE_PENDING="P";
	public static final String FILE_COMPLETED="C";
	public static final int LABEL_REG_SERVICE_ID=9;
	public static final int RENEWAL_SERVICE_ID=10;
	public static final String FOR_PULLBACK="21";
	public static final String PRE_FILE_SERVICE_ID="0";
	public static final String ZERO_STAGE="0";
	public static final String FIRST_STAGE="1";
	public static final String FORTH_STAGE="4";
	public static final String TEMP_DEACTIVE_ITEM_FOR_COST_CARD="2";
	public static final String SUPPLIER_REG_SERVICE_ID="6";
	public static final String PAN_NUMBER_REGEX="^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$";
	public static final String PAN_NUMBER_REGEX_MSG="Please Enter Valid Pan Number";
	
	public static final String KSBCL_ASSISTANT_PERSON_SUMA_USER_ID="57";
	public static final String KSBCL_LOGIN_SECRET_KEY_ID="ikgd7WQa8pwN2r3s";
	
	
	public static  String EXCISE_CURRENT_FULL_YEAR;
	public static  String EXCISE_CURRENT_SHORT_YEAR;
	public static  String EXCISE_PREVIOUES_FULL_YEAR;
	public static  String EXCISE_PREVIOUES_SHORT_YEAR;
	
	//Anita

	// FAIZAL :: START
	public static final String NEW = "New";
	public static final String EXISTS="Exists";
	public static final String BEER_CATEGORY_ID="9";
	public static final String DEO_ROLL_ID="5";
	public static final String IS_UNBLOCKED="N";
	public static final String MD_ROLE_ID="8";
	public static final String EDF_ROLE_ID="56";
	public static final String EDA_ROLE_ID="86";
	public static final String LEAVE_ENCASEMENT_PAYMENT_TYPE="11";
	public static final String REMED_PAYMENT_TYPE="6";
	public static final String SALARY_PAYMENT_TYPE="1";
	public static final String MEDICLAIM_SERVICE="49";
	public static final int TELEPHONE_REIMBURSEMENT=50;
	public static final int LOCAL_CONVEYANCE_REIMBURSEMENT=52;
	public static final String ASST_MANAGER_EST_BILLS="31";
	public static final String ASSISTANT_EST_BILLS="32";
	public static final String LOCAL_CONVEYANCE_REIMBURSEMENT_PAYMENT_TYPE="13";
	public static final String TELEPHONE_REIMBURSEMENT_PAYMENT_TYPE="12";
	public static final String FUEL_REIMBURSEMENT_PAYMENT_TYPE="14";
	public static final String AUTO_CHARGE_REIMBURSEMENT_PAYMENT_TYPE="15";
	public static final int NON_UTILIZATION_LEAVE_APPL_ID =54;
	public static final String PROJECT_NAME ="Mahadev";
	// FAIZAL :: END

	// START :: SAJJAD
	public static final String APPROVED = "A";
	public static final int ITEM_APPROVAL_SERVICE_ID=11;
	public static final String WINE_CATEGORY_ID="7";
	public static final int ITEM_DP_COST_CARD_SERVICE_ID_FOR_LC=13;
	public static final int ITEM_DP_COST_CARD_SERVICE_ID_FOR_BII=14;
	public static final int ITEM_DP_COST_CARD_SERVICE_ID_FOR_BIO=15;
	public static final int LC_SUPPLIER_TYPE=6;
	public static final int BII_SUPPLIER_TYPE=7;
	public static final int BIO_SUPPLIER_TYPE=8;
	public static final String ITEM_APPROVAL_STATUS_METHOD="getItemDetailsWithApprovalDetails";
	public static final String ITEM_DP_APPROVAL_STATUS_METHOD="getItemDPDetailsWithApprovalDetails";
	public static final String DP_FUNCTIONALITY_TYPE = "4";
	public static final int FAILED_CODE=1001;
	public static final String LPL_PRICE_TYPE_ID = "2";
	public static final String SPIRIT_SUPPLIER_SERVICE_ID = "41";
	public static final String SPIRIT_BUYER_SERVICE_ID = "42";
	public static final String SPIRIT_SUPPLIER_TYPE = "2";
	public static final String SPIRIT_BUYER_TYPE = "3";
	// END :: SAJJAD

	
	
	//start:: TAHIR
	
	public static final int RETAILER_SERVICE_ID=17;
	public static final int ADDRESSS_SERVICE_ID=19;
	public static final String MSG_STATUS="status";
	//END :: TAHIR

	
	//start Nizam
	public static final String DEPOT_MANAGER_ID="54";
	public static final String JOINT_MANAGER_ID="6";
	public static final String JR_ASSISTANT_OPERATION_IML="81";
	public static final String ASSISTANT_MANAGER_OPERATION_IML="7";
	public static final String DATA_ENTRY_OPERATER="5";
	public static final int LEAVE_TYPE_LWP=7;
	
	
	//for tour program
	public static final int TOUR_PROGRAM=36;
	public static final int HR=14;
	public static final int ED=56;
	public static final int REPORTING=87;
	public static final int APPROVAL=19;
	public static final int FEST_ADVANCE=43;
	public static final int LEAVE_ENCASHMENT=46;
	public static final int REIMBURSEMENT_AUTO_CHARGE=48;
	public static final int REIMBURSEMENT_FUEL_CHARGE=53;
	//end Nizam
	
	//	start jaydeep
		public static final String FOR_VERIFICATION="18";
		public static final String FOR_FORWARD="17";
		public static final String FOR_APPROVAL="19";
//		public static final String For_Verification="18";
	// end jaydeep

	
	//start vivek
	public static final String GRAWL_BEER_TYPE="3";
	public static final String LOCAL_SUPPLIER="6";
	
	
	//end Vivek
	
	//start kuldipsinh
	public static final String SPIRIPT_ASSISTENT="83";
	public static final String IML_ASSISTENT="43";
	public static final String LC_SPIRIT_SUPPLIER_TYPE="10";
	public static final String IMPORT_SPIRIT_SUPPLIER_TYPE="11";
	public static final String DIRECT_IMPORT_SPIRIT_SUPPLIER_TYPE="12";
	public static final String LC_SPIRIT_BUYER_TYPE="13";
	public static final String EXPORT_SPIRIT_BUYER_TYPE="14";
	public static final String ENLISTMENT_SERIVICE_ID_FOR_LC_SPIRIT_SUPPLIER_TYPE="32";
	public static final String ENLISTMENT_SERIVICE_ID_FOR_IMPORT_SPIRIT_SUPPLIER_TYPE="33";
	public static final String ENLISTMENT_SERIVICE_ID_FOR_LC_SPIRIT_BUYER_TYPE="34";
	public static final String ENLISTMENT_SERIVICE_ID_FOR_EXPORT_SPIRIT_BUYER_TYPE="35";
	public static final String ENLISTMENT_SERIVICE_ID_FOR_DIRECT_IMPORT_SPIRIT_SUPPLIER_TYPE="47";
	
	public static final String RENEWAL_SERIVICE_ID_FOR_EXPORT_SPIRIT_BUYER_TYPE="39";
	public static final String RENEWAL_SERIVICE_ID_FOR_IMPORT_SPIRIT_SUPPLIER_TYPE="40";
	public static final String RENEWAL_SERIVICE_ID_FOR_LC_SPIRIT_BUYER_TYPE="38";
	public static final String RENEWAL_SERIVICE_ID_FOR_LC_SPIRIT_SUPPLIER_TYPE="37";
	public static final String RENEWAL_SERIVICE_ID_FOR_DIRECT_IMPORT_SPIRIT_SUPPLIER_TYPE="51";
	//end kuldipsinh

	
	//MITESH 
	public static final String CW_STATUS_PENDING="4";
	public static final String CW_STATUS_APPROVED="Approved";
	public static final String CW_STATUS_REJECT="Reject";
	//MITESH

	public static final String PDO_APPR_PENDING="P";
	public static final String PRESIDENT_APPR_PENDING ="P";
	
	public static final String PDO_APPR_APPROVED="A";
	public static final String PRESIDENT_APPR_APPROVE ="A";
	
	public static final String PDO_APPR_REJECT="R";
	public static final String PRESIDENT_APPR_REJECT ="R";
	
	//END : SAJJAD
	public static final String PROJECT_TITLE="Mahadev";
	public static final String INSERT="INSERT";
	public static final String STATUS_1="1";
	public static final String STATUS_2="2";
	public static final String MSG_SUCCESS="SUCCESS";
	public static final String STATUS_NO_VALUE="";
	
	//LALJI LILAPARA
	
	public static final String Active="1";
	public static final String DeActive="0";
	
	//LALJI LILAPARA
	
	// Start By Faizal
		 public static final String SIMPLE_TEXT_KN="^[a-zA-Z \u00A1-\uFFFF]*$";
		 public static final String SIMPLE_TEXT_KN_COMMA="^[a-zA-Z, \u00A1-\uFFFF]*$";
		 
		 
		 public static final String SIMPLE_TEXT_KN_MSG="Please enter only alphabets In Kannad";
		 public static final String SIMPLE_TEXT_KN_WITH_SPLACE_MSG="Please enter only alphabets with single space In Kammad";
		 
	   // End By Faizal
		 
	public static final String HCG_CONFIG_FILE = "Config.hcgConfig";
}



