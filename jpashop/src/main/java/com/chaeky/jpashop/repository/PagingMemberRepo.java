package com.chaeky.jpashop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chaeky.jpashop.domain.Member;

public interface PagingMemberRepo  extends JpaRepository<Member, Long>{

}
