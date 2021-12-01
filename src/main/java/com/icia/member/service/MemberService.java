package com.icia.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.member.dto.MemberDTO;
import com.icia.member.repository.MemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private HttpSession session;

	public int save(MemberDTO member) {
		int result = mr.save(member);
		return result;
	}

	public String login(MemberDTO member) {
		MemberDTO loginMember = mr.login(member);
		if(loginMember !=null) {
			// 로그인 성공(로그인 정보를 세션에 저장)
			session.setAttribute("loginId",member.getM_id());
			session.setAttribute("loginNumber",loginMember.getM_number());
			return "main";
		}else {
			// 로그인 실패
			return "login";
		}
		
	}

	public List<MemberDTO> findAll() {
			List<MemberDTO> memberList = mr.findAll();
		return memberList;
	}

	public MemberDTO findById(long m_number) {
		MemberDTO member = mr.findById(m_number);
		return member;
	}

	public void delete(long m_number) {
		mr.delete(m_number);
	}
	public void update(MemberDTO member) {
		mr.update(member);
	}

	public String idDuplicate(String m_id) {
		String result = mr.idDuplicate(m_id);
		if(result == null)
			return "ok"; // 조회결과가 없기 때문에 해당 아이디는 사용가능
		else
			return "no"; // 조회결과가 없기 때문에 해당 아이디는 사용불가능
	}
}
