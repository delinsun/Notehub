import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//说明这个Servlet是没有序列号的
@SuppressWarnings("serial")
//说明这个Servlet的名称是ajaxRequest，其地址是/ajaxRequest
//这与在web.xml中设置是一样的
@WebServlet("/Request")
public class FirstServlet extends HttpServlet {
    //放置用户之间通过直接在浏览器输入地址访问这个servlet
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("param1");
        String image = MD5Util.getImgURL(url);
        HttpSession session = request.getSession();
        session.setAttribute("image",image);
        session.setAttribute("email",url);
        response.sendRedirect("userProfile.jsp");

    }
}
