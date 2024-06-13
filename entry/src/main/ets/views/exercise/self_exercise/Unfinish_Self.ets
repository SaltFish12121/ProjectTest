import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import ExerciseItem from '../../../viewitem/ExerciseItem'
import ExerciseInfo from '../../../viewmodel/ExerciseInfo'

@Extend(Column) function exercise_List(){
  .width('95%')
  .borderRadius(CommonConstants.DEFAULT_10)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}

enum ExerciseType{
  schoolExercise = '学校作业',
  selfExercise = '自我练习'
}

@Component
export default struct Unfinish_Self {
  @Link exercise: ExerciseInfo[]/* = [
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, false),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, false)
  ]*/

  build() {
    Scroll(){
      Column(){
        //作业列表
        Column({space: 10}){
          Column(){

          }
          .height(5)

          ForEach(
            this.exercise ,
            (exercise: ExerciseInfo) => {

              if (!exercise.finish) {
                Column() {
                  ExerciseItem({ exercise: exercise })
                }
                .exercise_List()
                .onClick(() => {
                  router.pushUrl(
                    {
                      url: 'pages/exercise/exercise_self/SelfUnfinishPage'
                    }
                  )

                })
              }


            }
          )

          Column(){

          }
          .height(100)
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        // .height('100%')

      }

    }
    .align(Alignment.Top)
    .height('100%')

  }
}

