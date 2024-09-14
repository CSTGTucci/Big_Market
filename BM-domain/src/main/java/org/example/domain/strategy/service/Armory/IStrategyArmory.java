package org.example.domain.strategy.service.Armory;

public interface IStrategyArmory {
    boolean assembleLotteryStrategyByActivityId(Long activityId);
    boolean assembleLotteryStrategy(Long strategyID);
}
