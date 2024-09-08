package com.boopfish.designpattern.scene.service;


import com.boopfish.designpattern.scene.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
@SceneHandleType("com.boopfish.designpattern.scene.ContractStatusEnum.CLOSED")
@Service
@Slf4j
public class ContractClosedSceneHandleImpl extends AbstractSceneHandleBase<User, ContractEvent, Result<Boolean>> {

    @Override
    public Result<Boolean> execute(ContractEvent params) {
        //解约成功，执行写入签约表
        log.info("解约成功，执行写入签约表 解约成功，执行写入签约表");
        return new Result<>();
    }

    @Override
    public Boolean judgeCondition(User params) {
        return true;
    }

}
