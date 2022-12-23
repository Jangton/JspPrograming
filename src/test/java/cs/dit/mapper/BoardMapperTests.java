package cs.dit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.BoardVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //���� �׽�Ʈ �ڵ尡 ������ ���� ������ �� ���̶�� �˸�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //�������� �о��
@Log4j //lombok�� �̿��� �α׸� ����ϴ� Logger�� ������ ����
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		
		boardMapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetList2() {
		
		boardMapper.getList2().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("�׽�Ʈ!!!!");
		board.setContent("�׽�Ʈ��ϱ��!!");
		board.setWriter("ȫ�浿");
		
		boardMapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testSelectOne() {
		log.info("selectOne.....................");
		
		BoardVO board = boardMapper.selectOne(100L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("delete.....................");
		
		int i = boardMapper.delete(98L);
		log.info("delete count : " + i);
		
	}
	@Test
	public void testUpdate() {
		log.info("update.....................");
		BoardVO board = new BoardVO();
		board.setBno(99L);
		board.setTitle("������Ʈ");
		board.setContent("������Ʈ��...");
		board.setWriter("ȫ�浿");
		
		int i = boardMapper.update(board);
		log.info("update count : " + i);
		
	}	
}