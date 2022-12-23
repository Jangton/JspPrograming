package cs.dit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)  //���� �׽�Ʈ �ڵ尡 ������ ���� ������ �� ���̶�� �˸�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //�������� �о��
@Log4j //lombok�� �̿��� �α׸� ����ϴ� Logger�� ������ ����
public class TimeTests {
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testTime() {
		log.info("TimeMapper test............");
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
	
	@Test
	public void testTime2() {
		log.info("testTime2................................");
		log.info(timeMapper);
		log.info(timeMapper.getTime2());
	}

}
