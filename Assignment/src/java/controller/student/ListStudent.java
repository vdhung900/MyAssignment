/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import authentication.AuthorizationController;
import dal.StudentDBContext;
import entity.Account;
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
public class ListStudent extends AuthorizationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(request.getParameter("id"));
        StudentDBContext db = new StudentDBContext();
        ArrayList<Student> students = db.getStudentsByLessonId(leid);
        request.setAttribute("students", students);
        request.getRequestDispatcher("../StudentView/liststudent.jsp").forward(request, response);
    }

}
