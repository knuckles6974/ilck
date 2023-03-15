package kr.co.ilck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.ilck.mapper.DefaultMapper;

@Service
@Qualifier("ds")
public class DefaultServiceImpl implements DefaultService {

	@Autowired
	private DefaultMapper mapper;
}
