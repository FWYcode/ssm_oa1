package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Leaveren;
import model.User;
import service.LeaveService;
import service.UserService;

@Controller
@RequestMapping("/leave")
public class LeaveContorller {
	@Autowired
	private UserService usice;
	@Autowired
	private LeaveService lsice;

	@RequestMapping("/toleavelis")
	public String toLeaveLis(HttpSession session) throws Exception {
		User sesuser = (User) session.getAttribute("session");

		List<User> lisu = usice.findByPower(sesuser);

		session.setAttribute("lisu", lisu);
		return "leavelis";
	}

	@RequestMapping("/toleave")
	public String tolea(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session");
		List<User> uslis = usice.findAll(user);
		session.setAttribute("uslis", uslis);
		return "toleave";
	}

	@RequestMapping("/insertleave")
	public String insertLeave(Leaveren leave, HttpServletRequest req) throws Exception {
		String rename = req.getParameter("unp");
		String apname = req.getParameter("nus");
		User user = new User();
		user.setName(rename);
		User re = usice.findByName(user);
		user.setName(apname);
		User ap = usice.findByName(user);
		Integer revid = re.getId();
		Integer apid = ap.getId();
		leave.setRevid(revid);
		leave.setApid(apid);
		lsice.saveLeave(leave);
		return "toleave";
	}

	@RequestMapping("/tosh")
	public String tosh(int id, HttpServletRequest req) throws Exception {
		Leaveren leave = lsice.findById(id);
		req.setAttribute("leave", leave);
		String name = req.getParameter("name");
		req.setAttribute("name", name);
		return "sh";
	}

	@RequestMapping("/update")
	public String update(Leaveren leave) throws Exception {
		lsice.modiLeave(leave);
		return "redirect:/leave/toleavelis";
	}
}
