package com.boopfish.designpattern.scene;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
public @interface SceneHandleType {

    String value();
}
