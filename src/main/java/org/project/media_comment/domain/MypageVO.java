package org.project.media_comment.domain;

import java.util.Date;

public class MypageVO {

	private int view_log_id;
	private Date view_log_date;

	public int getView_log_id() {
		return view_log_id;
	}
	public void setView_log_id(int view_log_id) {
		this.view_log_id = view_log_id;
	}
	public Date getView_log_date() {
		return view_log_date;
	}
	public void setView_log_date(Date view_log_date) {
		this.view_log_date = view_log_date;
	}

	private int video_id;
	private String video_title;
	private int user_id;
	private Date video_post_date;
	private String video_code;
	private String video_content;
	private int video_hit;
	private int video_like_count;
	private int video_dislike_count;
	private int video_vote_flag;
	private String hashtag;

	public int getVideo_id() {
		return video_id;
	}
	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}
	public String getVideo_title() {
		return video_title;
	}
	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getVideo_post_date() {
		return video_post_date;
	}
	public void setVideo_post_date(Date video_post_date) {
		this.video_post_date = video_post_date;
	}
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
	}
	public String getVideo_content() {
		return video_content;
	}
	public void setVideo_content(String video_content) {
		this.video_content = video_content;
	}
	public int getVideo_hit() {
		return video_hit;
	}
	public void setVideo_hit(int video_hit) {
		this.video_hit = video_hit;
	}

	public int getVideo_like_count() {
		return video_like_count;
	}

	public void setVideo_like_count(int video_like_count) {
		this.video_like_count = video_like_count;
	}

	public int getVideo_dislike_count() {
		return video_dislike_count;
	}

	public void setVideo_dislike_count(int video_dislike_count) {
		this.video_dislike_count = video_dislike_count;
	}

	public int getVideo_vote_flag() {
		return video_vote_flag;
	}

	public void setVideo_vote_flag(int video_vote_flag) {
		this.video_vote_flag = video_vote_flag;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

}
