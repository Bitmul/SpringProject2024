package com.myweb.www.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.security.MemberVO;
import com.myweb.www.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
@Controller
public class MemberController {
	private final MemberService msv;
	private final BCryptPasswordEncoder beEnconder;

	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String register(MemberVO mvo) {
		mvo.setPwd(beEnconder.encode(mvo.getPwd()));
		log.info("" + mvo);

		int isOk = msv.register(mvo);

		return null;

	}

	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String loginPost(HttpServletRequest request, RedirectAttributes re) {
		re.addAttribute("email",request.getAttribute("email"));
		re.addAttribute("errMsg",request.getAttribute("errMsg"));
		
		return "redirect:/member/login";
	}
}
