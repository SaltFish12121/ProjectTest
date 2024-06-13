export default class KnowledgeInfo{
  type: KnowledgeType
  ifRecommend: boolean
  title: string
  viewNumber: number
  time: string
  cover: any

  constructor(type: KnowledgeType = KnowledgeType.biography, ifRecommend: boolean = false ,title: string = '',viewNumber: number = 0,time: string = '',cover: any = '') {
    this.type=type
    this.ifRecommend=ifRecommend
    this.title=title
    this.viewNumber=viewNumber
    this.time=time
    this.cover=cover

  }
}

export enum KnowledgeType{
  biography = '人物传记',
  famousWorks = '名家作品',
  Hanzi = '汉字',
  culture = '文化'
}

