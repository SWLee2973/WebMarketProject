package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardListProcess implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		//넘어온 request의 문자셋을 utf-8로 설정
		request.setCharacterEncoding("utf-8");
		BoardDAO dao = BoardDAO.getInstance();
		List<Board> boardList = new ArrayList<Board>();
		
		//페이징 처리
		int pageNum = 1; // 전체 페이지 시작 번호
		int limit = 10; //한 페이지당 보여줄 게시글의 개수
		//글 자세히 보기, 수정처리 후 다시 해당 페이지로 돌아오기 위한 장치 pageNum
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		int total_record = dao.getListCount(items, text);
		boardList = dao.getBoardList(pageNum, limit, items, text);
		
		//
		int total_page;
		if(total_record % limit == 0) { // 예) 게시글 100개인경우 10페이지 10개씩
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit; //예) 게시글 106개인경우 10페이지 10개씩 + 1페이지 6개
			Math.floor(total_page);
			total_page = total_page + 1;
		}
		
		//./board/list.jsp에서 받는 attribute
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardList);
		//검색조건, 검색어 추가
		request.setAttribute("items", items);
		request.setAttribute("text", text);
		
		//이동할 jsp
		return "./board/list.jsp";
	}

}
