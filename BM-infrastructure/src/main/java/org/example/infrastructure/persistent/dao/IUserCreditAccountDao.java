package org.example.infrastructure.persistent.dao;

import org.example.infrastructure.persistent.po.UserCreditAccount;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IUserCreditAccountDao {

    void insert(UserCreditAccount userCreditAccountReq);

    int updateAddAmount(UserCreditAccount userCreditAccountReq);

}
