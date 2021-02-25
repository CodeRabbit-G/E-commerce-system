package com.dao;

import com.po.MonthProfit;
import com.po.TypeProfit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("profitDao")
@Mapper
public interface ProfitDao {
    // 查询每月利润
    public List<MonthProfit> selectMonthProfit();
    // 查询各类型销售利润
    public List<TypeProfit> selectTypeProfit();
}
