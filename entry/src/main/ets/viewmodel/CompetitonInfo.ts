export default class CompetitionInfo{
  type: CompetitionType
  title: string
  startTime: string
  runTime: string
  score: number

  constructor(type: CompetitionType, title: string, startTime: string, runTime: string, score: number = 0) {
    this.type=type
    this.title=title
    this.startTime=startTime
    this.runTime=runTime
    this.score=score
  }
}

export enum CompetitionType{
  unStart,
  underWay,
  completed
}