package org.project.media_comment.service;

import org.project.media_comment.domain.VideoCountVO;
import org.project.media_comment.domain.VideoUserVO;
import org.project.media_comment.domain.VideoVO;
import org.project.media_comment.domain.VideoVoteVO;
import org.project.media_comment.persistence.VideoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by hs on 2017-07-22.
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoDAO videoDAO;

    @Override
    public int uploadVideo(VideoVO vo) throws Exception {
        return videoDAO.uploadVideo(vo);
    }

    @Override
    public VideoVO getVideo(int video_id,int user_id) throws Exception {
        videoDAO.increaseHit(video_id);
        if(user_id==0){
            return videoDAO.getVideo(video_id);
        }
        return videoDAO.getVideoLogin(new VideoUserVO(user_id,video_id));
    }

    @Override
    public List<VideoVO> listAllVideo() throws Exception {
        return videoDAO.listAllVideo();
    }
    @Override
    public int voteVideo(VideoVoteVO vo) throws Exception {

        Integer flag=vo.getVideo_vote_flag();
        int video_id=vo.getVideo_id();
        Integer result=null;
        result=videoDAO.selectVideoVote(vo);
        //-1 : dislike
        // 0 : default
        // 1 : like
        if(result==null){ //기록이 없으면 insert
            videoDAO.voteVideo(vo);
            result=flag;
            if(flag==1) {
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 1, 0));
            }else{
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 0, 1));
            }
        }else if(result.equals(flag)){//중복 선택 -> default로
            if(flag==1){//이전 상태가 like이었으면
                videoDAO.updateVideoCount(new VideoCountVO(video_id, -1, 0));
            }else{
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 0, -1));
            }
            videoDAO.updateVideoVote(0);
            result=0;
        }else if(!result.equals(flag)){//다른 선택 -> 다른선택으로
            if(result==1&&flag==-1){//like->dislike
                videoDAO.updateVideoCount(new VideoCountVO(video_id, -1, 1));
                result=-2;
            }else if(result==0&&flag==1){
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 1, 0));
                result=1;
            }else if(result==0&&flag==-1){
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 0, 1));
                result=-1;
            }else{ //dislike->like
                videoDAO.updateVideoCount(new VideoCountVO(video_id, 1, -1));
                result=2;
            }
            videoDAO.updateVideoVote(vo.getVideo_vote_flag());
        }

        return result;
    }

}
