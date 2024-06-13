import ExerciseInfo from '../viewmodel/ExerciseInfo'

enum ExerciseType{
  schoolExercise = '学校作业',
  selfExercise = '自我练习',
  competition = '竞赛'
}

@Component
export default struct ExerciseItem {
  exercise: ExerciseInfo

  build() {

    Row({space: 10}){
      Column({space: 20}){
        Text(this.exercise.title)
          .fontSize(20)

        Text(this.exercise.time)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .height('70%')

      Blank()

      Column(){

        if (this.exercise.type == ExerciseType.selfExercise){
          Text(this.exercise.type)
            .fontColor($r('app.color.tips'))
        } else {
          Text(this.exercise.type)
            .fontColor($r('app.color.tips_red'))
        }

      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height('60%')
      .width(90)


      if (this.exercise.type == ExerciseType.selfExercise){
        Column(){
          if (this.exercise.finish) {
            Text('得分:'+this.exercise.score)
              .fontColor($r('app.color.tips_red'))
          } else {
            Text('未作')
              .fontColor($r('app.color.tips_red'))
          }


        }

      } else {
        Column(){
          if (this.exercise.cutoff){
            Text('已截止')
              .fontColor($r('app.color.text_red'))
          } else {
            Text('未截止')
              .fontColor($r('app.color.tips'))
          }

        }

      }

    }
    .width('90%')
    .height(100)

  }

}