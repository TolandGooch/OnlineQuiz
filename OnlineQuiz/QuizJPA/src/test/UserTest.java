package test;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.User;

public class UserTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("QuizJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		User user = em.find(User.class, 1);
		assertEquals("Action", user.getUser());
	
	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}
