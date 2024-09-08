package com.boopfish.designpattern.scene;


public abstract class AbstractSceneHandleBase<A, T, G> implements SceneHandlerBase<A, T, G> {

    public abstract G execute(T params);

    @Override
    public G doCallBack(T params) {
        try {
            return execute(params);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Boolean judgeCondition(A params) {
        return true;
    }

}
