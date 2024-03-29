/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import authentication.AuthorizationController;
import dal.LessonDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendance;
import entity.Lesson;
import entity.Role;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author vdhung
 */
public class TakeAttendance extends AuthorizationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        StudentDBContext db = new StudentDBContext();
        ArrayList<Student> students = db.getStudentsByLessonId(leid);
        Lesson lesson = new Lesson();
        lesson.setId(leid);
        ArrayList<Attendance> atts = new ArrayList<>();
        for (Student student : students) {
            Attendance att = new Attendance();
            att.setStudent(student);
            att.setLesson(lesson);
            att.setDescription(req.getParameter("description" + student.getId()));
            att.setPresent(req.getParameter("present" + student.getId()).equals("yes"));

            atts.add(att);
        }
        LessonDBContext lesDB = new LessonDBContext();
        lesDB.takeAttendance(leid, atts);
        resp.sendRedirect("takeattendance?id=" + leid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        LessonDBContext lesDB = new LessonDBContext();
        ArrayList<Attendance> atts = lesDB.getAttendencesByLesson(leid);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../LecturerView/attendance.jsp").forward(req, resp);
    }

}
