package com.dao;

import java.util.List;
import java.util.Map;

import com.po.Goods;
import com.po.MonthProfit;
import com.po.TypeProfit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("adminOrderDao")
@Mapper
public interface AdminOrderDao {
	public List<Map<String,Object>> orderInfo();
	public int deleteOrderDetail(Integer id);
	public int deleteOrderBase(Integer id);
}
