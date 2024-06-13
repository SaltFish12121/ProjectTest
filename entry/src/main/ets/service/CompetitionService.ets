import CompetitionInfo from '../viewmodel/CompetitonInfo'

class CompetitionService{
  /**
   * 获取竞赛
   * @param userId
   * @returns 竞赛
   */
  getCompetition(userId: number): Promise<CompetitionInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }
}

let competitionService = new CompetitionService()

export default competitionService as CompetitionService