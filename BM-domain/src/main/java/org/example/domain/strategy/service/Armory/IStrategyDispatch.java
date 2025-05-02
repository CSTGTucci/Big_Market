package org.example.domain.strategy.service.Armory;

import java.util.Date;

public interface IStrategyDispatch {
    Integer getRandomAwardId(Long strategyID);
    Integer getRandomAwardId(Long strategyID,String ruleWeightValue);
    Boolean subtractionAwardStock(Long strategyId, Integer awardId, Date endDateTime);
}
