import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import SystemCopybookItem from '../../../viewitem/SystemCopybookItem'
import ExerciseInfo from  '../../../viewmodel/ExerciseInfo'
import ExerciseService from '../../../service/ExerciseService'

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
struct NewSystemPage {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State exercise: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3'),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'将进酒', '2024-3-2')
  ]

  @State copybook: ExerciseInfo[] = []

  @State title: string = '系统字帖'

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

  //获取系统字帖
  getSystemCopybook(){
    ExerciseService.getSystemCopybook()
      .then((copybook: ExerciseInfo[]) => {
        console.log('Tags', '获取系统字帖成功')

        this.copybook = copybook
      })
      .catch((error) => {
        console.log('Tags', '获取系统字帖失败')
      })
  }

}