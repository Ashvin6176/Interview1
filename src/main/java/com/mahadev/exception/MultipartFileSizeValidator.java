package com.mahadev.exception;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * {@code MultipartFileSizeValidator} is validator class for validation of the size of the uploaded file.
 *
 * @author Kuldipsinh Dabhi
 * @version 1.0, 15 Sep 2021
 * @since 1.0, 15 Sep 2021
 */
public class MultipartFileSizeValidator implements ConstraintValidator<MultipartFileSize, MultipartFile> {

    /**
     * Minimum size of file
     */
    private long min;

    /**
     * Maximum size of file
     */
    private long max;

    @Override
    public void initialize(MultipartFileSize constraintAnnotation) {
        min = constraintAnnotation.min();
        max = constraintAnnotation.max();
    }

    @Override
    public boolean isValid(MultipartFile value, ConstraintValidatorContext context) {
        if (value == null) {
            return true;
        }
        return !(value.getSize() < min || value.getSize() > max);
    }
}