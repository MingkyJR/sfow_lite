package com.yeonoo.pp.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductRepositoryImpl implements ProductRepository{

	@Autowired
	private SqlSession sqlSession;
	
}