package com.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.admin.mapper.StatsMapper;
import com.admin.model.CountVO;
import com.admin.model.MonthVO;
import com.admin.model.MonthVO2;
import com.admin.model.SalesVO;
import com.admin.model.UserCountVO;

@Service("statsServiceImpl")
public class StatsServiceImpl implements StatsService {
	
	@Inject
	private StatsMapper statsMapper;

	@Override
	public List<CountVO> getOrdered() {
		return this.statsMapper.getOrdered();
	}

	@Override
	public List<UserCountVO> getUser() {
		return this.statsMapper.getUser();
	}

	@Override
	public List<UserCountVO> getAge() {
		return this.statsMapper.getAge();
	}

	@Override
	public List<SalesVO> getSales() {
		return this.statsMapper.getSales();
	}

	@Override
	public List<MonthVO> getMonthSales() {
		List<MonthVO> list= this.statsMapper.getMonthSales();
		List<MonthVO> list2= new ArrayList<>();		
		int[] arr=new int[list.size()];
		
		for(int i=0;i<12;i++) {
			MonthVO mvo=new MonthVO();
			mvo.setOrdered_date(i+1);
			mvo.setTotalprice(0);
			list2.add(mvo);
			System.out.println("list2 ["+i+"]: "+list2.get(i));
		}
		
		for(int i=0;i<list.size();i++) {
			MonthVO mvo=new MonthVO();
			mvo=list.get(i);
			list2.set(list.get(i).getOrdered_date()-1, mvo);
		}
		//System.out.println(list2);
		
		return list2;
	}

	@Override
	public List<MonthVO> getMonthSalesByYear(int year) {
		List<MonthVO> list= this.statsMapper.getMonthSalesByYear(year);
		List<MonthVO> list2= new ArrayList<>();		
		int[] arr=new int[list.size()];
		
		for(int i=0;i<12;i++) {
			MonthVO mvo=new MonthVO();
			mvo.setOrdered_date(i+1);
			mvo.setTotalprice(0);
			list2.add(mvo);
			//System.out.println(list2.get(i));
		}
		
		for(int i=0;i<list.size();i++) {
			MonthVO mvo=new MonthVO();
			mvo=list.get(i);			
			list2.set(list.get(i).getOrdered_date()-1, mvo);
		}
		
		return list2;
	}

	@Override
	public List<MonthVO> getUserStats(MonthVO2 mvo2) {
		List<MonthVO> list= this.statsMapper.getUserStats(mvo2);
		List<MonthVO> list2= new ArrayList<>();		
		int[] arr=new int[list.size()];
		
		for(int i=0;i<12;i++) {
			MonthVO mvo=new MonthVO();
			mvo.setOrdered_date(i+1);
			mvo.setTotalprice(0);
			list2.add(mvo);
			System.out.println(list2.get(i));
		}
		
		for(int i=0;i<list.size();i++) {
			MonthVO mvo=new MonthVO();
			mvo=list.get(i);
			list2.set(list.get(i).getOrdered_date()-1, mvo);
		}
		
		return list2;
	}

}
