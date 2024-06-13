import router from '@ohos.router'
import { HeaderTitle } from '../../common/components/CommonComponents'
@Entry
@Component
struct Copybook {

  build() {
    Column(){
      //1头部
      HeaderTitle()

      Column(){
        //2样例
        Column(){

          Row(){
            Text('样例')

            Text('楷体')

          }
          .width('95%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)


          Image($r('app.media.exercise_test1'))
            .width('90%')

        }
        .margin({top: 30})
        .width('90%')


        //3选择
        Column(){
          Text('选择')
            .fontSize(20)
        }
        .margin({top: 50})
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .width(120)
        .height(45)
        .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
        .onClick((event: ClickEvent) => {
          router.back()
          router.back()
        })

      }
      .height('85%')
      .justifyContent(FlexAlign.SpaceBetween)


    }
    .width('100%')
    .height('100%')

  }
}