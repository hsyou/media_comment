package org.project.media_comment.persistence;


import org.project.media_comment.domain.PercentMapVO;
import org.springframework.stereotype.Repository;

/**
 * Created by pose2 on 2017-09-02.
 */
@Repository
public class PercentMapDAOImpl implements PercentMapDAO{

    @Override
    public PercentMapVO mapRefreshByNewPoint(int[] LastAndNewPoint, PercentMapVO vo) throws Exception {

        PercentMapVO tmpDTO = null;

        //차례대로 저장된

        int tmpWidth = vo.getMap().length;
        int tmpHeight = vo.getMap()[0].length;
        int mapSize = tmpHeight*tmpWidth;
        double addScore = 30/mapSize; // 여기서 30 이라는 수는 새롭게 선택된 좌표는 30칸짜리 가치가 있는 새로운 좌표라는 뜻으로 바꿔주어도 무방하다.

        double[][] tmpMap = vo.getMap();

        int lastX = LastAndNewPoint[0];
        int lastY = LastAndNewPoint[1];

        int newX = LastAndNewPoint[2];
        int newY = LastAndNewPoint[3];

        for(int i = -2; i<3; i++){
            for(int j = -2; j<3; j++){
                //정확한 포인트 에서부터 등차적으로 주위 포인트들에게도 addScore를 나눠준다. 멀어질수록 addScore는 줄어듬.,
                if(newX + i >= 0 && newX + i <tmpWidth && newY + j >= 0 && newY + j <tmpHeight){
                    if(i == 0 && j==0){
                        tmpMap[newX+i][newY+j] += addScore;
                    }else {
                        tmpMap[newX+i][newY+j] += addScore / (Math.pow(i, 2) + Math.pow(j, 2));
                    }
                }

                if(lastX + i >= 0 && lastX + i <tmpWidth && lastY + j >= 0 && lastY + j <tmpHeight){
                        tmpMap[lastX+i][newY+j] /= 2;
                }

            }
        }

        tmpMap = makeMapSumOne(tmpMap);

        tmpDTO.setMap(tmpMap);

        return tmpDTO;
    }

    @Override
    public double[][] makeMapSumOne(double[][] map) throws Exception {

        double sum = 0;

        for(int i = 0; i< map.length; i++){
            for(int j = 0; j<map[0].length; j++){
                sum += map[i][j];
            }
        }

        for(int i =0; i<map.length; i++){
            for(int j =0; j<map[0].length; j++){
                map[i][j]/=sum;
            }
        }

        return map;
    }

    @Override
    public int[] sampling(double[][] map) throws Exception {

        double randomNum = Math.random();
        double sum = 0;
        int[] newPoint_XandY = new int[2];

        for(int i = 0; i< map.length; i++){
            for(int j = 0; j<map[0].length; j++){
                sum += map[i][j];

                if(randomNum < sum){
                    newPoint_XandY[0] = i;
                    newPoint_XandY[1] = j;

                    return newPoint_XandY;
                }

            }
        }

        return null;
    }
}
