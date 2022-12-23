package cs.dit.service;

import java.util.List;

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
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		
		board.setTitle("title");
		board.setContent("content");
		board.setWriter("writer");
		
		service.register(board);
		log.info(board);
	}
	
	@Test
	public void testRemove() {
		log.info("remove result : "+ service.remove(101L));
	}
}