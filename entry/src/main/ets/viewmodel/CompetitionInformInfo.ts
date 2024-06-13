export default class CompetitionInformInfo{
  type: boolean
  title: string
  time: string
  cover: any
  content: string

  constructor(type: boolean = false, title: string = '', time: string = '', cover: any = '', content: string = '') {
    this.type=type
    this.title=title
    this.time=time
    this.cover=cover
    this.content=content
  }
}
