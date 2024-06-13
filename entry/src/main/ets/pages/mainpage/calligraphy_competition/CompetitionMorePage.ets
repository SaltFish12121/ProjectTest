import router from '@ohos.router'
import { HeaderSearch } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import CompetitionInformItem from '../../../viewitem/CompetitionInformItem'
import CompetitionInformInfo from '../../../viewmodel/CompetitionInformInfo'

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

@Entry
@Component
struct CompetitionMorePage {
  @State competition: CompetitionInformInfo[] =[
    new CompetitionInformInfo(true, '', '', '')
  ]

  onPageShow(){
    this.competition = router.getParams() as CompetitionInformInfo[];

  }

  build(){
    Column(){
      //1 头部
      HeaderSearch()

      //2 竞赛列表
      Column({space: 10}){
        Column(){

        }
        .height(5)

        ForEach(
          this.competition,
          (competition: CompetitionInformInfo) => {
            //如果是第本系统，type==true
            if (competition.type==true){
              Column() {
                CompetitionInformItem({ competition: competition })

              }
              .height(100)
              .exercise_List()
              .onClick(() => {
                router.pushUrl(
                  {
                    url: 'pages/mainpage/calligraphy_competition/CompetitionThisPage',
                    params: competition
                  }
                )
              })


            }


          }
        )

        Column(){
          // Text('end')
        }
        .height(100)
      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .height('100%')


    }
  }
}


