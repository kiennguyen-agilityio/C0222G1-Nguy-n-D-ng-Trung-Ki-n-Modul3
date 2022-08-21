package service.username;

import model.Service;
import model.User;

import java.util.List;

public interface IUsernameService {
    User selectUser(String userName);

    List<User> selectAllUser();
}
