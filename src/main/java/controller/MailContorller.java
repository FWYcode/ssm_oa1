package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.Mail;
import model.User;
import service.IMailService;
import service.UserService;

@Controller
@RequestMapping("/mail")
public class MailContorller {
	@Autowired
	private UserService usice;
	@Autowired
	private IMailService msice;

	@RequestMapping("/toma")
	public String toMail(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session");
		List<User> lisu = usice.findAll(user);
		session.setAttribute("lisu", lisu);
		return "tomail";
	}

	@RequestMapping("/write")
	public String write(Mail mail, MultipartFile file, HttpServletRequest req) throws Exception {
		String path = req.getServletContext().getRealPath("/upload/");
		String filname = file.getOriginalFilename();

		if (!file.isEmpty()) {
			File f = new File(path + File.separator + filname);
			if (!f.getParentFile().exists()) {
				f.getParentFile().mkdirs();
			}
			java.util.Date djava = new java.util.Date();
			long time = djava.getTime();
			mail.setDate(new Date(time));
			String reun = req.getParameter("un");
			User user = new User();
			user.setName(reun);
			User usf = usice.findByName(user);
			int reid = usf.getId();
			mail.setReid(reid);
			mail.setFilename(filname);
			System.out.println(mail);
			msice.saveMail(mail);
			file.transferTo(f);
		}
		return "tomail";

	}

	@RequestMapping("/acptmail")
	public String acptmail() {
		return "accept";

	}

	@RequestMapping("/modifysign")
	public String modiSign(Mail mail, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session");
		msice.modify(mail);
		User usf = usice.findById(user);
		session.setAttribute("session", usf);
		return "accept";
	}

	@RequestMapping("/madetails")
	public String madetails(Mail mail, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session");
		msice.modify(mail);
		User usf = usice.findById(user);
		session.setAttribute("session", usf);
		List<Mail> lis = usf.getLis();
		Mail mail3 = null;
		for (Mail mail2 : lis) {
			if (mail2.getId() == mail.getId()) {
				mail3 = mail2;
			}
		}
		int sid = mail3.getSeid();
		User suser = new User();
		suser.setId(sid);
		User suserf = usice.findById(suser);
		session.setAttribute("suserf", suserf);
		session.setAttribute("signmail", mail3);
		return "maildetails";
	}

	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(HttpServletRequest req, Mail mail) throws IOException {
		// 服务器资源位置
		String srcpath = "E:/imgs";
		String filname = mail.getFilename();
		File file = new File(srcpath + File.separator + filname);
		InputStream is = new FileInputStream(file);
		HttpHeaders head = new HttpHeaders();
		head.add("Content-Disposition", "attchement;filename=" + file.getName());
		byte[] bs = new byte[(int) file.length()];
		is.read(bs);
		is.close();
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(bs, head, HttpStatus.OK);
		return entity;
	}

	@RequestMapping("/torubbish")
	public String torubbishMail() {
		return "rubbishmail";
	}
	@RequestMapping("/removemail")
	public String removeMail(Mail mail,HttpSession session) throws Exception{
		User user = (User) session.getAttribute("session");
		User usf = usice.findById(user);
		session.setAttribute("session", usf);
		msice.removeMail(mail);
		return "redirect:/mail/torubbish";
		
	}
	@RequestMapping("/restore")
	public String restore(Mail mail,HttpSession session) throws Exception{
		User user = (User) session.getAttribute("session");
		msice.modify(mail);
		User usf = usice.findById(user);
		session.setAttribute("session", usf);
		return "redirect:/mail/torubbish";
		
	}
}
