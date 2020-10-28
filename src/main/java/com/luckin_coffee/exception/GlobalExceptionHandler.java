package com.luckin_coffee.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 全局异常处理拦截器
 */
public class GlobalExceptionHandler {

    private static final String logExceptionFormat = "Capture Exception By GlobalExceptionHandler: Code: %s Detail: %s";

    private static Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

}
