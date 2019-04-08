package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardWriteActionProcess implements CommandProcess {

	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		BoardDAO dao = BoardDAO.getInstance();
		Board board = new Board();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String regist_day = sdf.format(new Date());
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
		
		
		return "/BoardList.do?pageNum=" + pageNum + "&items=" + items + "&text=" + text;
	}

}
