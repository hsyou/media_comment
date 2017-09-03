package org.project.media_comment.domain;

import java.util.Date;

public class MypageVO {

	private int activity_id;
	private String activity_name;
	private int user_id;
	private int video_id;
	private int type;
	private Date activity_date;
	
	
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public String getActivity_name() {
		return activity_name;
	}
	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getVideo_id() {
		return video_id;
	}
	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getActivity_date() {
		return activity_date;
	}
	public void setActivity_date(Date activity_date) {
		this.activity_date = activity_date;
	}
	
	
	
}
