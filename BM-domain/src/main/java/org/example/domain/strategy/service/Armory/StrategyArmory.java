package org.example.domain.strategy.service.Armory;

import lombok.extern.slf4j.Slf4j;
import org.example.domain.strategy.model.StrategyAwardEntity;
import org.example.domain.strategy.repository.IStrategyRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.SecureRandom;
import java.util.*;

@Slf4j
@Service
public class StrategyArmory implements IStrategyArmory{
    @Resource
    private IStrategyRepository repository;

    @Override
    public void assembleLotteryStrategy(Long strategyID) {
        //1.查询策略配置
        List<StrategyAwardEntity> strategyAwardEntities = repository.queryStrategyAwardList(strategyID);

        //2.获取最小概率值
        BigDecimal minAwardRate = strategyAwardEntities
                .stream().
                map(StrategyAwardEntity::getAwardRate)
                .min(BigDecimal::compareTo)
                .orElse(BigDecimal.ZERO);
        //3.获取概率总和
        BigDecimal totalAwardRate = strategyAwardEntities
                .stream()
                .map(StrategyAwardEntity::getAwardRate)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        //4.获取概率范围
        BigDecimal rateRange = totalAwardRate.divide(minAwardRate, 0, RoundingMode.CEILING);
        //5.生成策略
        ArrayList<Integer> strategyAwardSearchRateTables = new ArrayList<>(rateRange.intValue());
        for(StrategyAwardEntity strategyAwardEntity : strategyAwardEntities){
            Integer awardId = strategyAwardEntity.getAwardId();
            BigDecimal awardRate = strategyAwardEntity.getAwardRate();
            for(int i=0;i<rateRange.multiply(awardRate).setScale(0,RoundingMode.CEILING).intValue();i++){
                strategyAwardSearchRateTables.add(awardId);
            }
        }
        //6.乱序
        Collections.shuffle(strategyAwardSearchRateTables);
        //7.生成map
        HashMap<Integer,Integer> shuffleStrategyAwardSearchRateTable = new HashMap<>();
        for(int i=0;i<strategyAwardSearchRateTables.size();i++){
            shuffleStrategyAwardSearchRateTable.put(i, strategyAwardSearchRateTables.get(i));
        }
        //8.存储进入redis
        repository.storeStrategyAwardSearchRateTables(strategyID , shuffleStrategyAwardSearchRateTable.size() , shuffleStrategyAwardSearchRateTable);
    }

    @Override
    public Integer getRandomAwardId(Long strategyID) {
        int rateRange = repository.getRateRange(strategyID);
        return repository.getStrategyAwardAssemble(strategyID,new SecureRandom().nextInt(rateRange));
    }
}
