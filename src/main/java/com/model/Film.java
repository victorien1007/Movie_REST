package com.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="movie")
public class Film {

	private Integer id;
	private String title;
	private String duration;
	private String language;
	private boolean isSubtitles;
	private String director;
	private String actors;
	private Integer agerequired;
	private String startdate;
	private String enddate;
	private String days;
	private Integer theatreId;
	private String city;
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", title=" + title + ", duration=" + duration + ", language=" + language
				+ ", isSubtitles=" + isSubtitles + ", director=" + director + ", actors=" + actors + ", agerequired="
				+ agerequired + ", startdate=" + startdate + ", enddate=" + enddate + ", days=" + days + ", theatreId="
				+ theatreId + "]";
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public boolean getIsSubtitles() {
		return this.isSubtitles;
	}

	public void setIsSubtitles(boolean isSubtitles) {
		this.isSubtitles = isSubtitles;
	}

	public String getDirector() {
		return this.director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return this.actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public Integer getAgerequired() {
		return this.agerequired;
	}

	public void setAgerequired(Integer agerequired) {
		this.agerequired = agerequired;
	}

	public String getStartdate() {
		return this.startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return this.enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getDays() {
		return this.days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public Integer getTheatreId() {
		return this.theatreId;
	}

	public void setTheatreId(Integer theatreId) {
		this.theatreId = theatreId;
	}

}