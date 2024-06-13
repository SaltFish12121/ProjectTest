export default class ExerciseInfo{
  type: ExerciseType
  cutoff: boolean
  title: string
  time: string
  score: number
  finish: boolean

  constructor(type: ExerciseType = ExerciseType.schoolExercise, cutoff: boolean = false, title: string, time: string, score: number = 0, finish: boolean = true) {
    this.type=type
    this.cutoff=cutoff
    this.title=title
    this.time=time
    this.score=score
    this.finish=finish
  }
}

export enum ExerciseType{
  schoolExercise = '学校作业',
  selfExercise = '自我练习'
}