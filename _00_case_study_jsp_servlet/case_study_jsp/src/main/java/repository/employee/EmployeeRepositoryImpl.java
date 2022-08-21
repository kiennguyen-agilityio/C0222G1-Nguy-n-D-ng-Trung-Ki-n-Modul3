package repository.employee;

import model.*;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository{
    private static final String SELECT_ALL_EMPLOYEE = "SELECT em.*, po.position_name, ed.education_degree_name, di.division_name\n" +
            "FROM employee em JOIN `position` po ON em.position_id = po.position_id\n" +
            "JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id\n" +
            "JOIN division di ON em.division_id = di.division_id;";
    private static final String INSERT_EMPLOYEE = "INSERT INTO employee (employee_name, employee_birthday, employee_id_card, " +
            "employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, username)\n" +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private  static final String UPDATE_EMPLOYEE = "UPDATE employee SET employee_name = ?, employee_birthday = ?, employee_id_card = ?, \n" +
            "                    employee_salary = ?, employee_phone = ?, employee_email = ?, \n" +
            "employee_address = ?, position_id = ?, education_degree_id = ?,\n" +
            "                    division_id = ?\n" +
            "WHERE employee_id = ?;";
    private static  final  String SELECT_EMPLOYEE_BY_ID = "SELECT em.*, po.position_name, ed.education_degree_name, di.division_name\n" +
            "FROM employee em JOIN `position` po ON em.position_id = po.position_id\n" +
            "JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id\n" +
            "JOIN division di ON em.division_id = di.division_id\n" +
            "WHERE employee_id = ?;";
    private static final String INSERT_USER = "INSERT INTO username VALUES (?, ?);";
    private static final String SEARCH_EMPLOYEE = "SELECT em.*, po.position_name, ed.education_degree_name, di.division_name\n" +
            "FROM employee em JOIN `position` po ON em.position_id = po.position_id\n" +
            "JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id\n" +
            "JOIN division di ON em.division_id = di.division_id WHERE employee_name LIKE ?" +
            "AND employee_address LIKE ?;";
    private static final String DELETE_EMPLOYEE = "delete from employee where employee_id = ?;";
    private static final String SELECT_ALL_POSITION = "SELECT * FROM `position`;";
    private static final String SELECT_ALL_DEGREE = "SELECT * FROM education_degree;";
    private static final String SELECT_ALL_DIVISION = "SELECT * FROM division;";

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        System.out.println(INSERT_EMPLOYEE);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setString(11, employee.getUserName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertUserName(User user) throws SQLException {
        System.out.println(INSERT_USER);
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("employee_name");
                String birthDay = rs.getString("employee_birthday");
                String idCard= rs.getString("employee_id_card");
                double salary= rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                String positionName = rs.getString("position_name");
                int educationDegreeId = rs.getInt("education_degree_id");
                String educationDegreeName = rs.getString("education_degree_name");
                int divisionId = rs.getInt("division_id");
                String divisionName = rs.getString("division_name");
                String username = rs.getString("username");

                employee = new Employee(id, name, birthDay, idCard, salary, phone, email, address, positionId,
                        positionName, educationDegreeId, educationDegreeName, divisionId, divisionName, username);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employees = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String birthDay = rs.getString("employee_birthday");
                String idCard= rs.getString("employee_id_card");
                double salary= rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                String positionName = rs.getString("position_name");
                int educationDegreeId = rs.getInt("education_degree_id");
                String educationDegreeName = rs.getString("education_degree_name");
                int divisionId = rs.getInt("division_id");
                String divisionName = rs.getString("division_name");
                String username = rs.getString("username");

                employees.add(new Employee(id, name, birthDay, idCard, salary, phone, email, address, positionId,
                        positionName, educationDegreeId, educationDegreeName, divisionId, divisionName, username));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);) {
            preparedStatement.setString(1, "%" + nameSearch + "%");
            preparedStatement.setString(2, "%" + addressSearch + "%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String name = rs.getString("employee_name");
                String birthDay = rs.getString("employee_birthday");
                String idCard= rs.getString("employee_id_card");
                double salary= rs.getDouble("employee_salary");
                String phone = rs.getString("employee_phone");
                String email = rs.getString("employee_email");
                String address = rs.getString("employee_address");
                int positionId = rs.getInt("position_id");
                String positionName = rs.getString("position_name");
                int educationDegreeId = rs.getInt("education_degree_id");
                String educationDegreeName = rs.getString("education_degree_name");
                int divisionId = rs.getInt("division_id");
                String divisionName = rs.getString("division_name");
                String username = rs.getString("username");

                employees.add(new Employee(id, name, birthDay, idCard, salary, phone, email, address, positionId,
                        positionName, educationDegreeId, educationDegreeName, divisionId, divisionName, username));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Position> selectAllPosition(){
        List<Position> positions = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("position_id");
                String name = rs.getString("position_name");
                positions.add(new Position(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positions;
    }
    public List<EducationDegree> selectAllDegree(){
        List<EducationDegree> educationDegrees = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DEGREE);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("education_degree_id");
                String name = rs.getString("education_degree_name");
                educationDegrees.add(new EducationDegree(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegrees;
    }
    public List<Division> selectAllDivision(){
        List<Division> divisions = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = BaseRepository.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("division_id");
                String name = rs.getString("division_name");
                divisions.add(new Division(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisions;
    }
}
