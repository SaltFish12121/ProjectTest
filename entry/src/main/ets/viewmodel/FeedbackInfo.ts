
export default class FeedbackInfo{
  userName: string
  content: string
  time: string
  feedback: string

  constructor(userName: string = '', content: string = '', time: string = '', feedback = '暂未回复') {
    this.userName = userName
    this.time=time
    this.content=content
    this.feedback = feedback
  }
}