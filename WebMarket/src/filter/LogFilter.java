package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	//
	PrintWriter writer;

	public void destroy() {
		//파일 자원 해제
		writer.close();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		writer.printf("현재 일시: %s %n",getCurrentTime());//%s문자열 %n =\n
		String clinetAddr = request.getRemoteAddr();
		writer.printf("클라이언트 주소: %s %n", clinetAddr);
		writer.print("접근한 URL경로:"+getURLPath(request));
		writer.printf("요청 처리 시간:"+getCurrentTime());
		long start =System.currentTimeMillis();
			chain.doFilter(request, response);
		long end = System.currentTimeMillis();
			String contentType = response.getContentType();
			writer.printf("요청 종료 시간:"+getCurrentTime());
			writer.printf("요청 처리 소요 시간:"+(end-start)+"ms");
			writer.printf("-------------------------------------");
	}

	private String getURLPath(ServletRequest request) {
		 HttpServletRequest req;
		 String currentPath="";
		 String queryString="";
		 if(request instanceof HttpServletRequest) {
			 req=(HttpServletRequest)request;
			 currentPath=req.getRequestURI();
			 queryString =req.getQueryString();
			 queryString = queryString==null?"":"?"+queryString;
		 }
		return currentPath + queryString;
	}

	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
      String filename=fConfig.getInitParameter("filename");
      System.out.println("파일명---:"+filename);
      if(filename==null) throw new ServletException("로그파일을 찾을 수 없습니다.");
      try {
    	      writer = new PrintWriter(new FileWriter(filename,true),true);
      }catch(IOException e) {
    	   throw new ServletException("로그 파일을 열수 없습니다.");
      }
	}

}
