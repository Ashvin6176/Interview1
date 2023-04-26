package com.mahadev.exception;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * {@code MultipartFileSize} annotation is for validation of size of the multipart file.
 *
  * @author Kuldipsinh Dabhi
 * @version 1.0, 15 Sep 2021
 * @since 1.0, 15 Sep 2021

 */
@Documented
@Constraint(validatedBy = MultipartFileSizeValidator.class)
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MultipartFileSize {

    /**
     * Validation Message
     *
     * @return validation message
     */
    String message() default "The size of the files must be between {min} and {max} bytes.";

    /**
     * Minimum size of uploaded file.
     *
     * @return minimum size
     */
    long min() default 0;

    /**
     * Maximum size of uploaded file
     *
     * @return max size
     */
    long max() default Long.MAX_VALUE;

    /**
     * 
     * @return class
     */
    Class<?>[] groups() default {};

    /**
     * 
     * @return payload
     */
    Class<? extends Payload>[] payload() default {};
}