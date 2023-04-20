package vn.edu.hcmuaf.fit.constant;

public class APIConstants {
    public static String FACEBOOK_APP_ID = "5842543845823968";
    public static String FACEBOOK_APP_SECRET = "cc8a7eacb94a71acd8afc9db56d4b881";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/TTLTWeb_war_exploded/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    public static String GOOGLE_CLIENT_ID = "429868613240-b7ij0n2762it03pj9r5623l0a3qjlmnp.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/TTLTWeb_war_exploded/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    //    API Logistic
    public static String LOGISTIC_ID_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODEzMTI0MTEsImV4cCI6MTY4MTMxMzAxMSwibmJmIjoxNjgxMzEyNDExLCJqdGkiOiJORXZZNTdyNzFJVWRsN0RSIiwic3ViIjoiMzcwODE5NzNhZDY1NDE2MThhOGJmNGNiZTE2MzI4ZGUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ea-ycbFMAfoVbJk4ebcAs01J-6ALG7q8dR_b7nnJdEU";
    public static String LOGISTIC_HOST_API = "http://140.238.54.136/api";
    public static String LOGISTIC_EMAIL_LOGIN = "phonecarenlu@gmail.com";
    public static String LOGISTIC_PASSWORD_LOGIN = "Phonecarenlu123";
    public static int ID_DISTRICT_STORE = 3695;
    public static int ID_WARD_STORE = 90816;
}
