package mapper;

import java.util.List;

import model.Leaveren;

public interface LeaveMapper {

	List<Leaveren> selectByApid(int uid) throws Exception;

	int insertLeave(Leaveren leave) throws Exception;

	int update(Leaveren mail) throws Exception;

	List<Leaveren> selectByRevid(int revid) throws Exception;

	Leaveren selectById(int id) throws Exception;

}
