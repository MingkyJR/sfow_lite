package com.yeonoo.stock.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.stock.domain.Stock;

public interface StockRepository {
	
	
	public List<Stock> searchAll() throws DataAccessException;
		
	public void updateStock(Stock data) throws DataAccessException;

	public List<Stock> searchWhStock(Stock data) throws DataAccessException;
	
	public List<Stock> searchWh() throws DataAccessException;
}