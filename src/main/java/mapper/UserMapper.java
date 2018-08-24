package mapper;

import java.util.List;

import model.User;

public interface UserMapper {

	int insert(User user) throws Exception;

	int delete(User user) throws Exception;

	int update(User user) throws Exception;

	User selectById(User user) throws Exception;

	User selectByName(User user) throws Exception;

	List<User> selectByPower(User user) throws Exception;

	List<User> slecteAll(User user) throws Exception;

}
