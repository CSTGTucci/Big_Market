package org.example.domain.strategy.repository;

import org.example.domain.strategy.model.StrategyAwardEntity;
import org.example.domain.strategy.model.StrategyEntity;
import org.example.domain.strategy.model.StrategyRuleEntity;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public interface IStrategyRepository {
    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    void storeStrategyAwardSearchRateTables(String key, Integer rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTables);

    int getRateRange(Long strategyID);
    int getRateRange(String key);

    Integer getStrategyAwardAssemble(String key, int rateKey);

    StrategyEntity queryStrategyEntityByStrategyId(Long strategyID);

    StrategyRuleEntity queryStrategyRule(Long strategyID, String ruleModel);
}
