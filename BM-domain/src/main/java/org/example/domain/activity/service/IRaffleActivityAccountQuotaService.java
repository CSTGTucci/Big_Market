package org.example.domain.activity.service;

import org.example.domain.activity.model.entity.*;

public interface IRaffleActivityAccountQuotaService {


    ActivityOrderEntity createRaffleActivityOrder(ActivityShopCartEntity activityShopCartEntity);


    UnpaidActivityOrderEntity createOrder(SkuRechargeEntity skuRechargeEntity);

    /**
     * 订单出货 - 积分充值
     * @param deliveryOrderEntity 出货单实体对象
     */
    void updateOrder(DeliveryOrderEntity deliveryOrderEntity);

    Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId);
    ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId);

    Integer queryRaffleActivityAccountPartakeCount(Long activityId, String userId);

}
