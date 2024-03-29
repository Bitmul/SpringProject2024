package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDAO bdao;
	private final FileDAO fdao;

	@Override
	public int insert(BoardDTO bdto) {
		log.info(">>>>>>>>>>>>>>BVO : " + bdto.getBvo());
		int isOk = bdao.insert(bdto.getBvo());
		if (bdto.getFlist() == null)
		{
			return isOk;
		}
		if (isOk > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			log.info(">>>>>>>>>>>>>>BNO : " + bno);
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		return bdao.getList(pgvo);
	}

	@Override
	public BoardDTO getBvo(long bno) {
		BoardVO bvo = bdao.getDetail(bno);
		List<FileVO>flist = fdao.getFileList(bno);
		BoardDTO bdto = new BoardDTO(bvo,flist);
		return bdto;
	}

	@Override
	public int remove(long bno) {
		return bdao.remove(bno);
	}

	@Override
	@Transactional
	public int modify(BoardDTO bdto) {
		int isOk = bdao.modify(bdto.getBvo());
		if (bdto.getFlist() == null)
		{
			return isOk;
		}
		if (isOk > 0 && bdto.getFlist().size() > 0) {
			long bno = bdao.selectOneBno();
			log.info(">>>>>>>>>>>>>>BNO : " + bno);
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		return isOk;
	}

	@Override
	public void read(long bno) {
		bdao.read(bno);
		
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.removeFile(uuid);
	}

}
