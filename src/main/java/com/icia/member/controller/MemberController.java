package com.icia.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String saveForm() {	
		return "save";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute MemberDTO member) {	
		System.out.println("MemberController.save():" + member);
		int result = ms.save(member);
		if(result > 0)
			return "index";
		else
			return "save";
	}
	// 로그인 페이지 출력
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {	
		return "login";
	}
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO member) {
		String resultPage = ms.login(member);
		
		return resultPage;
		
	}
	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public  String logout(HttpSession session) {
		// 세숀에 저장된 데이터를 지움.
		session.invalidate();
		return "index";
	}
	@RequestMapping(value="/findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		List<MemberDTO> memberList = ms.findAll();
		
		model.addAttribute("memberList", memberList);
		
		return "findAll"; 
	}
	// 상세조회 처리
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String findById(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member",member);
		return "detail";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("m_number") long m_number) {
		System.out.println("delete: "+ m_number);
		
		ms.delete(m_number);
		
		return "redirect:/findAll";
	}
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("m_number") long m_number, Model model) {
		System.out.println("update: "+ m_number);
		
		MemberDTO member = ms.findById(m_number);
		model.addAttribute("member",member);
		return "update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO member, Model model) {
		System.out.println("Controller.update()"+ member);
		ms.update(member);
//		member = ms.findById(member.getM_number());
//		model.addAttribute("member, member");
//		return "detail";
		return "redirect:/detail?m_number="+member.getM_number();
	}
	
	// 아이디 중복체크
	@RequestMapping(value="/idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		System.out.println("MemberController.idDuplicate(): "+ m_id);
		String result = ms.idDuplicate(m_id);
		return result; // "ok" or "no"
	}
	
	// ajax로 상세조회
	@RequestMapping(value="/detailAjax", method=RequestMethod.POST)
	public @ResponseBody MemberDTO detailAjax(@RequestParam("m_number") long m_number) {
		MemberDTO member = ms.findById(m_number);
		return member;
	}
	
	
}
