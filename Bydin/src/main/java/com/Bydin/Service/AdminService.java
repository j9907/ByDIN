package com.Bydin.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Bydin.admin.AdminDAO;
import com.Bydin.board.BoardPaging;
import com.Bydin.item.CtgDTO;
import com.Bydin.item.PurchaseDTO;
import com.Bydin.item.Purchase_detailDTO;
import com.Bydin.item.TotalGoodsDTO;
import com.Bydin.member.MemberDTO;

@Service
public class AdminService {
	@Autowired private AdminDAO dao;

	public int addItem(TotalGoodsDTO dto) {
		return dao.addItem(dto);
	}
	
	private final String uploadPath = "C:\\upload";
	
	public void FileService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}

	public int upload(MultipartFile upload) {
		int cnt = 0;
			String fileName = upload.getOriginalFilename();
			System.out.println(fileName);
			File dest = new File(uploadPath, fileName);
			try {
				upload.transferTo(dest);
				cnt++;
			} catch (IllegalStateException | IOException e) {}
		return cnt;

	}

	public TotalGoodsDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int modItem(TotalGoodsDTO dto) {
		return dao.modItem(dto);
	}

	public List<CtgDTO> selectCtg(String ctgcode1) {
		return dao.selectCtg(ctgcode1);
	}

	public ModelAndView selectMember(int page) {
		ModelAndView mav = new ModelAndView("admin/mngAcnt");
		BoardPaging paging = new BoardPaging();

		int boardCount = dao.selectCount(paging); // 현재 게시판의 게시글 총 개수
		paging.setPage(boardCount, page); // 전체 개수와 현재 페이지를 전달하면
		int first = paging.getFirst(); // 페이징 처리된 첫 글번호와 // 1
		int last = paging.getLast(); // 페이징 처리된 마지막 글번호를 받아온다 // 10
		List<MemberDTO> list = dao.selectMember(paging);
		mav.addObject("list", list);
		
		mav.addObject("nowPage", page); // 현재 보고있는 페이지 번호
		mav.addObject("begin", paging.getBegin()); // 전체 페이지의 범위 시작
		mav.addObject("end", paging.getEnd()); // 전체 페이지의 범위 끝

		mav.addObject("prev", paging.hasPrev());
		mav.addObject("next", paging.hasNext());

		mav.addObject("number",0);
		
		return mav;
	}

	public MemberDTO selectOneMember(int num) {
		return dao.selectOneMember(num);
	}

	public List<PurchaseDTO> selectMemberPurchase(int num) {
		return dao.selectMemberPurchase(num);
	}

	public List<Purchase_detailDTO> selectDetail(int num) {
		return dao.selectDetail(num);
	}
	
	
}
