package service.Imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mapper.LeaveMapper;
import model.Leaveren;
import service.LeaveService;
@Service
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED)
public class LeaveSrviceImp implements LeaveService {
	@Autowired
	private LeaveMapper lmer;
	@Override
	@Transactional(readOnly=true)
	public List<Leaveren> findByApid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return lmer.selectByApid(uid);
	}

	@Override
	public int saveLeave(Leaveren leave) throws Exception {
		// TODO Auto-generated method stub
		return lmer.insertLeave(leave);
	}

	@Override
	public int modiLeave(Leaveren mail) throws Exception {
		// TODO Auto-generated method stub
		return lmer.update(mail);
	}

	@Override
	public List<Leaveren> findByRevid(int revid) throws Exception {
		// TODO Auto-generated method stub
		return lmer.selectByRevid(revid);
	}

	@Override
	public Leaveren findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return lmer.selectById(id);
	}
	

}
