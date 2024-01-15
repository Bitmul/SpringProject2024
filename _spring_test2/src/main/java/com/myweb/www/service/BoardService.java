package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

	int insert(BoardDTO bdto);

	List<BoardVO> getList(PagingVO pgvo);

	BoardDTO getBvo(long bno);

	int remove(long bno);

	int modify(BoardDTO bdto);

	void read(long bno);

	int getTotalCount(PagingVO pgvo);

	int removeFile(String uuid);

}