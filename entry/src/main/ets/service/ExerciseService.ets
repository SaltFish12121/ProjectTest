import ExerciseInfo from '../viewmodel/ExerciseInfo'
import ExcellentWorkInfo from '../viewmodel/ExcellentWorkInfo'

class ExerciseService{
  /**
   * 获取学校作业
   * @param userId
   * @returns 学校作业
   */
  getSchoolExercise(userId: number): Promise<ExerciseInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取自我练习
   * @param userId
   * @returns 自我练习
   */
  getMineExercise(userId: number): Promise<ExerciseInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取优秀作品
   * @param userId
   * @returns 优秀作品
   */
  getExcellentExercise(userId: number): Promise<ExcellentWorkInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取系统字帖
   * @returns 系统字帖
   */
  getSystemCopybook(): Promise<ExerciseInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取专家字帖
   * @returns 专家字帖
   */
  getExpertCopybook(): Promise<ExerciseInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取样本字
   * @returns 样本字
   */
  getSampleWord(): Promise<any[]>{
    return new Promise((resolve, reject) => {

    })
  }

}

let exerciseService = new ExerciseService()

export default exerciseService as ExerciseService