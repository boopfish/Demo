package com.boopfish.designpattern.scene.controller;


import com.boopfish.designpattern.scene.*;
import com.boopfish.designpattern.scene.factory.SceneHandleFactory;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 工厂模式+策略模式
 */
@RestController
@RequestMapping("/contract")
public class ContractController {

    @Resource
    private SceneHandleFactory sceneHandleFactory;

    @PostMapping("/start")
    public Result<Boolean> contractStart(Object params) {
        SceneHandlerBase<User, ContractEvent, Result<Boolean>> sceneHandlerBase = sceneHandleFactory.getSceneHandle(ContractStatusEnum.STARTED,new User());
        ContractEvent contractEvent = new ContractEvent();
        return sceneHandlerBase.doCallBack(contractEvent);


    }


    @PostMapping("/close")
    public Result<Boolean> contractClose(Object params) {
        SceneHandlerBase<User, ContractEvent, Result<Boolean>> sceneHandlerBase = sceneHandleFactory.getSceneHandle(ContractStatusEnum.CLOSED,null);
        ContractEvent contractEvent = new ContractEvent();
        return sceneHandlerBase.doCallBack(contractEvent);
    }
}
