import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import ExcellentWorkItem from '../../../viewitem/ExcellentWorkItem'
import ExcellentWorkInfo from '../../../viewmodel/ExcellentWorkInfo'
import { WorkType } from '../../../viewmodel/ExcellentWorkInfo'

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

@Component
export default struct Excellent_Works {
  @Link excellentWork: ExcellentWorkInfo[]/* = [
    new ExcellentWorkInfo(WorkType.schoolWork, '','横折练习', '2024-3-3'),
    new ExcellentWorkInfo(WorkType.competitionWork, '','第一次书法竞赛', '2024-3-2')
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
            this.excellentWork ,
            (excellentWork : ExcellentWorkInfo) => {
              Column() {
                ExcellentWorkItem({ excellentWork: excellentWork })
              }
              .exercise_List()
              .onClick(() => {

                if ( excellentWork.type == WorkType.schoolWork ) {

                  router.pushUrl(
                    {
                      url: 'pages/exercise/exercise_excellentWorks/ExcellentHomeworkPage'
                    }
                  )

                } else {

                  router.pushUrl(
                    {
                      url: 'pages/exercise/exercise_excellentWorks/ExcellentCompetitionWorksPage'
                    }
                  )
                }

              })
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
    .height('100%')
    .align(Alignment.Top)

  }
}