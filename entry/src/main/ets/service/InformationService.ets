import KnowledgeInfo from  '../viewmodel/KnowledgeInfo'
import VideoInfo from '../viewmodel/VideoInfo'
import CompetitionInformInfo from '../viewmodel/CompetitionInformInfo'
import ProblemInfo from '../viewmodel/ProblemInfo'

class InformationService{
  /**
   * 获取常用问题
   * @returns 常用问题
   */
  getCommonProblem(): Promise<ProblemInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取首页知识展示
   * @returns 首页知识展示
   */
  getKnowledgeShow(): Promise<KnowledgeInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取首页视频展示
   * @returns 首页视频展示
   */
  getVideoShow(): Promise<VideoInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取首页竞赛展示
   * @returns 首页竞赛展示
   */
  getCompetitionShow(): Promise<CompetitionInformInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }


}

let informationService = new InformationService()

export default informationService as InformationService