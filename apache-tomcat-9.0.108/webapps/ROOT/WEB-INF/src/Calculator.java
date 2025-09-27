import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Calculator extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        // 값이 없으면 최초 화면 (calculator.html)
        String v1Str = request.getParameter("value1");
        String v2Str = request.getParameter("value2");
        String symbol = request.getParameter("symbol");

        if (v1Str == null || v2Str == null || symbol == null) {
            // 최초 접속 → calculator.html 출력
            String path = getServletContext().getRealPath("/calculator.html");

            String html = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");
            out.write(html);
        } else {
            // 계산 수행 → result.html 출력
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
                        if(v2 != 0) result = v1 / v2;
                        else valid = false;
                        break;
                    default: valid = false;
                }
            } catch(Exception e) {
                valid = false;
            }

            String path = getServletContext().getRealPath("/result.html");
            String html = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");

            String output = valid ? String.valueOf(result) : "입력값이 올바르지 않거나 나눌 수 없습니다.";
            html = html.replace("<h4 id=\"result\"></h4>", "<h4 id=\"result\">" + output + "</h4>");

            out.write(html);
        }

        out.close();
    }
}
