package org.example.domain.credit.service;

import org.example.domain.credit.model.entity.CreditAccountEntity;
import org.example.domain.credit.model.entity.TradeEntity;

public interface ICreditAdjustService {

    /**
     * 创建增加积分额度订单
     * @param tradeEntity 交易实体对象
     * @return 单号
     */
    String createOrder(TradeEntity tradeEntity);

    /**
     * 查询用户积分账户
     * @param userId 用户ID
     * @return 积分账户实体
     */
    CreditAccountEntity queryUserCreditAccount(String userId);

}
