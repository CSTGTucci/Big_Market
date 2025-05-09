package org.example.domain.credit.repository;

//import org.example.domain.credit.model.aggregate.TradeAggregate;


import org.example.domain.credit.model.aggregate.TradeAggregate;

public interface ICreditRepository {
    void saveUserCreditTradeOrder(TradeAggregate tradeAggregate);


    //void saveUserCreditTradeOrder(TradeAggregate tradeAggregate);

}
