import { Header_close_2 } from '../../../../common/components/CommonComponents'


@Entry
@Component
struct AvatarPage {

  build() {
    Column(){
      //1头部
      Header_close_2()

      //2头像
      Image($r('app.media.userhead_example2'))
        .width('300')
        .margin({top: 100, bottom: 50})

      Column({space: 25}){
        //3更换头像
        Column(){
          Text('更换头像')
            .fontSize(20)
            .fontColor($r('app.color.start_window_background'))
        }
        .borderRadius(10)
        .width(250)
        .height(55)
        .backgroundColor($r('app.color.gray'))
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {

        })



        //4保存图片
        Column(){
          Text('保存图片')
            .fontSize(20)
            .fontColor($r('app.color.start_window_background'))
        }
        .borderRadius(10)
        .width(250)
        .height(55)
        .backgroundColor($r('app.color.gray'))
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .onClick(() => {

        })


      }



    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.black'))


  }
}