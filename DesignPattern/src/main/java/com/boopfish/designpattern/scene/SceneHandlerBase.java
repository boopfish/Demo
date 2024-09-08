package com.boopfish.designpattern.scene;

public interface SceneHandlerBase<A, T, G> {

    G doCallBack(T params);

    /**
     * 同一个枚举值如果有多个场景实现类，可以通过这个来实现
     * @param params
     * @return
     */
    Boolean judgeCondition(A params);
}
