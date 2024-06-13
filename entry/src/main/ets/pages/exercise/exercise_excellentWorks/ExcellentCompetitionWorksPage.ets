import { HeaderTitle, HeaderTitleCollect } from '../../../common/components/CommonComponents'
import Exercise_ShowDetail_Competition from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Competition'
import Exercise_ShowDetail_Self from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Self'
@Entry
@Component
struct ExcellentCompetitionWorksPage {

  @State title: string = '基础笔画练习'

  build() {
    Scroll(){
      Column(){
        //1头部
        HeaderTitleCollect({ title: this.title })

        //2出处
        Row(){
          Row(){
            Text('来源：')
              .fontSize(16)

            Text('系统')
              .fontSize(16)
          }

          /*
          Column(){
            //收藏
            Image($r('app.media.collect0'))
              .width(40)
          }
          */

        }
        .margin({bottom: 20})
        .width('90%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceBetween)


        //3内容（可能多个）


        Exercise_ShowDetail_Competition()

        Exercise_ShowDetail_Competition()

        Exercise_ShowDetail_Competition()


        Column(){

        }.height(50)

      }
    }

  }
}