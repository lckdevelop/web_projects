package com.chaeky.jpashop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chaeky.jpashop.domain.Item;
import com.chaeky.jpashop.domain.Member;
import com.chaeky.jpashop.repository.MemberRepository;
import com.chaeky.jpashop.repository.PagingItemRepo;
import com.chaeky.jpashop.repository.PagingMemberRepo;

import lombok.RequiredArgsConstructor;

@Service
//javax보다 spring것이 쓸수 있는 항목이 많기 때문에 spring을 사용하는것을 권장한다.
// 따로 Transactional을 설정해주지 않으면 readOnly가 된다.
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class MemberService {
	
	// @RequiredArgsConstructor(lombok)
	private final MemberRepository memberRepository;
	private final PagingMemberRepo pagingMemberRepo;
	
	//회원 가입
	@Transactional
	public Long join(Member member) {
		validateDuplicateMember(member); //중복 회원 검증
		memberRepository.save(member);
		return member.getId();
	}
	
	// exception 회원이 중복이되면 여기서 예외처리를 해줄 것 이다.
	public void validateDuplicateMember(Member member) {
		List<Member> findMembers = memberRepository.findByName(member.getName());
		
		if (!findMembers.isEmpty()) {
			throw new IllegalStateException("이미 존재하는 회원입니다.");
		}
	}
	
	//회원 전체 조회
	public List<Member> findMembers() {
		return memberRepository.findAll();
	}
	
	//회원 한명만 조회
	public Member findOne(Long memberId) {
		return memberRepository.findOne(memberId);
	}
	
	//페이징처리 회원 전체 조회
	public Page<Member> findAll(Pageable pageable) {
		int page = (pageable.getPageNumber() == 0) ? 0 : (pageable.getPageNumber() - 1); // page는 index 처럼 0부터 시작
		pageable = PageRequest.of(page, 10, Sort.by("id").descending()); // 페이지는 10개씩 보인다, id에 의해 정렬해서 보인다.

		// 페이징처릴를위한 인터페이스 itemRepo
		return pagingMemberRepo.findAll(pageable);
	}
}
