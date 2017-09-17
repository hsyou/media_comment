package org.project.media_comment.domain;

/**
 * Created by user1 on 2017-09-10.
 */
public class MyInfoVO {

    //내 아디, 레벨, 게시글수, 댓글수, 경험치, 비번변경, 내 관심 해시태그 + 변경,
    String user_email;
    int videoCnt;
    int replyCnt;
    int exp;

    public String getUser_email() {
        return user_email;
    }

    public int getVideoCnt() {
        return videoCnt;
    }

    public void setVideoCnt(int videoCnt) {
        this.videoCnt = videoCnt;
    }

    public int getReplyCnt() {
        return replyCnt;
    }

    public void setReplyCnt(int replyCnt) {
        this.replyCnt = replyCnt;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getExp() {
        return exp;
    }

    public void setExp(int exp) {
        this.exp = exp;
    }
}
