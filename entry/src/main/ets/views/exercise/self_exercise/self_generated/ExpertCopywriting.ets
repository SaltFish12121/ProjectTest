import router from '@ohos.router'
import { CommonConstants } from '../../../../common/constants/CommonConstants'
import ExpertCopywritingItem from '../../../../viewitem/ExpertCopywritingItem'
import ExerciseInfo from  '../../../../viewmodel/ExerciseInfo'
import ExerciseService from '../../../../service/ExerciseService'

@Extend(ListItem) function exercise_List(){
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
export default struct ExpertCopywriting {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  @State exercise: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3'),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'将进酒', '2024-3-2')
  ]

  @State expertCopybook: ExerciseInfo[] = []

  build() {
    Scroll(){
      //专家字帖列表
      List({space: 10}){
        ListItem(){

        }
        .height(5)

        ForEach(this.exercise, (exercise) => {
          ListItem() {
            ExpertCopywritingItem({ exercise: exercise})
          }
          .exercise_List()


        })

        ListItem(){

        }
        .height(100)
      }
      .alignListItem(ListItemAlign.Center)
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
      .width('100%')
      .height('100%')
    }
  }


  //获取专家字帖
  getExpertCopybook(){
    ExerciseService.getExpertCopybook()
      .then((expertCopybook: ExerciseInfo[]) => {
        console.log('Tags', '获取专家字帖成功')

        this.expertCopybook = expertCopybook
      })
      .catch(() => {
        console.log('Tags', '获取专家字帖失败')
      })
  }

}