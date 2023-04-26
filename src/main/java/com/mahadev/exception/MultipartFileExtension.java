package com.mahadev.exception;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * {@code MultipartFileExtension} annotation is for validation of extension of the file.
 *
  * @author Kuldipsinh Dabhi
 * @version 1.0, 15 Sep 2021
 * @since 1.0, 15 Sep 2021

 */
@Documented
@Constraint(validatedBy = MultipartExtensionValidator.class)
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MultipartFileExtension {

    /**
     * Validation Message
     *
     * @return validation message
     */
    String message() default "Invalid file extension";

    /**
     * Valid extensions of the uploaded file
     *
     * @return file extensions
     */
    String[] extension();

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