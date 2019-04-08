package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.Member;

public class BoardWriteFormProcess implements CommandProcess {

	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		Member member = new Member();
		member.setId(id);
		MemberDAO dao = MemberDAO.getInstance();
		Member m = dao.getNameById(member);
		request.setAttribute("name", m.getName());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		return "./board/writeForm.jsp";
	}

}
