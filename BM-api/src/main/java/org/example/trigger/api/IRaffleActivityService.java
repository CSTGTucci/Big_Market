package org.example.trigger.api;

import org.example.trigger.api.dto.ActivityDrawRequestDTO;
import org.example.trigger.api.dto.ActivityDrawResponseDTO;
import org.example.types.model.Response;

public interface IRaffleActivityService {
    Response<Boolean> armory(Long activityId);
    Response<ActivityDrawResponseDTO> draw(ActivityDrawRequestDTO activityDrawRequestDTO);
}
