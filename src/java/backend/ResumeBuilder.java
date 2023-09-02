/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class ResumeBuilder extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        try {
            HttpSession session = req.getSession();
            String name = (String) session.getAttribute("session_name");
            String email = (String) session.getAttribute("session_email");
            String profilepic  = (String)session.getAttribute("session_profilepic");

            String address2 = req.getParameter("address1");
            String career2 = req.getParameter("career1");
            String date2 = req.getParameter("date1");
            String marital2 = req.getParameter("marital1");
            String language2 = req.getParameter("language1");
            String hobbies2 = req.getParameter("hobbies1");

            String pdf_file_name = name + ".pdf";

            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(ProfilePath.profile_builder_path + pdf_file_name));

            document.open();

            String font_name = "Arial";
            float font_size = 30;
            int style = Font.BOLD;

            Paragraph title = new Paragraph("Resume", FontFactory.getFont(font_name, font_size, style, BaseColor.RED));
            document.add(title);

            Paragraph emptyspace = new Paragraph(" ");
            document.add(emptyspace);
            
            Image image1  =Image.getInstance(ProfilePath.Profile_Pic_Path+profilepic);
            image1.scaleAbsolute(100f, 100f);
            document.add(image1);
            
            // names and email
            Paragraph names = new Paragraph(name);
            document.add(names);

            Paragraph emails = new Paragraph("(" + email + ")", FontFactory.getFont("Arial", 10));
            document.add(emails);
            document.add(emptyspace);

            // career   
            Paragraph career_title = new Paragraph("Career Objective", FontFactory.getFont("Arial", 15, Font.BOLD, BaseColor.BLACK));
            document.add(career_title);
            document.add(emptyspace);

            Paragraph career = new Paragraph(career2);
            document.add(career);

        // educational details
            Paragraph edu_title = new Paragraph("Education", FontFactory.getFont("Arial", 15, Font.BOLD, BaseColor.BLACK));
            document.add(edu_title);
            document.add(emptyspace);

            PdfPTable table = new PdfPTable(4);
            table.spacingBefore();

            PdfPCell c1 = new PdfPCell(new Phrase("Year"));
            table.addCell(c1);

            PdfPCell c2 = new PdfPCell(new Phrase("Schhol/College"));
            table.addCell(c2);

            PdfPCell c3 = new PdfPCell(new Phrase("Degree"));
            table.addCell(c3);

            PdfPCell c4 = new PdfPCell(new Phrase("Grade"));
            table.addCell(c4);

            String year1 = "", school1 = "", degree1 = "", grade1 = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                PreparedStatement ps1 = con.prepareStatement("select * from add_education where email=? ");
                ps1.setString(1, email);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    year1 = rs1.getString("year");
                    school1 = rs1.getString("school");
                    degree1 = rs1.getString("degree");
                    grade1 = rs1.getString("grade");

                    table.addCell(year1);
                    table.addCell(school1);
                    table.addCell(degree1);
                    table.addCell(grade1);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            document.add(table);

        //experience details
            Paragraph exp_title = new Paragraph("Experience", FontFactory.getFont("Arial", 15, Font.BOLD, BaseColor.BLACK));
            document.add(exp_title);
            document.add(emptyspace);

            PdfPTable table1 = new PdfPTable(4);
            table1.setSpacingBefore(10);

            PdfPCell c5 = new PdfPCell(new Phrase("Year"));
            table1.addCell(c5);

            PdfPCell c6 = new PdfPCell(new Phrase("Company"));
            table1.addCell(c6);

            PdfPCell c7 = new PdfPCell(new Phrase("Job Title"));
            table1.addCell(c7);

            PdfPCell c8 = new PdfPCell(new Phrase("Location"));
            table1.addCell(c8);

            String year2 = "", company1 = "", jobtitle1 = "", location1 = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                PreparedStatement ps2 = con2.prepareStatement("select * from add_experience where email=? ");
                ps2.setString(1, email);
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    year2 = rs2.getString("year");
                    company1 = rs2.getString("company");
                    jobtitle1 = rs2.getString("job_title");
                    location1 = rs2.getString("location");

                    table1.addCell(year2);
                    table1.addCell(company1);
                    table1.addCell(jobtitle1);
                    table1.addCell(location1);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            document.add(table1);

            Paragraph personal_title = new Paragraph("Personal Details", FontFactory.getFont("Arial", 15, Font.BOLD, BaseColor.BLACK));
            document.add(personal_title);
            document.add(emptyspace);

            Paragraph dob = new Paragraph("Date of Birth:" + date2);
            document.add(dob);
            document.add(emptyspace);

            Paragraph marital = new Paragraph("Status::" + marital2);
            document.add(marital);
            document.add(emptyspace);

            Paragraph lang = new Paragraph("Language:" + language2);
            document.add(lang);
            document.add(emptyspace);

            Paragraph hobby = new Paragraph("Hobbies:" + hobbies2);
            document.add(hobby);
            document.add(emptyspace);
            
            Paragraph addr = new Paragraph("Address:" + address2);
            document.add(addr);
            document.add(emptyspace);

            document.close();
            resp.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
