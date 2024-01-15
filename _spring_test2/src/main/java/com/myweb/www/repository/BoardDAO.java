package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getBvo(long bno);

	int remove(long bno);

	int modify(BoardVO bvo);

	void read(long bno);

	int getTotalCount(PagingVO pgvo);

	long selectOneBno();

	BoardVO getDetail(long bno);

}
