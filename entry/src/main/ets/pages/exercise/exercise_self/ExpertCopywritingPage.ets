import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
@Entry
@Component
struct ExpertCopywritingPage {

  build() {
    Stack(){
      Column(){
        //1头
        HeaderTitle()

        Column(){
          //2内容
          Column({space: 20}){
            Text('《文章》')
              .fontSize(20)
              .width('100%')
              .textAlign(TextAlign.Center)


            Stack({ alignContent: Alignment.Center }){
              Text('作者')

              Text('字体')
                .width('80%')
                .textAlign(TextAlign.End)
            }
            .width('100%')


            Image($r("app.media.expertCopy1"))
              .width('90%')
          }
          .width('100%')

          //3是否生成
          Row(){
            Column(){
              Text('取消')
                .fontSize(28)

            }
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
            .width(130)
            .height(52)
            .onClick(() => {
              router.back()

            })


            Column(){
              Text('生成')
                .fontSize(28)

            }
            .alignItems(HorizontalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
            .width(130)
            .height(52)
            .onClick(() => {
              router.back()
              router.back()
            })


          }
          .width('80%')
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .height('80%')
        .justifyContent(FlexAlign.SpaceBetween)

      }
      .width('100%')
      .height('100%')
    }
  }
}