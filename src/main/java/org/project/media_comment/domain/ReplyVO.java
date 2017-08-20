package org.project.media_comment.domain;

/**
 * Created by hs on 2017-08-05.
 */
public class ReplyVO {

    private int reply_id;
    private int user_id;
    private int video_id;
    private int reply_playtime;
    private String reply_content;
    private int reply_like_count;
    private int reply_dislike_count;
    private int reply_flag;
    private int reply_vote_flag;

    public ReplyVO() {
    }

    public int getReply_id() {
        return reply_id;
    }

    public int getReply_vote_flag() {
        return reply_vote_flag;
    }

    public void setReply_vote_flag(int reply_vote_flag) {
        this.reply_vote_flag = reply_vote_flag;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
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

    public int getReply_playtime() {
        return reply_playtime;
    }

    public void setReply_playtime(int reply_playtime) {
        this.reply_playtime = reply_playtime;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public int getReply_like_count() {
        return reply_like_count;
    }

    public void setReply_like_count(int reply_like_count) {
        this.reply_like_count = reply_like_count;
    }

    public int getReply_dislike_count() {
        return reply_dislike_count;
    }

    public void setReply_dislike_count(int reply_dislike_count) {
        this.reply_dislike_count = reply_dislike_count;
    }

    public int getReply_flag() {
        return reply_flag;
    }

    public void setReply_flag(int reply_flag) {
        this.reply_flag = reply_flag;
    }
}
