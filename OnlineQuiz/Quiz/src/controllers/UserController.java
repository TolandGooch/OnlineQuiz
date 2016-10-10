package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import data.UserDAO;
import entities.User;

@RestController
public class UserController {
	@Autowired
    private UserDAO userDAO;
 
// @RequestMapping(path="/ping", method=RequestMethod.GET)
// public String ping(){
//   return "PONG!";
// } 
 
 @RequestMapping(path="/user", method=RequestMethod.GET)
 public List<User> index(){
   return userDAO.index();
 } 
 
 @RequestMapping(path="/user/{id}", method=RequestMethod.GET)
 public User show(@PathVariable int id){
   return userDAO.show(id);
 }

 @RequestMapping(path="/user", method=RequestMethod.POST)
 public User create(@RequestBody String jsonUser){
	 ObjectMapper mapper = new ObjectMapper();
	 User newUser = null;
	 try {
	   newUser = mapper.readValue(jsonUser, User.class);
	 } catch (Exception e) {
	   e.printStackTrace();
	 }
	 return userDAO.create(newUser);
}
}
