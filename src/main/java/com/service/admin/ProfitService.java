package com.service.admin;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface ProfitService {
    // ��ѯÿ������
    public void selectProfit(HttpSession session);
    // ��ѯ��������������
    public void profitChart(HttpSession session);
}
