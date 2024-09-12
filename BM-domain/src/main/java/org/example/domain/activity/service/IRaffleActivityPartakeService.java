package org.example.domain.activity.service;

import org.example.domain.activity.model.entity.PartakeRaffleActivityEntity;
import org.example.domain.activity.model.entity.UserRaffleOrderEntity;

public interface IRaffleActivityPartakeService {
    //创建抽奖单，如果有未被使用的直接返回抽奖单
    UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);
}
