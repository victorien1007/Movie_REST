package com.resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.model.User;
import com.service.UserService;

import net.sf.json.JSONObject;

@Component
@Path("/user")
@Scope("prototype")
public class UserRes {

	@Resource(name = "userService")
	private UserService userService;
	private String message;

	@Context 
	HttpServletRequest request;
	
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@GET
	@Path("/login/{username}/{password}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleIsExist(@PathParam("username") String username,
			@PathParam("password") String password) {

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User result = userService.findUserByNameAndPassword(user);
		if(result != null){
			request.setAttribute("user",result.getUsername());
		}
		
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}
	
	@GET
	@Path("/search/{name}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleSearchByName(@PathParam("name") String name) {

		User user = new User();
		user.setUsername(name);
		User result = userService.findUserByName(name);
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}
	
	@GET
	@Path("/allusers")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleFindAll() {
		
		List<User> listusers = userService.findAllUsers();
		long total = userService.findTotalByUser();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("total", total);
		result.put("rows", listusers);
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}

	@POST
	@Path("/addUser")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleAdd(User user) {

		boolean flag = userService.addUser(user);
		if (flag) {
			message = "success";
		} else {
			message = "fail";
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", message);
		return jsonObject.toString();
	}

	@DELETE
	@Path("/deleteUser/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleDelete(@PathParam("id") Integer id) {

		boolean flag = userService.deleteUser(id);
		if (flag) {
			message = "success";
		} else {
			message = "fail";
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", message);
		return jsonObject.toString();
	}

	@PUT
	@Path("/updateUser/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleUpdate(@PathParam("id") Integer id, User user) {
		user.setId(id);
		boolean flag = userService.updateUser(user);
		if (flag) {
			message = "success";
		} else {
			message = "fail";
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", message);
		return jsonObject.toString();
	}


}
