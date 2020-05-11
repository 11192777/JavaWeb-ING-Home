package pers.qingyu.home.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.qingyu.home.bean.RecordBean;
import pers.qingyu.home.dao.RecordDao;
import pres.qingyu.home.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService{

	@Autowired
	private RecordDao recordDao;

	public ArrayList<RecordBean> queryList() {
		// TODO Auto-generated method stub
		return recordDao.queryList();
	}

}
