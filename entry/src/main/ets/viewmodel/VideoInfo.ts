import LabelInfo from '../viewmodel/LabelInfo'

export default class VideoInfo{
  title: string
  time: string
  cover: any
  label: LabelInfo[]

  constructor(title: string, time: string, cover: any, label: LabelInfo[]= []) {
    this.title=title
    this.time=time
    this.cover=cover
    this.label=label
  }
}
