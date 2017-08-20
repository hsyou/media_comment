package org.project.media_comment.domain;

import java.util.Date;

public class VideoVoteVO {

    private int video_vote_id;
    private int video_id;
    private int user_id;
    private Date video_vote_date;
    private int video_vote_flag;

    public VideoVoteVO() {
    }

    public VideoVoteVO(int video_id, int user_id, int video_vote_flag) {
        this.video_id = video_id;
        this.user_id = user_id;
        this.video_vote_flag = video_vote_flag;
    }

    public int getVideo_vote_id() {
        return video_vote_id;
    }

    public void setVideo_vote_id(int video_vote_id) {
        this.video_vote_id = video_vote_id;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getVideo_vote_date() {
        return video_vote_date;
    }

    public void setVideo_vote_date(Date video_vote_date) {
        this.video_vote_date = video_vote_date;
    }

    public int getVideo_vote_flag() {
        return video_vote_flag;
    }

    public void setVideo_vote_flag(int video_vote_flag) {
        this.video_vote_flag = video_vote_flag;
    }
}
