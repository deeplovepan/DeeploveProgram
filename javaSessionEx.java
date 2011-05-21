import javax.servlet.http.HttpSession;
HttpSession session = request.getSession();
session.setAttribute("test", "hello");