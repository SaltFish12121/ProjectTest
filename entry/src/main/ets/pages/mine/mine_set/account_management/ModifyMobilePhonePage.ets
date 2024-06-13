import router from '@ohos.router'
import { HeaderTitle } from '../../../../common/components/CommonComponents'
@Entry
@Component
struct ModifyMobilePhonePage {

  @State title: string = '手机号'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })

      Divider()

      //2输入
      Column(){
        Column(){
          TextInput({placeholder: '请输入新手机号'})
            .backgroundColor($r('app.color.start_window_background'))

          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)



        Column() {
          Row() {
            TextInput({ placeholder: '请输入验证码' })
              .width('75%')
              .backgroundColor($r('app.color.start_window_background'))

            Text('获取验证码')
              .width('25%')
              .fontColor($r('app.color.blue'))
              .onClick(() => {

              })

          }



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