export default class MessageInfo{
  type: MessageType
  title: string
  time: string
  content: string

  constructor(type: MessageType, title: string, time: string, content: string) {
    this.type=type
    this.title=title
    this.time=time
    this.content=content
  }
}

export enum MessageType{
  system = 0,
  homeworkPost = 1,
  homeworkRemind = 2,
  competition = 3
}

export const  messages: MessageInfo[] = [
  new MessageInfo(MessageType.system,'信息设置','2024-5-24','123'),
  new MessageInfo(MessageType.system,'信息设置1','2024-5-242','122')
]