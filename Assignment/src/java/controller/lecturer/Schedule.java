/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import authentication.AuthenticationController;
import dal.LessonDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Lesson;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import util.DateTimeHelper;

/**
 *
 * @author vdhung
 */
public class Schedule extends AuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("id"));
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        Date from = null;
        Date to = null;
        java.util.Date today = new java.util.Date();
        if (raw_from == null) {
            from = DateTimeHelper.convertUtilToSql(DateTimeHelper.getBeginningOfWeek(today));
            request.setAttribute("currentweek", DateTimeHelper.getCurrentWeekFormatted());
        } else {
            from = Date.valueOf(raw_from);
        }

        if (raw_to == null) {
            java.util.Date beginWeek = DateTimeHelper.getBeginningOfWeek(today);
            to = DateTimeHelper.convertUtilToSql(DateTimeHelper.addDaysToDate(beginWeek, 6));
        } else {
            to = Date.valueOf(raw_to);
        }
        LessonDBContext lessDB = new LessonDBContext();
        ArrayList<Lesson> lessons = lessDB.getLessonByDateLecturer(lid, from, to);
        
        
        
        int year = 2024; // Thay thế bằng năm bạn quan tâm
        List<String> formattedWeeks = DateTimeHelper.getWeeksInYearFormatted(year);
        request.setAttribute("formattedWeeks", formattedWeeks);
        
        request.setAttribute("dates", DateTimeHelper.toList(from, to));
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("slots", slots);
        request.setAttribute("lessons", lessons);
        request.getRequestDispatcher("../LecturerView/lecschedule.jsp").forward(request, response);
    }

}
