package org.project.media_comment.domain;

public class ReplyCountVO {//count 조절 VO
    private int reply_id;
    private int reply_like;
    private int reply_dislike;

    public ReplyCountVO() {
    }

    public ReplyCountVO(int reply_id, int reply_like, int reply_dislike) {
        this.reply_id = reply_id;
        this.reply_like = reply_like;
        this.reply_dislike = reply_dislike;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public int getReply_like() {
        return reply_like;
    }

    public void setReply_like(int reply_like) {
        this.reply_like = reply_like;
    }

    public int getReply_dislike() {
        return reply_dislike;
    }

    public void setReply_dislike(int reply_dislike) {
        this.reply_dislike = reply_dislike;
    }
}
