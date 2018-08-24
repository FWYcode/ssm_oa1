package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import service.UserService;

@Controller
@RequestMapping("/self")
public class SelfContorller {
	@Autowired
	private UserService usice;
	@RequestMapping("/selfpage")
	public String self(User user) {
		return "selfs";

	}
	@RequestMapping("/mod")
	@ResponseBody
	public String modify(User user,HttpSession session) throws Exception {
		usice.modify(user);
		User userf=usice.findById(user);
		session.removeAttribute("session");
		session.setAttribute("session", userf);
		return "1";
	}
}
