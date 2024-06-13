import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import SystemCopybookItem from '../../../viewitem/SystemCopybookItem'
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

@Entry
@Component
struct NewHistoryPage {
  @State exercise: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91)
  ]

  @State title: string = '已有练习'

  build() {
    Scroll(){
      Column(){
        //1头部
        HeaderTitle({ title: this.title })

        //2系统字贴列表
        Column({space: 10}){
          Column(){

          }
          .height(5)

          ForEach(this.exercise, (exercise) => {
            Column() {
              SystemCopybookItem({ exercise: exercise })
            }
            .exercise_List()

          })

        }
        .width('100%')

        Column(){

        }
        .height(50)

      }
    }
  }
}