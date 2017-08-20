package org.project.media_comment.domain;

public class VideoCountVO {//count 조절 VO
    private int video_id;
    private int video_like;
    private int video_dislike;

    public VideoCountVO() {
    }

    public VideoCountVO(int video_id, int video_like, int video_dislike) {
        this.video_id = video_id;
        this.video_like = video_like;
        this.video_dislike = video_dislike;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getVideo_like() {
        return video_like;
    }

    public void setVideo_like(int video_like) {
        this.video_like = video_like;
    }

    public int getVideo_dislike() {
        return video_dislike;
    }

    public void setVideo_dislike(int video_dislike) {
        this.video_dislike = video_dislike;
    }
}
