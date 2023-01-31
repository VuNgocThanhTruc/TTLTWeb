package vn.edu.hcmuaf.fit.dao;
import java.util.Map;
import vn.edu.hcmuaf.fit.model.User;

public interface ObjectDAO {
    public boolean add(Object obj);
    public boolean del(String id);
    public boolean edit(String id , Object obj);

    public void read();

}
