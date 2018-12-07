package com.dlw.monitor.platform.utils;

import org.springframework.web.bind.annotation.Mapping;
import java.lang.annotation.*;

/**
 * @author chhy
 * @desc 注解
 * @date 2018-06-01
 */
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Mapping
@Documented
public @interface SecurityParameter {

    /**
     * 入参是否解密，默认解密
     */
    boolean inDecode() default true;

    /**
     * 出参是否加密，默认加密
     */
    boolean outEncode() default true;
}