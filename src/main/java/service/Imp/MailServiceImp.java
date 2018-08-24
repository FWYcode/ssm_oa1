package service.Imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mapper.MailMapper;
import model.Mail;
import service.IMailService;

@Service
@Transactional(isolation=Isolation.REPEATABLE_READ,propagation=Propagation.REQUIRED)
public class MailServiceImp implements IMailService{
	@Autowired
	private MailMapper mmer;
	@Override
	@Transactional(readOnly=true)
	public List<Mail> findByReid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return mmer.selectByReid(uid);
	}

	@Override
	public int saveMail(Mail mail) throws Exception {
		// TODO Auto-generated method stub
		return mmer.insertMail(mail);
	}

	@Override
	public int removeMail(Mail mail) throws Exception {
		// TODO Auto-generated method stub
		return mmer.deleteMail(mail);
	}

	@Override
	public int modify(Mail mail) throws Exception {
		
		return mmer.update(mail);
	}

}
