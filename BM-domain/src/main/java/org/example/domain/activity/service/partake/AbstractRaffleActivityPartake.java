package org.example.domain.activity.service.partake;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import org.example.domain.activity.model.entity.ActivityEntity;
import org.example.domain.activity.model.entity.PartakeRaffleActivityEntity;
import org.example.domain.activity.model.entity.UserRaffleOrderEntity;
import org.example.domain.activity.model.valobj.ActivityStateVO;
import org.example.domain.activity.repository.IActivityRepository;
import org.example.domain.activity.service.IRaffleActivityPartakeService;
import org.example.types.enums.ResponseCode;
import org.example.types.exception.AppException;

import java.util.Date;

@Slf4j
public abstract class AbstractRaffleActivityPartake implements IRaffleActivityPartakeService {

    protected final IActivityRepository activityRepository;

    protected AbstractRaffleActivityPartake(IActivityRepository activityRepository) {
        this.activityRepository = activityRepository;
    }


    @Override
    public UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity) {
        //基础信息
        String userId = partakeRaffleActivityEntity.getUserId();
        Long activityId = partakeRaffleActivityEntity.getActivityId();
        Date currentDate = new Date();
        //活动检验
        ActivityEntity activityEntity = activityRepository.queryRaffleActivityByActivityId(activityId);
        if(!ActivityStateVO.open.equals(activityEntity.getState())){
            throw new AppException(ResponseCode.ACTIVITY_STATE_ERROR.getCode(),ResponseCode.ACTIVITY_STATE_ERROR.getInfo());
        }
        if(activityEntity.getBeginDateTime().after(currentDate)||activityEntity.getEndDateTime().before(currentDate)){
            throw new AppException(ResponseCode.ACTIVITY_DATE_ERROR.getCode(),ResponseCode.ACTIVITY_DATE_ERROR.getInfo());
        }
        //查询未被使用的订单
        UserRaffleOrderEntity userRaffleOrderEntity = activityRepository.queryNoUsedRaffleOrder(partakeRaffleActivityEntity);
        if(null != userRaffleOrderEntity){
            log.info("创建参与活动订单 userId:{} activityId:{} userRaffleOrderEntity:{}", userId, activityId, JSON.toJSONString(userRaffleOrderEntity));
            return userRaffleOrderEntity;
        }
        //过滤账户额度并且返回聚合对象
        CreatePartakeOrderAggregate createPartakeOrderAggregate = this.doFilter(userId,activityId,currentDate);
        //创建订单
        UserRaffleOrderEntity userRaffleOrder = this.buildUserRaffleOrder(userId,activityId,currentDate);
        // 5. 填充抽奖单实体对象
        createPartakeOrderAggregate.setUserRaffleOrderEntity(userRaffleOrder);
        // 6. 保存聚合对象 - 一个领域内的一个聚合是一个事务操作
        activityRepository.saveCreatePartakeOrderAggregate(createPartakeOrderAggregate);

        // 7. 返回订单信息
        return userRaffleOrder;
    }

    protected abstract UserRaffleOrderEntity buildUserRaffleOrder(String userId, Long activityId, Date currentDate);

    protected abstract CreatePartakeOrderAggregate doFilter(String userId, Long activityId, Date currentDate);

}
