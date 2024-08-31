package org.example.domain.strategy.service.Armory;

public interface IStrategyArmory {
    void assembleLotteryStrategy(Long strategyID);
    Integer getRandomAwardId(Long strategyID);
}
