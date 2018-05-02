package com.resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.model.Film;
import com.model.User;
import com.service.FilmService;
import com.service.UserService;

import net.sf.json.JSONObject;

@Component
@Path("/movie")
@Scope("prototype")
public class FilmRes {

	
	@Resource(name = "filmService")
	private FilmService filmService;
	
	
	
	public FilmService getFilmService() {
		return filmService;
	}

	public void setFilmService(FilmService filmService) {
		this.filmService = filmService;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private String message;
	
	@GET
	@Path("/search/{name}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleSearchByName(@PathParam("name") String name) {

		Film film = new Film();
		film.setTitle(name);
		Film result = filmService.findFilmByName(name);
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}
	
	@GET
	@Path("/search/city/{city}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleSearchByCity(@PathParam("city") String city) {

		List<Film> listfilms = filmService.findFilmsByCity(city);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("total", listfilms.size());
		result.put("rows", listfilms);
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}
	
	@GET
	@Path("/allmovies")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleAll() {
		
		List<Film> listfilms = filmService.findAllFilms();
		long total = filmService.findTotalByFilms();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("total", total);
		result.put("rows", listfilms);
		JSONObject jsonUser = JSONObject.fromObject(result);
		return jsonUser.toString();
	}

	@POST
	@Path("/addMovie")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleAdd(Film film) {

		boolean flag = filmService.addFilm(film);
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
	@Path("/deleteMovie/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleDelete(@PathParam("id") Integer id) {

		boolean flag = filmService.deleteFilm(id);
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
	@Path("/updateMovie/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String handleUpdate(@PathParam("id") Integer id, Film film) {
		System.out.println(id);
		film.setId(id);
		boolean flag = filmService.updateFilm(film);
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
