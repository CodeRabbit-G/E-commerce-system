package com.service.admin;

import com.dao.ProfitDao;
import com.po.MonthProfit;
import com.po.TypeProfit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service("profitService")
@Transactional
public class ProfitServiceImpl implements ProfitService {
    @Autowired
    ProfitDao profitDao;
    // 查询每月利润
    @Override
    public void selectProfit(HttpSession session) {
/*        List<MonthProfit> list = profitDao.selectMonthProfit();
        String month = "";
        String profit = "";
        for (MonthProfit monthPro : list) {
            month = month + "\"" + monthPro.getMonth() + "\",";
            profit = profit + "\"" + monthPro.getAmount() + "\",";
        }
        session.setAttribute("monthProfitList", list);
        session.setAttribute("month", month.substring(0, month.length() - 1));
        session.setAttribute("profit", profit.substring(0, profit.length() - 1));*/

        List<MonthProfit> list = profitDao.selectMonthProfit();
        List<String> month = new ArrayList<>();
        List<Double> profit = new ArrayList<>();
        for (MonthProfit monthPro : list) {
            month.add("\"" + monthPro.getMonth() + "月\"");
            profit.add(monthPro.getAmount());
        }
        session.setAttribute("monthProfitList", list);
        session.setAttribute("month", month);
        session.setAttribute("profit", profit);
    }
    // 查询各类型销售利润
    @Override
    public void profitChart(HttpSession session) {
        List<TypeProfit> list = profitDao.selectTypeProfit();
        List<String> typename = new ArrayList<>();
        List<Double> amount = new ArrayList<>();
        for (TypeProfit typePro : list) {
            typename.add("\"" + typePro.gettypename() + "\"");
            amount.add(typePro.getAmount());
        }
        session.setAttribute("typeProfitList", list);
        session.setAttribute("typename", typename);
        session.setAttribute("amount", amount);
    }
}
