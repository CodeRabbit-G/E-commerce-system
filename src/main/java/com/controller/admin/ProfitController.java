package com.controller.admin;

import com.service.admin.ProfitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/profit")
class ProfitController extends BaseController{
    @Autowired
    private ProfitService profitService;

    // 每月利润
    @RequestMapping("/toProfitShow")
    public String toProfitShow(HttpSession session) {
        profitService.selectProfit(session);
        return "admin/profitShow";
    }

    // 各类型销售利润
    @RequestMapping("/toProfitChart")
    public String toProfitChart(HttpSession session) {
        profitService.profitChart(session);
        return "admin/profitChart";
    }
}
