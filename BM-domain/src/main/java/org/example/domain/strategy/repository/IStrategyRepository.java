package org.example.domain.strategy.repository;

import org.example.domain.strategy.model.entity.StrategyAwardEntity;
import org.example.domain.strategy.model.entity.StrategyEntity;
import org.example.domain.strategy.model.entity.StrategyRuleEntity;
import org.example.domain.strategy.model.valobj.RuleTreeVO;
import org.example.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import org.example.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

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

    String queryStrategyRuleValue(Long strategyId, Integer awardId, String ruleModel);

    String queryStrategyRuleValue(Long strategyId, String ruleModel);

    StrategyAwardRuleModelVO queryStrategyAwardRuleModel(Long strategyId, Integer awardId);

    RuleTreeVO queryRuleTreeVOByTreeId(String treeId);

    StrategyAwardRuleModelVO queryStrategyAwardRuleModelVO(Long strategyId, Integer awardId);

    void cacheStrategyAwardCount(String cacheKey, Integer awardCount);

    Boolean subtractionAwardStock(String cacheKey);

    void awardStockConsumeSendQueue(StrategyAwardStockKeyVO strategyAwardStockKeyVO);

    /**
     * 获取奖品库存消费队列
     */
    StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 更新奖品库存消耗
     *
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     */
    void updateStrategyAwardStock(Long strategyId, Integer awardId);

    StrategyAwardEntity queryStrategyAwardEntity(Long strategyId, Integer awardId);
}
