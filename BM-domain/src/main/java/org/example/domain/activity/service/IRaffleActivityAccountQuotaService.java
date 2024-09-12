package org.example.domain.activity.service;

import org.example.domain.activity.model.entity.ActivityOrderEntity;
import org.example.domain.activity.model.entity.ActivityShopCartEntity;
import org.example.domain.activity.model.entity.SkuRechargeEntity;

public interface IRaffleActivityAccountQuotaService {


    ActivityOrderEntity createRaffleActivityOrder(ActivityShopCartEntity activityShopCartEntity);


    String createOrder(SkuRechargeEntity skuRechargeEntity);
}
