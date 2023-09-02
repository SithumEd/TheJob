package servlets;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author HP
 */
public class InsertDB {
    
    public static void main(String[]args){
        
        System.out.println("testing");
        insertData("test@gmail.com","1234567");
    }
    public static void insertData(String email, String password){
        
        try{
            Connection cn = DBconn.getConnection();
            String checkQuery = "SELECT COUNT(*) FROM users WHERE email = ?";
        PreparedStatement checkStatement = cn.prepareStatement(checkQuery);
        checkStatement.setString(1, email);
        ResultSet resultSet = checkStatement.executeQuery();
        resultSet.next();
        int userCount = resultSet.getInt(1);
        
        if (userCount == 0) {
            // Email doesn't exist, so insert the data
            String insertQuery = "INSERT INTO users (email, passwords) VALUES (?, ?)";
            PreparedStatement insertStatement = cn.prepareStatement(insertQuery);
            insertStatement.setString(1, email);
            insertStatement.setString(2, password);
            insertStatement.executeUpdate();
            System.out.println("User added");
            insertStatement.close();
        } else {
            System.out.println("User with this email already exists. Data not inserted.");
        }
        
        resultSet.close();
        checkStatement.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
        
    }
}
