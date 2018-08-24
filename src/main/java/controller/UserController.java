package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import service.UserService;
import tools.Constant;

@Controller
@RequestMapping("/accountmanager")
public class UserController {
	@Autowired
	private UserService usice;

	@RequestMapping("/tolog")
	public String tolog(HttpSession sesion) {
		if (sesion != null) {
			sesion.removeAttribute("session");
		}
		return "login";
	}

	@RequestMapping("/chack")
	@ResponseBody
	public String chackoutUser(User user, HttpSession session) throws Exception {

		System.out.println(user.getName());
		User ckuser = usice.chackUser(user);
		if (ckuser != null) {
			session.setAttribute("session", ckuser);
			return Constant.CHACK_USER_SUCCE;
		}
		return Constant.CHACK_USER_FAIL;
	}

	@RequestMapping("/toindex")
	public String toIndex() {

		return "index";

	}

	@RequestMapping("/messa")
	public String userMessage(User user, Model model) throws Exception {

		List<User> lis = usice.findByPower(user);
		model.addAttribute("userlis", lis);
		return "message";

	}

	@RequestMapping("/singmessa")
	public String findSing() throws Exception {

		return "singmessa";
	}

	@RequestMapping("/mod")
	public String mod(User user, HttpSession session) throws Exception {
		usice.modify(user);
		User usef = usice.findById(user);
		session.setAttribute("session", usef);
		return "redirect:/accountmanager/singmessa";
	}

	@RequestMapping("/toinsert")
	public String toInsert() {
		return "insert";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(User user) throws Exception {
		User ckuser = usice.chackUser(user);
		if (ckuser == null) {
			usice.save(user);
			return Constant.CHACK_USER_SUCCE;
		}
		return Constant.CHACK_USER_FAIL;
	}
}
