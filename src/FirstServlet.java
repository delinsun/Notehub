import net.sf.json.JSONArray;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//说明这个Servlet是没有序列号的
@SuppressWarnings("serial")
//说明这个Servlet的名称是ajaxRequest，其地址是/ajaxRequest
//这与在web.xml中设置是一样的
@WebServlet("/Request")
public class FirstServlet extends HttpServlet {
    //create a list of data for search to search
    static List<String> datas;
    static {
        datas = new ArrayList<>();
        datas.add("ajax");
        datas.add("Oliver");
        datas.add("123");
        datas.add("red");
        datas.add("green");
        datas.add("blue");
    }

    //放置用户之间通过直接在浏览器输入地址访问这个servlet
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        //set the format
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // code for the search
        if(request.getParameter("keyword") != null){
            String keyword=request.getParameter("keyword");
            List<String> listData=getData(keyword);
            //System.out.println(JSONArray.fromObject(listData).toString());
            response.getWriter().write(JSONArray.fromObject(listData).toString());
        }

        //code for login
        else if(request.getParameter("param1") != null) {
            String url = request.getParameter("param1");
            String image = MD5Util.getImgURL(url);
            HttpSession session = request.getSession();
            session.setAttribute("image", image);
            session.setAttribute("email", url);
            response.sendRedirect("userProfile.jsp");
        }
    }

    //template function to generate a list of words to search
    public List<String> getData(String keyword){
        List<String> list = new ArrayList<>();
        for(String data:this.datas){
            if(data.contains(keyword)){
                list.add(data);
            }
        }
        return list;
    }
}
