package vn.edu.hcmuaf.fit.controller.web;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.constant.APIConstants;
import vn.edu.hcmuaf.fit.model.BookingModel;
import vn.edu.hcmuaf.fit.model.ProductCartModel;
import vn.edu.hcmuaf.fit.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

@WebServlet(name = "LogisticAPIController", value = "/api/logistic")

public class LogisticAPIController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String param = request.getParameter("action");
        if ("province".equals(param)) {
            doGetProvince(request, response);
        }
    }

    private void doGetProvince(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String paramToken = request.getParameter("logisticIDToken");

        String apiURL = APIConstants.LOGISTIC_HOST_API + "/province";

        HttpClient client = HttpClientBuilder.create().build();
        HttpGet req = new HttpGet(apiURL);
        String token = (String) APIConstants.LOGISTIC_ID_TOKEN;
        req.addHeader("Authorization", "Bearer " + paramToken);

        try {
            HttpResponse res = client.execute(req);
            String responseString = EntityUtils.toString(res.getEntity(), "UTF-8");

            PrintWriter out = response.getWriter();
            out.println(responseString);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String param = request.getParameter("action");
        String logisticIDToken = request.getParameter("logisticIDToken");
        String toDistrictID = request.getParameter("to_district_id");
        String toWardID = request.getParameter("to_ward_id");
        String height = request.getParameter("height");
        String length = request.getParameter("length");
        String width = request.getParameter("width");
        String weight = request.getParameter("weight");
        String idBooking = request.getParameter("idBooking");

        if ("login".equals(param)) {
            doPostLogin(request, response);
        }
        //        get data lead time
        else if ("leadTime".equals(param))
            doPostLeadTime(request, response, logisticIDToken);
        else if ("registerTransport".equals(param))
            registerTransport(idBooking,logisticIDToken, toDistrictID, toWardID, height, length, width, weight);
        else if ("allTransports".equals(param))
            doPostAllTransports(request, response, logisticIDToken);
        else if ("getInfoTransport".equals(param))
            doPostGetInfoTransport(request, response, logisticIDToken);
    }

    private void doPostAllTransports(HttpServletRequest request, HttpServletResponse response, String logisticIDToken) throws IOException {
        String apiURL = APIConstants.LOGISTIC_HOST_API + "/allTransports";
        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        try {
            URL url = new URL(apiURL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + logisticIDToken);

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP Request Failed with Error code : "
                        + conn.getResponseCode());
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
            System.out.println("strBuf: " + strBuf);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }

        Gson gson = new Gson();
        JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

        PrintWriter out = response.getWriter();

        System.out.println(strBuf);

        out.println(strBuf);
        out.close();
    }

    private void doPostRegisterTransport(HttpServletRequest request, HttpServletResponse response, String logisticIDToken) throws IOException {
        String apiURL = APIConstants.LOGISTIC_HOST_API + "/registerTransport";
        Gson gson = new Gson();
        String stringRequest = request.getReader().readLine();
        JsonObject jsonRequest = gson.fromJson(stringRequest, JsonObject.class);

        JSONObject json = new JSONObject();
        json.put("from_district_id", APIConstants.ID_DISTRICT_STORE);
        json.put("'from_ward_id'", APIConstants.ID_WARD_STORE);
        json.put("to_district_id", jsonRequest.get("to_district_id").toString());
        json.put("to_ward_id", jsonRequest.get("to_ward_id").toString());
        json.put("height", jsonRequest.get("height").toString());
        json.put("length", jsonRequest.get("length").toString());
        json.put("width", jsonRequest.get("width").toString());
        json.put("weight", jsonRequest.get("weight").toString());

        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        try {
            URL url = new URL(apiURL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Access-Control-Allow-Origin", "*");
            conn.setRequestProperty("Authorization", "Bearer " + jsonRequest.get("logisticIDToken").toString());
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = json.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP POST Request Failed with Error code : "
                        + conn.getResponseCode());
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
            System.out.println("strBuf: " + strBuf);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }

        JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

        PrintWriter out = response.getWriter();

        System.out.println("jsonRes: " + jsonRes);

        out.println(jsonRes);
        out.close();
    }

    private void doPostLeadTime(HttpServletRequest request, HttpServletResponse response, String logisticIDToken) throws IOException {
        System.out.println("this");

        String apiURL = APIConstants.LOGISTIC_HOST_API + "/leadTime";

        BufferedReader br = request.getReader();
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            stringBuilder.append(line);
        }

        JSONObject json = new JSONObject();
        json.put("from_district_id", APIConstants.ID_DISTRICT_STORE);
        json.put("'from_ward_id'", APIConstants.ID_WARD_STORE);
        json.put("to_district_id", APIConstants.ID_DISTRICT_STORE);
        json.put("to_ward_id", APIConstants.ID_WARD_STORE);
        json.put("height", 100);
        json.put("length", 100);
        json.put("width", 100);
        json.put("weight", 100);

        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        try {
            URL url = new URL(apiURL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Access-Control-Allow-Origin", "http://140.238.54.136");
            conn.setRequestProperty("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
            conn.setRequestProperty("Access-Control-Max-Age", "3600");
            conn.setRequestProperty("Access-Control-Allow-Headers", "Content-Type, Authorization, X-Requested-With");

            conn.setRequestProperty("Authorization", "Bearer " + logisticIDToken);
            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = json.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP POST Request Failed with Error code : "
                        + conn.getResponseCode());
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
            System.out.println("strBuf: " + strBuf);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }

        Gson gson = new Gson();
        JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

        PrintWriter out = response.getWriter();
        out.println(strBuf);
        out.close();
    }

    private void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String apiURL = APIConstants.LOGISTIC_HOST_API + "/auth/login";

        JSONObject json = new JSONObject();
        json.put("password", APIConstants.LOGISTIC_PASSWORD_LOGIN);
        json.put("email", APIConstants.LOGISTIC_EMAIL_LOGIN);

        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        try {
            URL url = new URL(apiURL);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Accept", "application/json");

            conn.setDoOutput(true);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = json.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP POST Request Failed with Error code : "
                        + conn.getResponseCode());
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }

        Gson gson = new Gson();
        JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

        APIConstants.LOGISTIC_ID_TOKEN = jsonRes.get("access_token").toString();

        PrintWriter out = response.getWriter();

        out.println(APIConstants.LOGISTIC_ID_TOKEN);
        out.close();
    }

    public static String registerTransport(String idBooking, String logisticIDToken, String toDistrictID, String toWardID, String height, String length, String width, String weight) throws IOException {

//        {
//            "message": "Registered Transport successfully",
//            "Transport": {
//                    "email": "phonecarenlu@gmail.com",
//                    "fromDistrictID": "2264",
//                    "fromWardID": "90816",
//                    "toDistrictID": "2270",
//                    "toWardID": "231013",
//                    "height": "200",
//                    "length": "200",
//                    "width": "150",
//                    "weight": "150",
//                    "fee": 5312000,
//                    "leadTime": 1684454399,
//                    "active": true,
//                    "id": "4a810604e3e449cb80bab41e70f83bfa",
//                    "updated_at": "2023-05-15T15:35:39.000000Z",
//                    "created_at": "2023-05-15T15:35:39.000000Z"
//            }
//        }

        String apiURL = APIConstants.LOGISTIC_HOST_API + "/registerTransport";
        String param = "?from_district_id=" + APIConstants.ID_DISTRICT_STORE + "&from_ward_id=" + APIConstants.ID_WARD_STORE + "&to_district_id=" + toDistrictID + "&to_ward_id=" + toWardID + "&height=" + height + "&length=" + length + "&width=" + width + "&weight=" + weight;
        StringBuilder strBuf = new StringBuilder();

        URL url = new URL(apiURL + param);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + logisticIDToken);
        int responseCode = conn.getResponseCode();
        if (responseCode == 200 | responseCode == 201) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }

            Gson gson = new Gson();
            JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

            JsonObject objTransport = jsonRes.get("Transport").getAsJsonObject();
            String idTransport = objTransport.get("id").getAsString();


            System.out.println("idTransport: "+idTransport);
            BookingModel bookingModel = new BookingModel();
            bookingModel.setId(idBooking);
            bookingModel.setIdTransport(idTransport);

            BookingService.updateBookingIDTransport(bookingModel);
        }
        System.out.println(strBuf);
        return strBuf.toString();



    }

    private void doPostGetInfoTransport(HttpServletRequest request, HttpServletResponse response, String logisticIDToken) throws IOException {
        String idTransport = request.getParameter("id");
        String apiURL = APIConstants.LOGISTIC_HOST_API + "/getInfoTransport";
        String param = "?id=" + idTransport;
        StringBuilder strBuf = new StringBuilder();
        PrintWriter out = response.getWriter();

        URL url = new URL(apiURL + param);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + logisticIDToken);
        int responseCode = conn.getResponseCode();

        if (responseCode == 200 | responseCode == 201) {

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
        }
        out.println(strBuf.toString());
        out.close();
    }

}
