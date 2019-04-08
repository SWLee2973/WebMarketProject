package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardUpdateActionProcess implements CommandProcess {

	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String sPageNum = request.getParameter("pageNum");
		String sNum = request.getParameter("num");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		//수정한 내용을 파라미터로 받기
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		//Board 빈 생성하여 파라미터 셋팅
		Board board = new Board();
		board.setNum(Integer.parseInt(sNum));
		board.setName(name);
		board.setSubject(subject);
		board.setContent(content);
		//게시글 수정처ㅣ
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateBoard(board);
		
		return "/BoardList.do?pageNum="+sPageNum
                +"&num="+sNum+"&items="+items+"&text="+text;
	}

}
