package com.Bydin.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface boardDAO {
	
	@Select("select count(*) from qna")
	public int selectCount(BoardPaging paging);

	@Select("select * from (select rownum as st, A.* from (select * from qna order by idx desc) A where rownum <= #{last}) where st >= #{first} order by rownum desc")
	List<boardDTO> selectboard(BoardPaging pagin);

	@Insert("insert into qna(title,writer,content,password,division,email) values (#{title},#{writer},#{content},#{password},#{division},#{email})")
	int insertboard(boardDTO dto);
	
	@Select("select * from qna where idx=#{idx}")
	boardDTO selectone(int idx);
	
	@Select("select password from qna where idx=#{idx}")
	String checkpass(int idx);

	@Delete("delete from qna where idx=#{num}")
	int delboard(int num);

}
