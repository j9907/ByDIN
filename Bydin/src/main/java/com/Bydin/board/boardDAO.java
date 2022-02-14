package com.Bydin.board;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface boardDAO {

	@Select("select * from qna order by idx desc")
	List<boardDTO> selectboard();

	@Insert("insert into qna(title,writer,content,password,division,email) values (#{title},#{writer},#{content},#{password},#{division},#{email})")
	int insertboard(boardDTO dto);
	
	@Select("select * from qna where idx=#{idx}")
	boardDTO selectone(int idx);
	
	@Select("select password from qna where idx=#{idx}")
	String checkpass(int idx);

}
