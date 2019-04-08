package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, CommandProcess> commandMap = new HashMap<String, CommandProcess>();
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("config");
		Properties pr = new Properties();
		
		FileInputStream f = null;
		try {
			String filePath = config.getServletContext().getRealPath(props);
			f = new FileInputStream(filePath);
			pr.load(f);
			Iterator<Object> keyItor = pr.keySet().iterator();
			while(keyItor.hasNext()) {
				String command = (String)keyItor.next();
				String className = pr.getProperty(command);
				Class commandClass = Class.forName(className);
				CommandProcess instance = (CommandProcess)commandClass.newInstance();
				
				commandMap.put(command, instance);
			}
		} catch(Exception e) { e.printStackTrace(); }
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
			}
			com = commandMap.get(command);
			view = com.requestPro(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		} catch(Throwable e) {
			e.printStackTrace();
		}
	}
}

