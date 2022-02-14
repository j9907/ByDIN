package com.Bydin.Service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.Bydin.admin.AdminDAO;
import com.Bydin.item.TotalGoodsDTO;

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
	
	
}
