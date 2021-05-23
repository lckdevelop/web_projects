package com.thank.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thank.store.dao.MemberDAO;
import com.thank.store.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO getMember(MemberDTO memberDTO) throws Exception{
		try {
			MemberDTO memberInfo = memberDAO.getMember(memberDTO);
			System.out.println();
			if(memberInfo==null) {
				throw new RuntimeException("아이디 혹은 비밀번호 틀림.");
			}
			return memberInfo;
		}catch(Exception e) {
			log.info(e.getMessage());
			throw e;
		}
	}
}