package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import data.QuizDAO;
import entities.Question;
import entities.Quiz;
import entities.Score;

@RestController
public class QuizController {
	@Autowired
	private QuizDAO quizDAO;

	@RequestMapping(path = "/ping", method = RequestMethod.GET)
	public String ping() {
		return "PONG!";
	}

	@RequestMapping(path = "/quiz", method = RequestMethod.GET)
	public List<Quiz> index() {
		return quizDAO.index();
	}

	@RequestMapping(path = "/quiz/{id}", method = RequestMethod.GET)
	public Quiz show(@PathVariable int id) {
		return quizDAO.show(id);
	}

	@RequestMapping(path = "/quiz", method = RequestMethod.POST)
	public Quiz create(@RequestBody String jsonQuiz) {
		ObjectMapper mapper = new ObjectMapper();
		Quiz newQuiz = null;
		try {
			newQuiz = mapper.readValue(jsonQuiz, Quiz.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return quizDAO.create(newQuiz);
	}

	@RequestMapping(path = "/quiz/{id}", method = RequestMethod.DELETE)
	public void delete(@PathVariable("id") int id) {
		quizDAO.delete(id);
	}

	@RequestMapping(path = "/quiz/{id}/scores", method = RequestMethod.GET)
	public List<Score> indexScores(@PathVariable int id) {
		return quizDAO.indexScores(id);
	}
	
	@RequestMapping(path = "/quiz/{id}/questions", method = RequestMethod.POST)
	public void createQuestion(@PathVariable int id,@RequestBody String jsonQuestion) {
		ObjectMapper mapper = new ObjectMapper();
		Question newQuestion = null;
		try {
			newQuestion = mapper.readValue(jsonQuestion, Question.class);
			quizDAO.createQuestion(id, newQuestion);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path ="/quiz/{id}/questions/{questionId}", method = RequestMethod.DELETE)
	public void deleteQuestion(@PathVariable int id, @PathVariable int questionId) {
		quizDAO.deleteQuestion(questionId);
	}

}
