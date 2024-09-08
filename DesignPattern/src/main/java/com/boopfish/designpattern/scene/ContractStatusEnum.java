package com.boopfish.designpattern.scene;

public enum ContractStatusEnum implements SceneEnumBase {
    /**
     * 生效中
     */
    STARTED,
    /**
     * 冻结
     */
    FROZEN,
    /**
     * 退出
     */
    CLOSED,
    /**
     * 没有开过
     */
    NO_ENTRY;

    /**
     * 获取实现枚举类的属性名称     * @return
     */
    @Override
    public String getSceneName() {
        return this.name();
    }
}