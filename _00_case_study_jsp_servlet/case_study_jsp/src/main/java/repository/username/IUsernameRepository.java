package repository.username;

import model.User;

import java.util.List;

public interface IUsernameRepository {
    User selectUser(String userName);

    List<User> selectAllUser();
}
