package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.MailProperties;
import vn.edu.hcmuaf.fit.service.MailServices;

public class Mail {
    public static void main(String[] args) {
        MailServices.sendMail("20130379@st.hcmuaf.edu.vn","Test","LTW");
    }
}
