package com.kzh.sys.util.qiniu;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Created by xinyu.qiu on 2017/2/25.
 */
@Target({FIELD})
@Retention(RUNTIME)
public @interface ReturnBodyKey {
    String key();

    String keyTemplate();

}
