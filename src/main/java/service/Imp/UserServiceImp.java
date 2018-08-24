package service.Imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mapper.UserMapper;
import model.User;
import service.UserService;

@Service
@Transactional(isolation = Isolation.REPEATABLE_READ, propagation = Propagation.REQUIRED)
public class UserServiceImp implements UserService {
	@Autowired
	private UserMapper umaper;

	@Override
	public int save(User user) throws Exception {

		return umaper.insert(user);
	}

	@Override
	public int remove(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.delete(user);
	}

	@Override
	public int modify(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.update(user);
	}

	@Override
	@Transactional(readOnly = true)
	public User findById(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.selectById(user);
	}

	@Override
	@Transactional(readOnly = true)
	public User findByName(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.selectByName(user);
	}

	@Override
	@Transactional(readOnly = true)
	public List<User> findByPower(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.selectByPower(user);
	}

	@Override
	public User chackUser(User user) throws Exception {
		User findUser=this.findByName(user);
		if(findUser!=null){
			if(user.getPass().equals(findUser.getPass())){
				return findUser;
			}
		}
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public List<User> findAll(User user) throws Exception {
		// TODO Auto-generated method stub
		return umaper.slecteAll(user);
	}

}
