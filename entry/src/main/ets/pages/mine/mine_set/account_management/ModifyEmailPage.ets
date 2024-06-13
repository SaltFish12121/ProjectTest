import router from '@ohos.router'
import { HeaderTitle } from '../../../../common/components/CommonComponents'
@Entry
@Component
struct ModifyEmailPage {

  @State title: string = '邮箱'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })

      Divider()

      //2输入
      Column(){
        Column(){
          Row({space: 10}){
            Text('当前邮箱:')
              .fontSize(20)
              .backgroundColor($r('app.color.start_window_background'))

            Text('邮箱号')
              .fontSize(18)
          }
          .width('90%')
          .margin({bottom: 5})


          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)

        Column(){
          TextInput({placeholder: '请输入新邮箱'})
            .backgroundColor($r('app.color.start_window_background'))

          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)



      }
      .margin({top: 40})


      //3完成按钮
      Button('完成')
        .margin({top: 40})
        .type(ButtonType.Normal)
        .backgroundColor($r('app.color.button1'))
        .width('90%')
        .borderRadius(10)
        .onClick(() => {
          router.back()
        })

    }


  }
}