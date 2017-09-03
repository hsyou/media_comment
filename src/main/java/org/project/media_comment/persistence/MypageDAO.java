package org.project.media_comment.persistence;

import org.project.media_comment.domain.MypageVO;
import java.util.*;

public interface MypageDAO {

    public void addActivity(MypageVO vo)throws Exception;
    public List getRecentActivity(int user_id)throws Exception;
}
