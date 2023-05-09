package vn.edu.hcmuaf.fit.bean;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.db.DBConnect;

    public abstract class AbBean {
    public abstract boolean insert(Jdbi db);
}
