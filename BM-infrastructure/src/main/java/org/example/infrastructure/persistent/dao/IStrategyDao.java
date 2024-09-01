package org.example.infrastructure.persistent.dao;

import org.apache.ibatis.annotations.Mapper;
import org.example.infrastructure.persistent.po.Award;
import org.example.infrastructure.persistent.po.Strategy;

import java.util.List;

@Mapper
public interface IStrategyDao {

    Strategy queryStrategyEntityByStrategyId(Long strategyID);

    List<Strategy> queryStrategyList();
}
