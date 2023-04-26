package com.mahadev.exception;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

public abstract class BaseResource extends CommonBaseResource {

    @Autowired
    private MessageSource messageSource;
   

    protected String resolve(String key, String... arg) {
        return messageSource.getMessage(key, arg, LocaleContextHolder.getLocale());
    }

    
}
