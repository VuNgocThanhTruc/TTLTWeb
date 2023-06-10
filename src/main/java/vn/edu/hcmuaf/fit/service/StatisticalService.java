package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.DBConnect;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class StatisticalService {

    public static List<Map<String, Object>> dailyStatisticsAccess(){
        List<Map<String, Object>> dailyStatistics = new ArrayList<>();

        String sql = "SELECT date_access, SUM(amount) AS total_amount FROM number_visitors GROUP BY date_access ORDER BY date_access DESC LIMIT 10";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                Date dateAccess = rs.getDate(1);
                Integer amountAccess = rs.getInt(2);
                int month = dateAccess.getMonth()+1;
                String dateAccessString = dateAccess.getDate()+"/"+ month;
                data.put("date", dateAccessString);
                data.put("amount", amountAccess);
                dailyStatistics.add(data);
            }
        }catch (Exception e){
            e.getMessage();
        }
        Collections.reverse(dailyStatistics);
        return dailyStatistics;
    }


    public static List<Map<String, Object>> monthlyStatistics (){
        List<Map<String, Object>> dailyStatistics = new ArrayList<>();

        String sql = "SELECT CONCAT(MONTH(date_access), '/', YEAR(date_access)) AS month_year, SUM(amount) AS total_amount FROM number_visitors GROUP BY month_year ORDER BY date_access DESC LIMIT 12";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                String dateAccess = rs.getString(1);
                Integer amountAccess = rs.getInt(2);
                data.put("month", dateAccess);
                data.put("amount", amountAccess);
                dailyStatistics.add(data);
            }
        }catch (Exception e){
            e.getMessage();
        }
        Collections.reverse(dailyStatistics);
        return dailyStatistics;
    }

    public static List<Map<String, Object>> yearlyStatistics  (){
        List<Map<String, Object>> dailyStatistics = new ArrayList<>();

        String sql = "SELECT YEAR(date_access) AS year, SUM(amount) AS total_amount FROM number_visitors GROUP BY YEAR(date_access) ORDER BY date_access DESC LIMIT 10";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                String yearAccess = rs.getString(1);
                Integer amountAccess = rs.getInt(2);
                data.put("year", yearAccess);
                data.put("amount", amountAccess);
                dailyStatistics.add(data);
            }
        }catch (Exception e){
            e.getMessage();
        }
        Collections.reverse(dailyStatistics);
        return dailyStatistics;
    }
    public static List<String> getDailyStatisticsAccess(){
        List<String> result = new ArrayList<>();
        List<Map<String, Object>> dailyStatistics = dailyStatisticsAccess();
        String dailyXValues = "[";
        String dailyYValues = "[";
        for(Map<String, Object> data: dailyStatistics){
            dailyXValues += "\"" +data.get("date")+"\""+",";
            dailyYValues += "\"" + data.get("amount")+"\""+",";
        }
        dailyXValues = dailyXValues.substring(0, dailyXValues.length()-1) + "]";
        dailyYValues = dailyYValues.substring(0, dailyYValues.length()-1) + "]";
        result.add(0, dailyXValues);
        result.add(1, dailyYValues);
        return result;
    }

    public static List<String> getMonthlyStatisticsAccess(){
        List<String> result = new ArrayList<>();
        List<Map<String, Object>> monthlyStatistics = monthlyStatistics();
        String monthlyXValues = "[";
        String monthlyYValues = "[";
        for(Map<String, Object> data: monthlyStatistics){
            monthlyXValues += "\"" + data.get("month")+"\""+",";
            monthlyYValues += "\"" + data.get("amount")+"\""+",";
        }
        monthlyXValues = monthlyXValues.substring(0, monthlyXValues.length()-1) + "]";
        monthlyYValues = monthlyYValues.substring(0, monthlyYValues.length()-1) + "]";
        result.add(0, monthlyXValues);
        result.add(1, monthlyYValues);
        return result;
    }

    public static List<String> getYearlyStatisticsAccess(){
        List<String> result = new ArrayList<>();
        List<Map<String, Object>> yearlyStatistics = yearlyStatistics();
        String yearlyXValues = "[";
        String yearlyYValues = "[";
        for(Map<String, Object> data: yearlyStatistics){
            yearlyXValues += "\""+"Năm " +data.get("year")+"\""+",";
            yearlyYValues += "\""  + data.get("amount")+"\""+",";
        }
        yearlyXValues = yearlyXValues.substring(0, yearlyXValues.length()-1) + "]";
        yearlyYValues = yearlyYValues.substring(0, yearlyYValues.length()-1) + "]";
        result.add(0, yearlyXValues);
        result.add(1, yearlyYValues);
        return result;
    }

    public static List<Map<String, Object>> ipWarningStatistics(){
        List<Map<String, Object>> dailyStatistics = new ArrayList<>();

        String sql = "SELECT ip_address, number_warning AS number_of_warnings FROM ip_address_log GROUP BY ip_address ORDER BY ip_address DESC LIMIT 10";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                String ip = rs.getString(1);
                Integer amountWarning = rs.getInt(2);
                data.put("ip", ip);
                data.put("amount", amountWarning);
                dailyStatistics.add(data);
            }
        }catch (Exception e){
            e.getMessage();
        }
        return dailyStatistics;
    }


    public static List<Map<String, Object>> userWarningStatistics(){
        List<Map<String, Object>> dailyStatistics = new ArrayList<>();

        String sql = "SELECT id_user, modified_date, number_warning AS number_of_warnings, locked FROM user_log GROUP BY id_user ORDER BY id_user DESC LIMIT 10";
        try {
            PreparedStatement ps = DBConnect.getInstall().preStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> data = new HashMap<>();
                String id = rs.getString(1);
                Date modified_date = rs.getDate(2);
                Integer amountWarning = rs.getInt(3);
                Boolean locked = rs.getBoolean(4);
                data.put("id", id);
                data.put("modified_date", modified_date);
                data.put("amount", amountWarning);
                data.put("locked", locked);
                dailyStatistics.add(data);
            }
        }catch (Exception e){
            e.getMessage();
        }
        return dailyStatistics;
    }
}
