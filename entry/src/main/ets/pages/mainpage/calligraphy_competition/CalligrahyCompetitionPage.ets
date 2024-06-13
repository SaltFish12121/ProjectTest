import router from '@ohos.router'
import {  HeaderSearch } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import CompetitionInformItem from '../../../viewitem/CompetitionInformItem'
import CompetitionInformInfo from  '../../../viewmodel/CompetitionInformInfo'

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
struct CalligrahyCompetitionPage {

  @State competition: CompetitionInformInfo[] = [
    new CompetitionInformInfo(true, '本系统第二届', '2024-5-25', $r('app.media.homepage_competition')),
    new CompetitionInformInfo(true, '本系统第一届', '2024-5-25', $r('app.media.homepage_competition2')),
    new CompetitionInformInfo(true, '本系统成人大赛', '2024-5-25', $r('app.media.homepage_competition3')),
    new CompetitionInformInfo(false, '第四届书法竞赛', '2024-5-25', $r('app.media.homepage_competition')),
    new CompetitionInformInfo(false, '第三届书法竞赛', '2024-5-25', $r('app.media.homepage_competition2')),
    new CompetitionInformInfo(false, '第二届书法竞赛', '2024-5-25', $r('app.media.homepage_competition3')),
    new CompetitionInformInfo(false, '第一届书法竞赛', '2024-5-25', $r('app.media.homepage_competition')),
    new CompetitionInformInfo(false, '全国书法大赛', '2024-5-25', $r('app.media.homepage_competition2'))
  ]

  build() {
    Column({space: 5}){

      //1.首部
      HeaderSearch()


      Scroll(){
        Column(){
          //2 本系统竞赛
          Column(){
            Column(){
              Text('更多')
                .fontSize(24)
            }
            .width('95%')
            .alignItems(HorizontalAlign.End)
            .onClick(() => {
              router.pushUrl(
                {
                  url: 'pages/mainpage/calligraphy_competition/CompetitionMorePage',
                  params: this.competition
                }
              )
            })

            Swiper() {
              //2.1 图片
              ForEach(
                this.competition,
                (competition: CompetitionInformInfo) =>{
                  if (competition.type==true) {
                    Image(competition.cover)
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

            }
            .margin({top: 10})
            .width('90%')
            .height(232)
            .backgroundColor(Color.White)
            .borderRadius(CommonConstants.DEFAULT_18)
          }


          //3 第三方竞赛
          Column(){
            Column(){
              Text('第三方竞赛')
                .fontSize(24)
            }
            .width('95%')
            .alignItems(HorizontalAlign.Start)

            Column(){
              //竞赛信息类别
              Column({space: 10}){
                Column(){

                }
                .height(5)

                ForEach(
                  this.competition,
                  (competition: CompetitionInformInfo) => {
                    //如果是第三方，type==false
                    if (competition.type==false){
                      Column() {
                        CompetitionInformItem({ competition: competition })
                      }
                      .height(100)
                      .exercise_List()

                    }


                  }
                )

                Column(){

                }
                .height(100)
              }
              .alignItems(HorizontalAlign.Center)
              .width('100%')
              .height('100%')

            }
            .width('100%')

          }
          .width('100%')
          .margin({top: 20})


        }

      }


    }
  }
}


