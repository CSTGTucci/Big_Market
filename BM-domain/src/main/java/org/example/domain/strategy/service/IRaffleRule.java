package org.example.domain.strategy.service;

import java.util.Map;

public interface IRaffleRule {
    Map<String,Integer> queryAwardRuleLockCount(String[] treeIds);
}
