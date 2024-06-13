import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import CompetitionItem from '../../viewitem/CompetitionFinisheItem'
import CompetitionInfo from '../../viewmodel/CompetitonInfo'
import { CompetitionType } from '../../viewmodel/CompetitonInfo'

@Extend(Column) function exercise_List(){
  // .margin({left: 10, bottom: 5})
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
export default struct Competition_Finished {
  @Link competition: CompetitionInfo[]/* = [
    new CompetitionInfo(CompetitionType.completed, '第二次书法竞赛', '2024-3-3', '', 91),
    new CompetitionInfo(CompetitionType.completed, '第一次书法竞赛', '2024-3-2', '', 90)
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
            this.competition,
            (competition: CompetitionInfo) => {

              if (competition.type == CompetitionType.completed ){
                Column() {
                  CompetitionItem({competition: competition})
                }
                .exercise_List()
                .onClick(() => {
                  router.pushUrl(
                    {
                      url: 'pages/competition/CompetitionFinishedPage'
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
    .height('100%')
    .align(Alignment.Top)

  }
}
