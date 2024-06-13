
export default class WordInfo{
  word: any
  strokes: any[]
  strokeNumber: number

  constructor(word: any, strokes: any[], strokeNumber: number = 8) {
    this.word = word
    this.strokes = strokes
    this.strokeNumber = strokeNumber
  }
}