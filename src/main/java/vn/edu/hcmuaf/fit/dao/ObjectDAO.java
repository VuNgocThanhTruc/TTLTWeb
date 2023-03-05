package vn.edu.hcmuaf.fit.dao;

public interface ObjectDAO {
    public boolean add(Object obj);
    public boolean del(String id);
    public boolean edit(String id , Object obj);

    public void read();

}
