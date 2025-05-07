package org.example.domain.rebate.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.domain.rebate.model.valobj.BehaviorTypeVO;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class BehaviorEntity {
    private String userId;
    private BehaviorTypeVO behaviorTypeVO;
    private String outBusinessNo;
}
