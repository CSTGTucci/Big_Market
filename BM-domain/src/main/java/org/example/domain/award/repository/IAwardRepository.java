package org.example.domain.award.repository;

import org.example.domain.award.model.agreegate.UserAwardRecordAggregate;
import org.example.domain.award.model.entity.UserAwardRecordEntity;

public interface IAwardRepository {

    void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate);

}
