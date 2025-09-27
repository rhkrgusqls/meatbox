<%@ page import="java.nio.file.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String v1Str = request.getParameter("value1");
    String v2Str = request.getParameter("value2");
    String symbol = request.getParameter("symbol");

    if (v1Str == null || v2Str == null || symbol == null) {
        String path = application.getRealPath("/calculator.html");
        String html = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");
        out.write(html);
    } else {
        double result = 0;
        boolean valid = true;

        try {
            double v1 = Double.parseDouble(v1Str);
            double v2 = Double.parseDouble(v2Str);
            switch(symbol) {
                case "+": result = v1 + v2; break;
                case "-": result = v1 - v2; break;
                case "*": result = v1 * v2; break;
                case "/": 
                    if (v2 != 0) result = v1 / v2;
                    else valid = false;
                    break;
                default: valid = false;
            }
        } catch(Exception e) {
            valid = false;
        }

        String path = application.getRealPath("/result.html");
        String html = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");

        String output = valid ? String.valueOf(result) : "입력값이 올바르지 않거나 나눌 수 없습니다.";
        html = html.replace("<h4 id=\"result\"></h4>", "<h4 id=\"result\">" + output + "</h4>");

        out.write(html);
    }
%>
