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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
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

        if ("login".equals(param)) {
            doPostLogin(request, response);
        }
        //        get data lead time
        if ("leadTime".equals(param))
            doPostLeadTime(request, response, logisticIDToken);
    }

    private void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String apiURL = APIConstants.LOGISTIC_HOST_API + "/auth/login";

        BufferedReader br = request.getReader();
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            stringBuilder.append(line);
        }

        JSONObject json = new JSONObject();
        json.put("password", APIConstants.LOGISTIC_PASSWORD_LOGIN);
        json.put("email", APIConstants.LOGISTIC_EMAIL_LOGIN);

        StringBuilder strBuf = new StringBuilder();

        HttpURLConnection conn = null;
        BufferedReader reader = null;
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

            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

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
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
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

    private void doPostLeadTime(HttpServletRequest request, HttpServletResponse response, String logisticIDToken) throws IOException {

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
        BufferedReader reader = null;
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

            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strBuf.append(inputLine);
            }
            System.out.println("strBuf: "+strBuf);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                conn.disconnect();
            }
        }

        Gson gson = new Gson();
        JsonObject jsonRes = gson.fromJson(strBuf.toString(), JsonObject.class);

//        APIConstants.LOGISTIC_ID_TOKEN = jsonRes.get("access_token").toString();

        PrintWriter out = response.getWriter();

        System.out.println(strBuf);

        out.println(strBuf);
        out.close();
    }
}
