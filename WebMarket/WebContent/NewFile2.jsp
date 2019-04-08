<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String key="=1urMkWeG4AIrsZLtKfZHsjWxjkFpeoivaSYQ2Byk131xqgbQpONjZk4htR9NXDK4zzmzh13r8bcprfGY1PcLyQ%3D%3D" ;%>
<%
StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/service/ForecastZoneInfoService/ForecastZoneCodeDataInfo"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + key); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11A00101", "UTF-8")); /*예보구역코드(가이드 참조)*/
URL url = new URL(urlBuilder.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json");
System.out.println("Response code: " + conn.getResponseCode());
BufferedReader rd;
if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
} else {
    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
}
StringBuilder sb = new StringBuilder();
String line;
while ((line = rd.readLine()) != null) {
    sb.append(line);
}
rd.close();
conn.disconnect();
System.out.println(sb.toString());

%>
</body>
</html>