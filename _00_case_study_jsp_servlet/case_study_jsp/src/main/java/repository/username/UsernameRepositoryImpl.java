package repository.username;

import model.RentType;
import model.User;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsernameRepositoryImpl implements IUsernameRepository{
    private static final String SELECT_ALL_USERS = "SELECT un.*, po.position_name\n" +
            "FROM username un\n" +
            "JOIN employee ep ON un.username = ep.username\n" +
            "JOIN position po ON ep.position_id = po.position_id;";
    @Override
    public User selectUser(String userName) {
        return null;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("position_name");

                userList.add(new User(username, password, role));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
