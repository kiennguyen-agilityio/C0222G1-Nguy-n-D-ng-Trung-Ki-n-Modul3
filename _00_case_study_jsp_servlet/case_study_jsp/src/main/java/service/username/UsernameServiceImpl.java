package service.username;

import model.User;
import repository.username.IUsernameRepository;
import repository.username.UsernameRepositoryImpl;

import java.util.List;

public class UsernameServiceImpl implements IUsernameService{
    private IUsernameRepository usernameRepository = new UsernameRepositoryImpl();
    @Override
    public User selectUser(String userName) {
        return usernameRepository.selectUser(userName);
    }

    @Override
    public List<User> selectAllUser() {
        return usernameRepository.selectAllUser();
    }
}
