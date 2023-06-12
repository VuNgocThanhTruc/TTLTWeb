package vn.edu.hcmuaf.fit.model;

import java.util.Date;

public class VisitorModel {
    private java.util.Date date;
    private int amount;

    public VisitorModel(Date date, int amount) {
        this.date = date;
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "VisitorModel{" +
                "date=" + date +
                ", amount=" + amount +
                '}';
    }
}
