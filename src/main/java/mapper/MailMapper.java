package mapper;

import java.util.List;

import model.Mail;

public interface MailMapper {

	List<Mail> selectByReid(int uid) throws Exception;

	int insertMail(Mail mail) throws Exception;

	int deleteMail(Mail mail) throws Exception;

	int update(Mail mail) throws Exception;

}
