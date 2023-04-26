package com.mahadev.exception;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.NotSupportedException;
import javax.validation.ConstraintViolationException;
import javax.ws.rs.BadRequestException;
import javax.ws.rs.ForbiddenException;
import javax.ws.rs.InternalServerErrorException;
import javax.ws.rs.NotAcceptableException;
import javax.ws.rs.NotAllowedException;
import javax.ws.rs.NotAuthorizedException;

import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.impl.SizeLimitExceededException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.UnsatisfiedDependencyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.MissingRequestHeaderException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException.MethodNotAllowed;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mahadev.common.entityModel.ResponseBo;
import com.mahadev.constant.Constants;

import javassist.NotFoundException;

@ControllerAdvice
public class ExceptionHandlerClass   {

    public static final String HANDLE_ENTITY_EXCEPTION_ERROR = "handleEntityException: Error";
    private static final String INTERNAL_SERVER_ERROR = "internal.server.error";
    private final MessageSource messageSource;
    private final Logger log = LoggerFactory.getLogger(ExceptionHandlerClass.class);
       /**
     * @param messageSource
     */
    @Autowired
    public ExceptionHandlerClass(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    /**
     * @param exception
     * @return ResponseEntity with error details
     */
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    @ExceptionHandler({Exception.class})
    public ResponseEntity<String> handleExceptionAny(Exception ex) {
        log.error("Internal server error", ex);
        JSONArray ar = new JSONArray();
		JSONObject obj = new JSONObject();
		JSONArray mainAr = new JSONArray();
		JSONObject mainObj = new JSONObject();
		String msg = "";
		int i = 0;
		Error error = null;
		 if (ex instanceof BadRequestException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.BAD_REQUEST);
//				mainObj.put("status", HttpStatus.OK);
				mainObj.put("Message_Description", "Malformed message");
				mainAr.put(mainObj);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST.value()).body(mainAr.toString());
		}
		 else if (ex instanceof NotAuthorizedException) {
				try {
					mainObj.put("error_message", ar.put(ex.getMessage()));
					mainObj.put("status", HttpStatus.UNAUTHORIZED);
					mainObj.put("Message_Description", "Authentication failure");
					mainAr.put(mainObj);
				} catch (JSONException e) {
					e.printStackTrace();
				}
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED.value()).body(mainAr.toString());
			}
		 else if (ex instanceof ForbiddenException) {
				try {
					mainObj.put("error_message", ar.put(ex.getMessage()));
					mainObj.put("status", HttpStatus.FORBIDDEN);
					mainObj.put("Message_Description", "Not permitted to access");
					mainAr.put(mainObj);
				} catch (JSONException e) {
					e.printStackTrace();
				}
				return ResponseEntity.status(HttpStatus.FORBIDDEN.value()).body(mainAr.toString());
			}
		else if (ex instanceof NotAllowedException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.METHOD_NOT_ALLOWED);
				mainObj.put("Message_Description", "HTTP method not supported");
				mainAr.put(mainObj);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.METHOD_NOT_ALLOWED.value()).body(mainAr.toString());
		}
		else if (ex instanceof NotFoundException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.NOT_FOUND);
				mainObj.put("Message_Description", "Couldn�t find resource");
				mainAr.put(mainObj);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.NOT_FOUND.value()).body(mainAr.toString());
		}
		else if (ex instanceof NotAcceptableException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.NOT_ACCEPTABLE);
				mainObj.put("Message_Description", "Client media type requested not supported");
				mainAr.put(mainObj);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE.value()).body(mainAr.toString());
		}
		else if (ex instanceof NotSupportedException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.UNSUPPORTED_MEDIA_TYPE);
				mainObj.put("Message_Description", "Client posted media type not supported");
				mainAr.put(mainObj);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.UNSUPPORTED_MEDIA_TYPE.value()).body(mainAr.toString());
		}
		else if (ex instanceof InternalServerErrorException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.INTERNAL_SERVER_ERROR);
				mainObj.put("Message_Description", "General server error");
				mainAr.put(mainObj);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR.value()).body(mainAr.toString());
		}
		else if (ex instanceof InternalServerErrorException) {
			try {
				mainObj.put("error_message", ar.put(ex.getMessage()));
				mainObj.put("status", HttpStatus.SERVICE_UNAVAILABLE);
				mainObj.put("Message_Description", "Server is temporarily unavailable or busy");
				mainAr.put(mainObj);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE.value()).body(mainAr.toString());
		}
		else {
			try {
				if(ex.getCause() !=null && !"".equals(ex.getCause()))
				{
				mainObj.put("error_message", ar.put(ex.getCause().toString()));
				}
				else
				{
					mainObj.put("error_message", ar.put(ex.toString()));
				}
				mainObj.put("status", 404);
				mainObj.put("Message_Description", "Not Found !!!");
				mainAr.put(mainObj);
				return ResponseEntity.status(404).body(mainAr.toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		return null;
       
    }
    
  
	@ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<?> resourceNotFoundException(ResourceNotFoundException ex, WebRequest request) 
	{
        ErrorDetails errorDetails = new ErrorDetails(new Date(), ex.getMessage(), request.getDescription(false));
        return new ResponseEntity<>(errorDetails, HttpStatus.NOT_FOUND);
    }
	



	    /**
	     * @param exception
	     * @return ResponseEntity with error details
	     */
	    @ResponseStatus(HttpStatus.UNAUTHORIZED)
	    @ExceptionHandler({SecurityException.class})
	    public ResponseEntity<CommonResponse<Map<String, Object>>> securityException(SecurityException exception) {
	        Map<String, Object> map = new HashMap<>();
	        String msg = "";
	        try {
	            msg = messageSource.getMessage(exception.getMessage(), null, LocaleContextHolder.getLocale());
	        } catch (NoSuchMessageException e) {
	            msg = exception.getMessage();
	        }

	        map.put(Constants.MSG_ERROR, new ErrorResponse(msg, HttpStatus.UNAUTHORIZED.value()));
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(CommonResponse.builder(map).message(msg).status(HttpStatus.UNAUTHORIZED.value()).build());
	    }
	    @ExceptionHandler({UnsatisfiedDependencyException.class})
	    public ResponseEntity<ResponseBo> unsatisfiedDependencyException(UnsatisfiedDependencyException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	   
	    /**
	     * @param exception
	     * @return ResponseEntity with error details
	     */
	    @ExceptionHandler({HttpRequestMethodNotSupportedException.class})
	    public ResponseEntity<ResponseBo> methodNotAllowedException(HttpRequestMethodNotSupportedException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	    @ExceptionHandler({MultipartException.class})
	    public ResponseEntity<ResponseBo> multipartException(MultipartException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
	    @ExceptionHandler({MethodNotAllowed.class})
	    public ResponseEntity<ResponseBo> methodNotAllowed(MethodNotAllowed exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status("200");
		        aj.setError_message(errors);
		        aj.setMessage_description(HttpStatus.METHOD_NOT_ALLOWED.name());
		        return ResponseEntity.ok(aj);
	    }

	    @ExceptionHandler({HttpMediaTypeNotSupportedException.class})
	    public ResponseEntity<ResponseBo> unsupportedMediaType(HttpMediaTypeNotSupportedException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	    @ExceptionHandler({MissingPathVariableException.class})
	    public ResponseEntity<ResponseBo> missingPathVariable(MissingPathVariableException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	    public  String humanReadableByteCount(long bytes, boolean si) {
	        int unit = si ? 1000 : 1024;
	        if (bytes < unit) return bytes + " B";
	        int exp = (int) (Math.log(bytes) / Math.log(unit));
	        String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp-1) + (si ? "" : "i");
	        return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	    }
	    @ExceptionHandler({MaxUploadSizeExceededException.class})
	    public ResponseEntity<ResponseBo> maxUploadSizeExceededException(MaxUploadSizeExceededException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
//		     String msg=exception.getCause().getMessage();
//		     String s2=msg.substring(msg.indexOf("(")+1, msg.indexOf(")"));
//		     System.out.println("actual file size:="+s2);
//		     System.out.println(humanReadableByteCount(new Long(s2),true));
		     ResponseBo aj=new ResponseBo();
		    if(exception.contains(FileUploadException.class))
		    {
		    	SizeLimitExceededException fx=(SizeLimitExceededException) exception.getRootCause();
		    	System.out.println(fx.getActualSize());
		    	errors.put("error_message","the request was rejected because its size "+humanReadableByteCount(new Long(fx.getActualSize()),true)+" exceeds the configured maximum ("+humanReadableByteCount(new Long(exception.getMaxUploadSize()),true)+")");
		    	 aj.setValidated(false);
			      
			        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
			        aj.setError_message(errors);
			        aj.setMessage_description(errors.toString());
			        Map<String, Object> map = new HashMap<>();
			        map.put("error",aj);
		    }
		    else
		    {
			     String msg=exception.getCause().getMessage();
			     String s2=msg.substring(msg.indexOf("(")+1, msg.indexOf(")"));
		    	  errors.put("error_message","the request was rejected because its size "+humanReadableByteCount(new Long(s2),true)+" exceeds the configured maximum ("+humanReadableByteCount(new Long(exception.getMaxUploadSize()),true)+")");
		    	  aj.setValidated(false);
				  aj.setService_status(Integer.toString(Constants.ERROR_CODE)); aj.setError_message(errors);
				  aj.setMessage_description(errors.toString()); 
				  Map<String, Object> map = new HashMap<>();
				  map.put("error",aj);
		    }
//		        return ResponseEntity.status(Integer.toString(Constants.ERROR_CODE)).body(CommonResponse.builder(map).message(exception.getCause().getMessage()).status(Integer.toString(Constants.ERROR_CODE)).build());
		        return ResponseEntity.ok(aj);
	    }
	    
	    /**
	     * @param exception
	     * @return ResponseEntity with error details
	     */
	    @ResponseStatus(HttpStatus.BAD_REQUEST)
	    @ExceptionHandler({HttpMessageNotReadableException.class, DuplicateEntityException.class, EntityCreationException.class, BadDataException.class, EntityModificationException.class})
	    public ResponseEntity<CommonResponse<Map<String, Object>>> handleEntityException(Exception exception) {
	        String msg = "";
	        try {
	            msg = messageSource.getMessage(exception.getMessage(), null, LocaleContextHolder.getLocale());
	        } catch (NoSuchMessageException e) {
	            if (exception instanceof HttpMessageNotReadableException) {
	                msg = "Invalid data";
	            } else {
	                msg = exception.getMessage();
	            }
	        }

	        Map<String, Object> map = new HashMap<>();
	        map.put(Constants.MSG_ERROR, new ErrorResponse(msg, HttpStatus.BAD_REQUEST.value()));
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(CommonResponse.builder(map).message(msg).status(HttpStatus.BAD_REQUEST.value()).build());
	    }

	    /**
	     * @param exception
	     * @return ResponseEntity with error details
	     */
	    @ResponseStatus(HttpStatus.NOT_FOUND)
	    @ExceptionHandler({EntityNotFoundException.class})
	    public ResponseEntity<CommonResponse<Map<String, Object>>> handleNotFound(Exception exception) {
	        Map<String, Object> map = new HashMap<>();
	        map.put(Constants.MSG_ERROR, new ErrorResponse(exception.getMessage(), HttpStatus.NOT_FOUND.value()));
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(CommonResponse.builder(map).message(exception.getMessage()).status(HttpStatus.NOT_FOUND.value()).build());
	    }

	  
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<ResponseBo> customValidationErrorHandling(MethodArgumentNotValidException exception,HttpServletRequest re)
	{
		//ErrorDetails error= new ErrorDetails(new Date(), "Validation Error", ex.getBindingResult().getFieldError().getDefaultMessage());
		//return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
		 List<FieldError> fieldErrors = exception.getBindingResult().getAllErrors().stream().map(error -> (FieldError) error).collect(Collectors.toList());
	        return handleValidationError(fieldErrors,re,exception);

	}
	
	
	
	 /**
     * @param exception
     * @return ResponseEntity with error details
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({BindException.class})
    public ResponseEntity<ResponseBo> handleValidation(BindException exception,HttpServletRequest re) {
        BindingResult result = exception.getBindingResult();
//        List<FieldError> fieldErrors = result.getFieldErrors();
        List<FieldError> fieldErrors = exception.getBindingResult().getAllErrors().stream().map(error -> (FieldError) error).collect(Collectors.toList());
        return handleValidationError(fieldErrors,re,exception);

    }

	private ResponseEntity<ResponseBo> handleValidationError(List<FieldError> fieldErrors, HttpServletRequest re,
			BindException exception) 
	{
		 Map<String, String> messages = new HashMap<>();
	     Map<String, Object> errors =new HashMap<String, Object>();
	     for (FieldError fieldError : fieldErrors) 
	     {
	    	 errors.put(fieldError.getField(),fieldError.getDefaultMessage());
	     }
	     ResponseBo aj=new ResponseBo();
	        aj.setValidated(false);
	        aj.setService_status("200");
	        aj.setError_message(errors);
	        aj.setService_message("Fill all the mandatory fields..");
	        return ResponseEntity.ok(aj);
	}
	
	
	
	 @ExceptionHandler({ConstraintViolationException.class})
	    public ResponseEntity<ResponseBo> constraintViolationException(RuntimeException  e) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",e.getMessage());
		    	 
		        ResponseBo aj=new ResponseBo();
		        if (e.getCause() != null && !"".equals(e.getCause())) {
					if (e.getCause().getCause() != null) {
						aj.setService_message(e.getCause().getCause().toString());
						 errors.put("error_message",e.getCause().getCause().toString());
					} else {
						aj.setService_message(e.getCause().toString());
						errors.put("error_message",e.getCause().toString());
					}
				} else {
					aj.setService_message(errors.toString());
					 errors.put("error_message",e.toString());
				}
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	@ExceptionHandler({DataIntegrityViolationException.class})
	    public ResponseEntity<ResponseBo> dataIntegrityViolationException(DataIntegrityViolationException  e) {
		     Map<String, Object> errors =new HashMap<String, Object>();
			    //  String message = e.getMostSpecificCause().getMessage();
			     // String column = message.substring(message.indexOf("(") + 1, message.indexOf(")")).replace("_", " "); //
		        ResponseBo aj=new ResponseBo();
		        //errors.put("error_message",column + " is alredy exsits");
//		        aj.setService_message("Enter " + column + " is alredy exsits");
		        if (e.getCause() != null && !"".equals(e.getCause())) {
					if (e.getCause().getCause() != null) {
						aj.setService_message(e.getCause().getCause().toString());
						 errors.put("error_message",e.getCause().getCause().toString());
					} else {
						aj.setService_message(e.getCause().toString());
						errors.put("error_message",e.getCause().toString());
					}
				} else {
					aj.setService_message(errors.toString());
					 errors.put("error_message",e.toString());
				}
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	
	 @ExceptionHandler({Exception.class})
	    public ResponseEntity<ResponseBo> allException(Exception exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
//		    	 errors.put("error_message",exception.toString());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setResponseData(Constants.MSG_ERROR);
		        
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
					if (exception.getCause().getCause() != null) {
						aj.setMessage_description(exception.getCause().getCause().toString());
						 errors.put("error_message",exception.getCause().getCause().toString());
					} else {
						aj.setMessage_description(exception.getCause().toString());
						errors.put("error_message",exception.getCause().toString());
					}
				} else {
					aj.setMessage_description(errors.toString());
					 errors.put("error_message",exception.toString());
				}
		        aj.setError_message(errors);
		        System.out.println(exception.getMessage());
		        exception.printStackTrace();
		        return ResponseEntity.ok(aj);
	    }
	
	//kuldipsinh 20-04-2020 custom Exception
	
	
	 @ExceptionHandler({DataAccessPrivilegesException.class})
	    public ResponseEntity<ResponseBo> dataAccessPrivilegesException(DataAccessPrivilegesException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	 
	 @ExceptionHandler({UserSessionExpariedException.class})
	    public ResponseEntity<ResponseBo> userSessionExpariedException(UserSessionExpariedException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        aj.setMessage_description(errors.toString());
		        return ResponseEntity.ok(aj);
	    }
	 @ExceptionHandler({UniqueConstrintException.class})
	    public ResponseEntity<ResponseBo> uniqueConstrintException(UniqueConstrintException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
					if (exception.getCause().getCause() != null) {
						aj.setMessage_description(exception.getCause().getCause().toString());
					} else {
						aj.setMessage_description(exception.getCause().toString());
					}
				} else {
					aj.setMessage_description(errors.toString());
				}
		        
		        return ResponseEntity.ok(aj);
	    }
	 @ExceptionHandler({ InvalidCredentialsException.class})
	    public ResponseEntity<ResponseBo>  invalidCredentialsException(InvalidCredentialsException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
					if (exception.getCause().getCause() != null) {
						aj.setMessage_description(exception.getCause().getCause().toString());
					} else {
						aj.setMessage_description(exception.getCause().toString());
					}
				} else {
					aj.setMessage_description(errors.toString());
				}
		        
		        return ResponseEntity.ok(aj);
	    }
	 @ExceptionHandler(value = MissingRequestHeaderException.class)
	    public ResponseEntity<ResponseBo>  missingRequestHeaderException(MissingRequestHeaderException exception) {
	    	
	    	
		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
		        aj.setError_message(errors);
		        
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
					if (exception.getCause().getCause() != null) {
						aj.setMessage_description(exception.getCause().getCause().toString());
					} else {
						aj.setMessage_description(exception.getCause().toString());
					}
				} else {
					aj.setMessage_description(errors.toString());
				}
		        
		        return ResponseEntity.ok(aj);
	    }
	 
	    @ExceptionHandler({ CustomeFileForwardException.class})
	    public String  customeFileForwardException(HttpServletRequest request,CustomeFileForwardException exception,RedirectAttributes redirectAttribute) {
	    	
		 String uri=request.getHeader("referer");
		 String error_message="";
		 String msgType= Constants.MSG_PRIORITY_ERROR;
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
		        	
		        	 if (exception.getCause().getCause() != null) {
		        		 	if (exception.getCause().getCause().getCause() != null) {
								error_message=exception.getCause().getCause().getCause().getMessage();
							}
			        		 else
			        		 {
							error_message=exception.getCause().getCause().toString();
			        		 }
					} else {
						error_message=exception.getCause().toString();
					}
				} else {
					error_message=exception.getMessage();
				}
		        //add by kldipsinh 22-02-2022
		        if(error_message.contains("CustomeFileForwardException:"))
		        {
		        	 error_message=error_message.split("CustomeFileForwardException:")[1];
		        	
		        }
		        //end
		        if(error_message.contains("'"))
		        {
		        	error_message=error_message.replaceAll("'", "");
		        	
		        }
		      //add by kldipsinh 22-02-2022
	        	if(error_message.contains("###"))
	        	{
	        		String msg=error_message.split("###")[0];
//	        		System.out.println(msg);
	        		msgType=error_message.split("###")[1];
	        		error_message=msg;
	        	}
	        	//end
		        redirectAttribute.addFlashAttribute(Constants.MSG_NAME, error_message);
				redirectAttribute.addFlashAttribute(Constants.MSG_PRIORITY, msgType);
				redirectAttribute.addFlashAttribute(Constants.MSG_TITLE, "Files");
		       return "redirect:../loadFiles";
	    }
	 
	     @ExceptionHandler({ CustomeFileForwardExceptionCommonController.class})
	     public String  customeFileForwardExceptionCommonController(HttpServletRequest request,CustomeFileForwardExceptionCommonController exception,RedirectAttributes redirectAttribute) {
		 String uri=request.getHeader("referer");
		 String error_message="";
		 String msgType= Constants.MSG_PRIORITY_ERROR;
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
		        	
		        	 if (exception.getCause().getCause() != null) {
		        		 	if (exception.getCause().getCause().getCause() != null) {
								error_message=exception.getCause().getCause().getCause().getMessage();
							}
			        		 else
			        		 {
							error_message=exception.getCause().getCause().toString();
			        		 }
					} else {
						error_message=exception.getCause().toString();
					}
				} else {
					error_message=exception.getMessage();
				}
		        //add by kldipsinh 22-02-2022
		        if(error_message.contains("CustomeFileForwardExceptionCommonController:"))
		        {
		        	 error_message=error_message.split("CustomeFileForwardExceptionCommonController:")[1];
		        	
		        }
		        //end
		        if(error_message.contains("'"))
		        {
		        	error_message=error_message.replaceAll("'", "");
		        	
		        }
		      //add by kldipsinh 22-02-2022
	        	if(error_message.contains("###"))
	        	{
	        		String msg=error_message.split("###")[0];
//	        		System.out.println(msg);
	        		msgType=error_message.split("###")[1];
	        		error_message=msg;
	        	}
	        	//end
		        redirectAttribute.addFlashAttribute(Constants.MSG_NAME, error_message);
				redirectAttribute.addFlashAttribute(Constants.MSG_PRIORITY, msgType);
				redirectAttribute.addFlashAttribute(Constants.MSG_TITLE, "Files");
		       return "redirect:loadFiles";
	    }
	     
	     @ExceptionHandler({ CommonExceptionForAjax.class})
		    public ResponseEntity<ResponseBo>  CommonExceptionForAjax(HttpServletRequest request,CommonExceptionForAjax exception,RedirectAttributes redirectAttribute) {
		    	

		     Map<String, Object> errors =new HashMap<String, Object>();
		    	 errors.put("error_message",exception.getMessage());
		        ResponseBo aj=new ResponseBo();
		        aj.setValidated(false);
		        aj.setService_status(Integer.toString(Constants.ERROR_CODE));
//		        aj.setError_message(errors);
		        String error_message="";
		        if (exception.getCause() != null && !"".equals(exception.getCause())) {
		        	
		        	 if (exception.getCause().getCause() != null) {
		        		 	if (exception.getCause().getCause().getCause() != null) {
								error_message=exception.getCause().getCause().getCause().getMessage();
							}
			        		 else
			        		 {
							error_message=exception.getCause().getCause().toString();
			        		 }
					} else {
						error_message=exception.getCause().toString();
					}
				} else {
					error_message=exception.getMessage();
				}
		        //add by kldipsinh 22-02-2022
		        if(error_message.contains("CustomeFileForwardExceptionCommonController:"))
		        {
		        	 error_message=error_message.split("CustomeFileForwardExceptionCommonController:")[1];
		        	
		        }
		        //end
		        if(error_message.contains("'"))
		        {
		        	error_message=error_message.replaceAll("'", "");
		        	
		        }
		        aj.setService_message(error_message);
		        return ResponseEntity.ok(aj);
		    }
	
  // START :: SAJJAD
	      
		 	@SuppressWarnings("static-access")
			@ExceptionHandler({ ErrorRedirectException.class})
		    public String errorRedirectException(HttpServletRequest request,ErrorRedirectException exception,RedirectAttributes redirectAttribute) {
		    	
			 String uri=request.getHeader("referer");
			 String error_message="";
			 String msgType= Constants.MSG_PRIORITY_ERROR;
			 	  if(exception instanceof ErrorRedirectException)
			 	  {
			 		 error_message=exception.getMessage();
			 	  }
			 	  else {
				 		 if (exception.getCause() != null && !"".equals(exception.getCause())) {
					        	
				        	 if (exception.getCause().getCause() != null) {
				        		 	if (exception.getCause().getCause().getCause() != null) {
										error_message=exception.getCause().getCause().getCause().getMessage();
									}
					        		 else
					        		 {
									error_message=exception.getCause().getCause().toString();
					        		 }
							} else {
								error_message=exception.getCause().toString();
							}
						} else {
							error_message=exception.getMessage();
						}
			 	  }
			       
			        if(error_message.contains("'"))
			        {
			        	error_message=error_message.replaceAll("'", "");
			        	
			        }
		        	if(error_message.contains("###"))
		        	{
		        		String msg=error_message.split("###")[0];
		        		msgType=error_message.split("###")[1];
		        		error_message=msg;
		        	}
		        	String redirectString = exception.redirectString;
			        redirectAttribute.addFlashAttribute(Constants.MSG_NAME, error_message);
					redirectAttribute.addFlashAttribute(Constants.MSG_PRIORITY, msgType);
					redirectAttribute.addFlashAttribute(Constants.MSG_TITLE, "Files");
			        return "redirect:"+redirectString;
		    }
		 	
		 	 @ExceptionHandler(value = SecrateKeyNotFoundException.class)
			    public ResponseEntity<ResponseBo>  secrateKeyNotFoundException(SecrateKeyNotFoundException exception) {
			    	
			    	
				     Map<String, Object> errors =new HashMap<String, Object>();
				    	 errors.put("error_message",exception.getMessage());
				    	 ResponseBo aj=new ResponseBo();
				        aj.setValidated(false);
				        aj.setStatus(Constants.SECRATE_KEY_ERROR_CODE);
				        aj.setError_message(errors);
				        
				        if (exception.getCause() != null && !"".equals(exception.getCause())) {
							if (exception.getCause().getCause() != null) {
								aj.setMessage_description(exception.getCause().getCause().toString());
							} else {
								aj.setMessage_description(exception.getCause().toString());
							}
						} else {
							aj.setMessage_description(errors.toString());
						}
				        //add by kldipsinh 22-02-2022
				        if(aj.getMessage_description().contains("SecrateKeyNotFoundException:"))
				        {
				        	aj.setMessage_description(aj.getMessage_description().split("SecrateKeyNotFoundException:")[1]);
				        	
				        }
				        //end
				        if(aj.getMessage_description().contains("'"))
				        {
				        	aj.setMessage_description(aj.getMessage_description().replaceAll("'", ""));
				        	
				        }
				        
				        
				        return ResponseEntity.ok(aj);
			    }
		 
  // END :: SAJJAD

}