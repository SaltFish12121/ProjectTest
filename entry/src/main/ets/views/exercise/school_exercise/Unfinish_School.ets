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
export default struct Unfinish_School {
  @Link exercise: ExerciseInfo[]/* = [
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3'),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'横折练习', '2024-3-2')
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

              if (exercise.finish == false ) {
                Column() {
                  ExerciseItem({ exercise: exercise })
                }
                .exercise_List()
                .onClick(() => {
                  router.pushUrl(
                    {
                      url: 'pages/exercise/exercise_school/SchoolUnfinishPage',
                      params: {
                        ifSuccess: 1,
                        title: exercise.title
                      }
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

