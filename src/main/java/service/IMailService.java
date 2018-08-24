package service;

import java.util.List;

import model.Mail;

public interface IMailService {
	List<Mail> findByReid(int uid) throws Exception;

	int saveMail(Mail mail) throws Exception;

	int removeMail(Mail mail) throws Exception;

	int modify(Mail mail) throws Exception;
}
