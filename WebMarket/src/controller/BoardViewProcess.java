package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardViewProcess implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String sNum = request.getParameter("num");
		String sPageNum = request.getParameter("pageNum");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int num = Integer.parseInt(sNum);
		int pageNum = Integer.parseInt(sPageNum);
		
		//db에서 해당 글번호의 계시물 정보를 추출
		Board board = new Board();
		BoardDAO dao = BoardDAO.getInstance();
		board = dao.getBoard(num, pageNum);
		
		//이동할 페이지에서 사용할 객체를 request에 저장
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		
		return "./board/view.jsp";
	}

}
