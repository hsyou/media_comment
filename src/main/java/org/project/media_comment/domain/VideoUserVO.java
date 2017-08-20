package org.project.media_comment.domain;

public class VideoUserVO {
    private int user_id;
    private int video_id;

    public VideoUserVO() {
    }

    public VideoUserVO(int user_id, int video_id) {
        this.user_id = user_id;
        this.video_id = video_id;
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
}
