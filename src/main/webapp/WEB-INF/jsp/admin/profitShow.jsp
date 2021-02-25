<%--
  Created by IntelliJ IDEA.
  User: Guo_SY
  Date: 2020/7/5
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta charset="utf-8">
        <title>每月销售盈利</title>
        <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    </head>
    <body>
    <h2>每月销售盈利</h2>
        <table>
            <td>
                <div style="margin-left: 20px;">
                    <c:if test="${monthProfitList!=null}">
                        <table border="2">
                            <h3>每月销售盈利表</h3>
                            <tr>
                                <td>月 份</td>
                                <td>利 润</td>
                            </tr>
                            <c:forEach items="${monthProfitList}" var="monthPro">
                                <tr>
                                    <td>${monthPro.year}-${monthPro.month}&nbsp;&nbsp;</td>
                                    <td>${monthPro.amount}&yen;&nbsp;&nbsp;</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </td>
            <td>
                <div style="margin-left: 50px;">
                    <!-- 为ECharts准备的显示容器 -->
                    <div id="MonthProfit" style="width: 500px;height:350px;"></div>
                </div>
            </td>
        </table>
        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('MonthProfit'),'light');
            var option = {
                title: {
                    text: '销售盈利柱形图'
                },
                tooltip: {},
                xAxis: {
                    data: ${month}
                },
                yAxis: {},
                series: [{
                    name: '销售利润',
                    type: 'bar',
                    data: ${profit}
                }]
            };

            myChart.setOption(option);
        </script>
    </body>
</html>
