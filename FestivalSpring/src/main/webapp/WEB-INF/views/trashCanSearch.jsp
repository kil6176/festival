<?xml version="1.0" encoding="UTF-8" ?>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.festival.dto.TrashCanVO" %>
<%@ page import="com.spring.festival.dao.TrashCanDAO" %>
<%@ page contentType="text/xml" pageEncoding="UTF-8" %>

<%
	int contentID = Integer.parseInt(request.getParameter("contentID"));

    request.setCharacterEncoding("utf-8");

     TrashCanDAO trashCan = new TrashCanDAO();

     ArrayList<TrashCanVO> canList = new ArrayList<TrashCanVO>();

     canList = trashCan.trashCan_Search(contentID);
%>
    <contents>
<%
	for(TrashCanVO can : (ArrayList<TrashCanVO>)canList) 
    {
%>
        <can>
            <id><%=can.getID() %></id>
            <trashHeight><%=can.getTRASH_HEIGHT()%></trashHeight>
            <canSize><%=can.getCAN_SIZE() %></canSize>
            <canX><%=can.getCAN_X() %></canX>
            <canY><%=can.getCAN_Y()%></canY>
            <date><%=can.getDATE()%></date>
            <groupName><%=can.getGROUP_NAME()%></groupName>
            <contentId><%=can.getCONTENT_ID()%></contentId>
        </can>
<%
    }
%>

    </contents>