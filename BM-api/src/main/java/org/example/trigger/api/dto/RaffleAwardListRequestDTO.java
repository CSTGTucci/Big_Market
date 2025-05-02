package org.example.trigger.api.dto;

import lombok.Data;

@Data
public class RaffleAwardListRequestDTO {
    @Deprecated
    Long strategyId;
    // 活动id
    private Long activityId;
    // 用户id
    private String userId;

}
