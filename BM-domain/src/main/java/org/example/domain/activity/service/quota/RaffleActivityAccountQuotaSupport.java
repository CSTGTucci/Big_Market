package org.example.domain.activity.service.quota;

import org.example.domain.activity.model.entity.ActivityCountEntity;
import org.example.domain.activity.model.entity.ActivityEntity;
import org.example.domain.activity.model.entity.ActivitySkuEntity;
import org.example.domain.activity.repository.IActivityRepository;
import org.example.domain.activity.service.quota.rule.factory.DefaultActivityChainFactory;

public class RaffleActivityAccountQuotaSupport {

    protected DefaultActivityChainFactory defaultActivityChainFactory;
    protected IActivityRepository activityRepository;

    public RaffleActivityAccountQuotaSupport(IActivityRepository activityRepository, DefaultActivityChainFactory defaultActivityChainFactory) {
        this.activityRepository = activityRepository;
        this.defaultActivityChainFactory = defaultActivityChainFactory;
    }

    public ActivitySkuEntity queryActivitySku(Long sku) {
        return activityRepository.queryActivitySku(sku);
    }
    public ActivityEntity queryRaffleActivityCountByActivityId(Long activityId) {
        return activityRepository.queryRaffleActivityByActivityId(activityId);
    }
    public ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId){
        return activityRepository.queryRaffleActivityCountByActivityCountId(activityCountId);
    }
}
