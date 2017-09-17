package org.project.media_comment.persistence;

import org.project.media_comment.domain.PercentMapVO;

/**
 * Created by pose2 on 2017-09-02.
 */
public interface PercentMapDAO {
    public PercentMapVO getPercentMap(int percentMapId)throws Exception;
    public PercentMapVO getPercentMapByReplyId(int reply_id)throws Exception;
    public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo)throws Exception;
    public void insertDefaultMap(PercentMapVO vo)throws Exception;
    public void updateANDmapOrdering(PercentMapVO vo)throws Exception;
}
