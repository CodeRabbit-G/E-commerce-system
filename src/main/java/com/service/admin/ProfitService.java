package com.service.admin;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface ProfitService {
    // 查询每月利润
    public void selectProfit(HttpSession session);
    // 查询各类型销售利润
    public void profitChart(HttpSession session);
}
