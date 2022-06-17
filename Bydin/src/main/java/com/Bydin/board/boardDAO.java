package com.Bydin.board;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface boardDAO {
	
	@Select("select count(*) from qna")
	public int selectCount(BoardPaging paging);

	@Select("select * from (select rownum as st, A.* from (select * from qna order by idx desc) A where rownum <= #{last}) where st >= #{first} order by st asc")
	List<boardDTO> selectboard(BoardPaging pagin);

	@Insert("insert into qna(title,writer,img,content,password,division,email) values (#{title},#{writer},#{img},#{content},#{password},#{division},#{email})")
	int insertboard(boardDTO dto);
	
	@Select("select * from qna where idx=#{idx}")
	boardDTO selectone(int idx);
	
	@Select("select password from qna where idx=#{idx}")
	String checkpass(int idx);

	@Delete("delete from qna where idx=#{num}")
	int delboard(int num);

	@Insert("insert into reply(boardidx,title,content,writer) values(#{boardidx},#{title},#{content},#{writer})")
	public int insertreply(ReplyDTO dto);


	@Select("select count(*) from reply where boardidx = #{num}")
	public int replycount(int num);

	@Update("update qna set title = #{title}, content = #{content}, division = #{division} , email = #{email} where idx = #{idx}")
	public int updateboard(boardDTO dto);

	@Update("update qna set anwercheck = 1 where idx = #{num}")
	public int updateanswer(int num);
}
