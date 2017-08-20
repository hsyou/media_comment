package org.project.media_comment.domain;

import java.util.Date;

public class ReplyVoteVO {

    private int reply_vote_id;
    private int reply_id;
    private int user_id;
    private Date reply_vote_date;
    private int reply_vote_flag;

    public ReplyVoteVO() {
    }

    public ReplyVoteVO(int reply_id, int user_id, int reply_vote_flag) {
        this.reply_id = reply_id;
        this.user_id = user_id;
        this.reply_vote_flag = reply_vote_flag;
    }

    public int getReply_vote_id() {
        return reply_vote_id;
    }

    public void setReply_vote_id(int reply_vote_id) {
        this.reply_vote_id = reply_vote_id;
    }

    public int getReply_id() {
        return reply_id;
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

    public Date getReply_vote_date() {
        return reply_vote_date;
    }

    public void setReply_vote_date(Date reply_vote_date) {
        this.reply_vote_date = reply_vote_date;
    }

    public int getReply_vote_flag() {
        return reply_vote_flag;
    }

    public void setReply_vote_flag(int reply_vote_flag) {
        this.reply_vote_flag = reply_vote_flag;
    }
}
