package com.chaeky.jpashop.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.chaeky.jpashop.domain.Member;

import lombok.RequiredArgsConstructor;

@Repository 
@RequiredArgsConstructor
public class MemberRepository {
	//entityManager내부에 영속성 컨텍스트(Persistence Context)라는 걸 두어서 엔티티들을 관리(entity들을 주입 받을 수 있다)
	//@PersistenceContext
	
	//entity를 관리하는 역할을 수행
	//@RequiredArgsConstructor사용
	private final EntityManager em; 
	
	// member저장
	public void save(Member member) {
		em.persist(member);
	}
	
	// 회원 한명 조회
	public Member findOne(Long id) {
		return em.find(Member.class, id); // 멤버를 반환(첫번쨰는 type을 넣고, 두번째는 pk를 넣어주면 된다.)
	}
	
	// 회원 전체 조회
	public List<Member> findAll() {
		// 첫 번쨰 매개변수로 jpql을 넣고, 두 번쨰 매개변수로 반환타입을 넣는다.
		return em.createQuery("select m from Member m", Member.class)
				.getResultList();
	}
	
	// 회원을 이름에 의해서 조회
	public List<Member> findByName(String name) {
		return em.createQuery("select m from Member m where m.name = :name", Member.class)
				.setParameter("name", name)
				.getResultList();
	}
}
