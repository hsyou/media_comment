package org.project.media_comment.persistence;

import org.project.media_comment.domain.PercentMapVO;

/**
 * Created by pose2 on 2017-09-02.
 */
public interface PercentMapDAO {
    public PercentMapVO mapRefreshByNewPoint(int[] LastAndNewPoint, PercentMapVO vo)throws Exception;
    public double[][] makeMapSumOne(double[][] map)throws Exception;
    public int[] sampling(double[][] map)throws Exception;

}
