package org.project.media_comment.domain;

public class ReplyPosVO {
    private int reply_x;
    private int reply_y;

    public ReplyPosVO() {
    }

    public ReplyPosVO(int reply_x, int reply_y) {
        this.reply_x = reply_x;
        this.reply_y = reply_y;
    }

    public int getReply_x() {
        return reply_x;
    }

    public void setReply_x(int reply_x) {
        this.reply_x = reply_x;
    }

    public int getReply_y() {
        return reply_y;
    }

    public void setReply_y(int reply_y) {
        this.reply_y = reply_y;
    }
}
