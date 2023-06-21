package vn.edu.hcmuaf.fit.bean;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.Timestamp;
import java.util.Date;

public class NotificationHasLink extends Notification{
    private String linkNotify;
    public NotificationHasLink(String id, String id_user, String title, Timestamp time, boolean checked, String linkNotify) {
        super(id, id_user, title, time, checked);
        this.linkNotify = linkNotify;
    }

    public NotificationHasLink(String id_user, String title, Timestamp time, boolean checked, String linkNotify) {
        super(id_user, title, time, checked);
        this.linkNotify = linkNotify;
    }

    public NotificationHasLink(String id_user, String title, String linkNotify) {
        super(id_user, title);
        this.linkNotify = linkNotify;
    }

    public String getLinkNotify() {
        return linkNotify;
    }

    public void setLinkNotify(String linkNotify) {
        this.linkNotify = linkNotify;
    }

    @Override
    public boolean insert(Jdbi db) {
        Integer i = db.withHandle(handle ->
                handle.execute("INSERT INTO notifications(`id_user`, `title`, `time`, `linkNotify`, `checked`)  VALUES(?,?,NOW(),?,false)",
                         this.getId_user() == null ? null : getId_user(), this.getTitle(), this.getLinkNotify())
        );
        return i==1;
    }
}
