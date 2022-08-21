package repository.employee;

import model.*;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    void insertEmployee(Employee employee) throws SQLException;

    void insertUserName(User user) throws SQLException;

    Employee selectEmployee(int id);

    List<Employee> selectAllEmployee();

    List<Employee> search(String name, String address);

    boolean deleteEmployee(int id) throws SQLException;

    boolean updateEmployee(Employee employee) throws SQLException;

    public List<Position> selectAllPosition();
    public List<EducationDegree> selectAllDegree();
    public List<Division> selectAllDivision();
}
