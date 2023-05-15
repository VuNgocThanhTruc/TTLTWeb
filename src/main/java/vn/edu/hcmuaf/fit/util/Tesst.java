package vn.edu.hcmuaf.fit.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.constant.APIConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class Tesst {

    public static String doPostLogin() throws IOException {

        String apiURL = APIConstants.LOGISTIC_HOST_API + "/auth/login";

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

        return jsonRes.get("access_token").toString();
    }

    public static String registerTranport() throws IOException {
        String apiURL = "http://140.238.54.136/api/registerTransport";
        String param = "?from_district_id=" + APIConstants.ID_DISTRICT_STORE + "&from_ward_id=" + APIConstants.ID_WARD_STORE + "&to_district_id=" + 2270 + "&to_ward_id=" + 231013 + "&height=" + 231013 + "&length=" + 231013 + "&width=" + 231013 + "&weight=" + 23101;
        StringBuilder strBuf = new StringBuilder();

        URL url = new URL(apiURL + param);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODQxMTYwMDcsImV4cCI6MTY4NDExNjYwNywibmJmIjoxNjg0MTE2MDA3LCJqdGkiOiJkd2NWdGpmSTlWQWhDcnRxIiwic3ViIjoiMzcwODE5NzNhZDY1NDE2MThhOGJmNGNiZTE2MzI4ZGUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.TS2cS-h91iUO7ImjUDgna4lg5hDU_MGS3KAkjOHCXd4");
        int responseCode = conn.getResponseCode();
        System.out.println(responseCode);
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            strBuf.append(inputLine);
        }
        System.out.println("strBuf: " + strBuf);
        return strBuf.toString();
    }

    public static void main(String[] args) throws IOException {
        System.out.println(Tesst.registerTranport());
    }
}
