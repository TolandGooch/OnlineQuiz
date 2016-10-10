package entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Quiz {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@JoinColumn
	private int id;

	@Column(name = "name")
	private String name;

	@OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonManagedReference(value="quizScores")
	private Set<Score> scores;
	
	@OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonManagedReference(value="quizQuestions")
	private Set<Question> questions;
	
	// Getters and Setters
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Set<Question> getQuestions() {
		return questions;
	}
	
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
	// To String
	@Override
	public String toString() {
		return "Quiz [id=" + id + ", name=" + name + "]";
	}


}