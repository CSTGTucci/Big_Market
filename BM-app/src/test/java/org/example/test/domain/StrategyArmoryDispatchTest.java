package org.example.test.domain;

import lombok.extern.slf4j.Slf4j;
import org.example.domain.strategy.service.Armory.IStrategyArmory;
import org.example.domain.strategy.service.Armory.IStrategyDispatch;
import org.example.infrastructure.persistent.dao.IStrategyRuleDao;
import org.example.infrastructure.persistent.po.StrategyRule;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class StrategyArmoryDispatchTest {
    @Resource
    private IStrategyArmory strategyArmory;
    @Resource
    private IStrategyDispatch strategyDispatch;
    @Resource
    private IStrategyRuleDao strategyRuleDao;
    @Before
    public void test_strategyArmory() {
        boolean success =  strategyArmory.assembleLotteryStrategy(100001L);
        log.info("测试结果:{}",success);
//        StrategyRule rule = new StrategyRule();
//        rule.setStrategyId(10001L);
//        rule.setRuleModel("rule_random");
//        log.info(strategyRuleDao.queryStrategyRule(rule).toString());
    }
    @Test
    public void test_getAssembleRandomAwardId(){
        log.info("测试结果：{} - 奖品",strategyDispatch.getRandomAwardId(100001L));
        //log.info(strategyRuleDao.queryStrategyRuleList().toString());
    }
    @Test
    public void test_getAssembleRandomAwardId_ruleWeightValue(){
        for(int i=0;i<10;i++){
            log.info("测试结果：{} - 4000配置",strategyDispatch.getRandomAwardId(10001L,"4000:101,102"));
        }
        for(int i=0;i<10;i++){
            log.info("测试结果：{} - 6000配置",strategyDispatch.getRandomAwardId(10001L,"6000:101,102,103,104,105"));
        }


    }
}
