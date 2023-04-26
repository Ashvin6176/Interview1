package com.mahadev.exception;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.web.multipart.MultipartFile;

/**
 * {@code MultipartExtensionValidator} is validator class for validating extension of uploaded file/multipart file.
 *
  * @author Kuldipsinh Dabhi
 * @version 1.0, 15 Sep 2021
 * @since 1.0, 15 Sep 2021
 */
public class MultipartExtensionValidator implements ConstraintValidator<MultipartFileExtension, MultipartFile> {

    /**
     * String array of allowed extensions
     */
    private String[] extensions;

    @Override
    public void initialize(MultipartFileExtension constraintAnnotation) {
        extensions = constraintAnnotation.extension();
    }

    @Override
    public boolean isValid(MultipartFile value, ConstraintValidatorContext context) {
    	boolean isValid = false;
    	if(value != null) {
    		for (String extension : extensions) {
                if (value.getOriginalFilename().toLowerCase().endsWith(extension.toLowerCase())) {
                    return true;
                }
            }
    	}else {
    		isValid = true;
    	}
        return isValid;
    }
}