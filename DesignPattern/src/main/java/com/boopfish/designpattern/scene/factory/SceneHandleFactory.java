package com.boopfish.designpattern.scene.factory;

import com.boopfish.designpattern.scene.ContractStatusEnum;
import com.boopfish.designpattern.scene.SceneHandleType;
import com.boopfish.designpattern.scene.SceneHandlerBase;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class SceneHandleFactory<A> implements ApplicationContextAware, InitializingBean {

    private final Map<String, List<SceneHandlerBase>> statusMap = new HashMap<>();
    private ApplicationContext applicationContext;


    /**
     * 工厂类初始化的时候执行此方法，将Bean 存入 map 中，后续可以直接取
     *
     * @throws Exception
     */
    @Override
    public void afterPropertiesSet() throws Exception {

        Map<String, SceneHandlerBase> recommendStrategyMap = applicationContext.getBeansOfType(SceneHandlerBase.class);
        if (recommendStrategyMap.isEmpty()) {
            return;
        }
        for (SceneHandlerBase strategy : recommendStrategyMap.values()) {
            SceneHandleType statusType = strategy.getClass().getAnnotation(SceneHandleType.class);
            if (null == statusType) {
                continue;
            }
            String statusValue = statusType.value();
            if (null == statusValue) {
                continue;
            }
            // 同一个场景值可能存在多个实现类
            List<SceneHandlerBase> list = statusMap.getOrDefault(statusValue, new ArrayList<>());
            list.add(strategy);
            statusMap.put(statusValue, list);
        }

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    /**
     * 获取具体的策略执行类
     *
     * @param status
     * @return
     */
    public SceneHandlerBase getSceneHandle(ContractStatusEnum status, A prams) {
        String statusType = String.join(".", status.getClass().getName(), status.getSceneName());
        //拼接出枚举全地址
        List<SceneHandlerBase> sceneHandlerBaseList = statusMap.get(statusType);
        if (CollectionUtils.isEmpty(sceneHandlerBaseList)) {
            return null;
        }
        return sceneHandlerBaseList.stream()
                .filter(f -> f.judgeCondition(prams))
                .findFirst()
                .orElse(null);
    }

}
