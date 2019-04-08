package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.Board;

public class BoardViewActionProcess implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, 
											HttpServletResponse response) throws Throwable {
		
		
		return "/BoardView.do";
	}

}
