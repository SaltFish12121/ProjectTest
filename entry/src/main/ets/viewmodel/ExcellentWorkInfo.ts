export default class ExcellentWorkInfo{
  type: WorkType
  come: string
  title: string
  time: string

  constructor(type: WorkType, come: string, title: string, time: string) {
    this.type=type
    this.come=come
    this.title=title
    this.time=time
  }
}

export enum WorkType{
  schoolWork = '学校作品',
  competitionWork = '竞赛作品'
}