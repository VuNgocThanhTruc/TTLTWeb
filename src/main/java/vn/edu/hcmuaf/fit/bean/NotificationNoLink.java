package vn.edu.hcmuaf.fit.bean;

import org.jdbi.v3.core.Jdbi;

import java.sql.Timestamp;

public class NotificationNoLink extends Notification{
    public NotificationNoLink(String id, String id_user, String title, Timestamp time, boolean checked) {
        super(id, id_user, title, time, checked);
    }
    public NotificationNoLink(String id_user, String title, Timestamp time, boolean checked) {
        super(id_user, title, time, checked);
    }

    public NotificationNoLink(String id_user, String title) {
        super(id_user, title);
    }

    @Override
    public boolean insert(Jdbi db) {
        return false;
    }
}
