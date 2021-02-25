package com.dao;

import com.po.MonthProfit;
import com.po.TypeProfit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("profitDao")
@Mapper
public interface ProfitDao {
    // ��ѯÿ������
    public List<MonthProfit> selectMonthProfit();
    // ��ѯ��������������
    public List<TypeProfit> selectTypeProfit();
}
