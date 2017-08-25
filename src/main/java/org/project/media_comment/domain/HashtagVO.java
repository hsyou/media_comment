package org.project.media_comment.domain;

public class HashtagVO {

    private int video_id;
    private String hashtag;

    public HashtagVO() {
    }

    public HashtagVO(int video_id, String hashtag) {
        this.video_id = video_id;
        this.hashtag = hashtag;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }
}
