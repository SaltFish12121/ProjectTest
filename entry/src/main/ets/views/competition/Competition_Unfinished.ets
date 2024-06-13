import router from '@ohos.router'
import { CommonConstants } from '../../common/constants/CommonConstants'
import CompetitionItem from '../../viewitem/CompetitionUnfinishItem'
import CompetitionInfo from '../../viewmodel/CompetitonInfo'
import { CompetitionType } from '../../viewmodel/CompetitonInfo'
import CompetitionService from '../../service/CompetitionService'

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
export default struct Compition_Unfinished{
  @Link competition: CompetitionInfo[]/* = [
    new CompetitionInfo(CompetitionType.underWay, '第三次书法竞赛', '2024-6-20', '30'),
    new CompetitionInfo(CompetitionType.unStart, '第四次竞赛', '2024-6-22', '30'),
    new CompetitionInfo(CompetitionType.unStart, '全国大赛', '2024-6-24', '30')
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

              if (competition.type != CompetitionType.completed){
                Column() {
                  CompetitionItem({competition: competition})
                }
                .exercise_List()
                .onClick(() => {
                  if (competition.type == CompetitionType.underWay) {
                    router.pushUrl(
                      {
                        url: 'pages/competition/CompetitionUnfinishedPage'
                      }
                    )
                  } else {
                    AlertDialog.show({
                      message: '未开始的竞赛无法查看',
                      confirm: {
                        value: '确定',
                        action: ()=>{
                        }
                      }
                    })
                  }

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