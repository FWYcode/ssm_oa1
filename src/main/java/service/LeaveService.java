package service;

import java.util.List;

import model.Leaveren;

public interface LeaveService {
	List<Leaveren> findByApid(int uid) throws Exception;

	int saveLeave(Leaveren leave) throws Exception;

	int modiLeave(Leaveren mail) throws Exception;

	List<Leaveren> findByRevid(int revid) throws Exception;

	Leaveren findById(int id) throws Exception;
}
