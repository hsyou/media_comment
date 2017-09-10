package org.project.media_comment.persistence;

import org.project.media_comment.domain.PercentMapVO;

/**
 * Created by pose2 on 2017-09-02.
 */
public interface PercentMapDAO {
    public PercentMapVO getPercentMap(int percentMapId)throws Exception;
    public void makeNewMapConnectedWithNewComment(int replyId,PercentMapVO vo)throws Exception;
    public void updateByResampledMap(PercentMapVO vo)throws Exception;
}
