package data;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Question;
import entities.Quiz;
import entities.Score;

@Transactional
public class QuizDAO {
	@PersistenceContext
	private EntityManager em;

	public Quiz create(Quiz quiz) {
		em.persist(quiz);
		em.flush();
		return quiz;
	}

	public List<Quiz> index() {
		String query = "Select q from Quiz q";
		return em.createQuery(query, Quiz.class).getResultList();
	}

	public List<Score> indexScores(int id) {
		String query = "SELECT s From Score s WHERE s.quiz.id = ?1 ";
		return em.createQuery(query, Score.class).setParameter(1, id).getResultList();
	}

	public Quiz show(int id) {
		return em.find(Quiz.class, id);
	}

	public void delete(int id) {
		em.remove(em.find(Quiz.class, id));
	}
	
	public void createQuestion(int id, Question question){
		question.setQuiz(em.find(Quiz.class, id));
		em.persist(question);
		em.flush();
	}
	
	public void deleteQuestion(int id){
		em.remove(em.find(Question.class, id));
	}
	
	public String deleteQuestion(int quizId, int questionId){
        Quiz quiz = em.find(Quiz.class, quizId);
        Set<Question> questions = quiz.getQuestions();
        if (questions.contains(em.find(Question.class, questionId))){
            em.remove(em.find(Question.class, questionId));
            em.persist(quiz);
            em.flush();
            return "Question removed";
        } else {
            return "Quiz does not contain this question.";
       }
	}
}
