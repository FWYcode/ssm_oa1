package service;

import java.util.List;

import model.User;

public interface UserService {
	int save(User user) throws Exception;

	int remove(User user) throws Exception;

	int modify(User user) throws Exception;

	User findByName(User user) throws Exception;

	List<User> findByPower(User user) throws Exception;

	User chackUser(User user) throws Exception;

	List<User> findAll(User user) throws Exception;

	User findById(User user) throws Exception;
}
