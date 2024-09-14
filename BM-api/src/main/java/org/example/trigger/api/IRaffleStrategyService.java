package org.example.trigger.api;

import org.example.trigger.api.dto.RaffleAwardListRequestDTO;
import org.example.trigger.api.dto.RaffleAwardListResponseDTO;
import org.example.trigger.api.dto.RaffleStrategyRequestDTO;
import org.example.trigger.api.dto.RaffleStrategyResponseDTO;
import org.example.types.model.Response;

import java.util.List;

public interface IRaffleStrategyService {

    //策略装配
    Response<Boolean> strategyArmory(Long strategyId);
    //查询奖品列表
    Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(RaffleAwardListRequestDTO requestDTO);
    //随机抽奖
    Response<RaffleStrategyResponseDTO> randomRaffle(RaffleStrategyRequestDTO requestDTO);
}
