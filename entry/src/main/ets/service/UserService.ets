import MessageInfo from '../viewmodel/MessageInfo'
import UserInfo from '../viewmodel/user/UserInfo'
import ExerciseInfo from '../viewmodel/ExerciseInfo'
import ExcellentWorkInfo from '../viewmodel/ExcellentWorkInfo'
import KnowledgeInfo from '../viewmodel/KnowledgeInfo'
import VideoInfo from '../viewmodel/VideoInfo'
import FeedbackInfo from '../viewmodel/FeedbackInfo'

class UserService{
  /**
   * 获取个人基本信息
   * @param userId
   * @returns 个人基本信息
   */
  getPersonal(userId: number): Promise<UserInfo>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人收藏信息
   * @param userId
   * @returns 个人收藏信息
   */
  getExerciseCollect(userId: number): Promise<ExerciseInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人优秀作品收藏
   * @param userId
   * @returns
   */
  getExerciseExcellentCollect(userId: number): Promise<ExcellentWorkInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人知识收藏
   * @param userId
   * @returns
   */
  getKnowledgeCollect(userId: number): Promise<KnowledgeInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人视频收藏
   * @param userId
   * @returns
   */
  getVideoCollect(userId: number): Promise<VideoInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人消息
   * @param userId
   * @param messageType
   * @returns 个人消息
   */
  getMineMessage(userId: number, messageType: number): Promise<MessageInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

  /**
   * 获取个人意见反馈记录
   * @param userId
   * @returns 个人意见反馈记录
   */
  getMineFeedback(userId: number): Promise<FeedbackInfo[]>{
    return new Promise((resolve, reject) => {

    })
  }

}

let userService = new UserService()

export default userService as UserService