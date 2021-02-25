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
    <title>商品类型销售图表</title>
    <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
</head>
    <body>
    <h2>商品类型销售图表</h2>
    <table>
        <td>
            <div style="margin-left: 20px;">
                <c:if test="${typeProfitList!=null}">
                    <table border="2">
                        <h3>商品类型销售盈利表</h3>
                        <tr>
                            <td>商品类型</td>
                            <td>销售盈利</td>
                        </tr>
                        <c:forEach items="${typeProfitList}" var="typePro">
                            <tr>
                                <td>${typePro.typename}&nbsp;&nbsp;</td>
                                <td>${typePro.amount}&yen;&nbsp;&nbsp;</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </td>
        <td>
            <div style="margin-left: 50px;">
                <!-- 为ECharts准备的显示容器 -->
                <div id="typeProfit" style="width: 500px;height:350px;"></div>
            </div>
        </td>
    </table>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('typeProfit'),'light');
        var option = {
            title: {
                text: '销售盈利柱形图'
            },
            tooltip: {},
            xAxis: {
                data: ${typename}
            },
            yAxis: {},
            series: [{
                name: '销售利润',
                type: 'bar',
                data: ${amount}
            }]
        };
        myChart.setOption(option);
    </script>
    </body>
</html>
