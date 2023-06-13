package vn.edu.hcmuaf.fit.bean;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public abstract class Notification {
    private String id;
    private String id_user;
    private String title;
    private Timestamp time;
    private boolean checked;
    public Notification(String id, String id_user, String title, Timestamp time, boolean checked) {
        this.id = id;
        this.id_user = id_user;
        this.title = title;
        this.time = time;
        this.checked = checked;
    }
    public Notification(String id_user, String title, Timestamp time, boolean checked) {
        this.id_user = id_user;
        this.title = title;
        this.time = time;
        this.checked = checked;
    }
    public Notification(String id_user, String title) {
        this.id_user = id_user;
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "id_user='" + id_user + '\'' +
                ", title='" + title + '\'' +
                ", time=" + time +
                ", checked=" + checked +
                '}';
    }
    public String formatTimeAgo() {
        LocalDateTime dateTime = getTime().toLocalDateTime();
        LocalDateTime now = LocalDateTime.now();
        long seconds = ChronoUnit.SECONDS.between(dateTime, now);
        if (seconds < 60) {
            return seconds + " giây trước";
        } else if (seconds < 3600) {
            long minutes = ChronoUnit.MINUTES.between(dateTime, now);
            return minutes + " phút trước";
        } else if (seconds < 86400) {
            long hours = ChronoUnit.HOURS.between(dateTime, now);
            return hours + " giờ trước";
        }  else if (seconds < 2592000) {
            long days = ChronoUnit.DAYS.between(dateTime, now);
            return days + " ngày trước";
        } else if (seconds < 31536000) {
            long months = ChronoUnit.MONTHS.between(dateTime, now);
            return months + " tháng trước";
        } else {
            long years = ChronoUnit.YEARS.between(dateTime, now);
            return years + " năm trước";
        }
    }
    public abstract boolean insert(Jdbi db);
}
