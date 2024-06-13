import router from '@ohos.router'
import { HeaderTitle } from '../../../../common/components/CommonComponents'
import LoginService from '../../../../service/LoginService'

@Entry
@Component
struct ChangePasswordPage {
  @State oldPassword: string = ''
  @State newPassword: string = ''

  @State success: boolean = true

  @State title: string = '修改密码'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })

      //2提示
      Row(){
        Text('未设置或忘记旧密码')
          .fontSize(16)
          .fontColor($r('app.color.text_gray'))

        Text('请点击此处')
          .fontSize(16)
          .fontColor($r('app.color.blue'))
          .onClick(() => {
            router.pushUrl(
              {
                url: 'pages/login/socialEnter/SocialForgetPassword'
              }
            )
          })

      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height(37)
      .backgroundColor($r('app.color.mid_gray'))

      //3密码修改
      Column(){
        Column({space: 5}){
          TextInput({ placeholder: '旧密码'})
            .fontSize(20)
            .placeholderFont({ size: 20, weight: 400 })
            .backgroundColor($r('app.color.start_window_background'))
            .onChange((v) => {
              this.oldPassword = v
            })

          Divider()
            .width('90%')
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)
        .height(61)

        Column({space: 5}){
          TextInput({ placeholder: '新密码'})
            .fontSize(20)
            .placeholderFont({ size: 20, weight: 400 })
            .backgroundColor($r('app.color.start_window_background'))
            .onChange((v) => {
              this.newPassword = v
            })

          Divider()
            .width('90%')
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)
        .height(61)

        //密码要求
        Text('密码为8-16位，至少包含字母、数字或"_"两种组合')
          .fontSize(12)
          .fontColor($r('app.color.text_gray'))


      }

      //确定
      Button('确定')
        .margin({top: 40})
        .type(ButtonType.Normal)
        .backgroundColor($r('app.color.button1'))
        .width('90%')
        .borderRadius(10)
        .onClick(() => {
          //链接后台修改密码

          //返回
          router.back()
        })



    }
    .width('100%')
    .height('100%')

  }

  //是否修改成功
  ifSuccess(){
    if (this.success!=true) {
      //1.旧密码错误

    } else {
      //2.密码修改成功（不论是否与旧密码相同）
      

    }

  }

  //修改密码
  alterPassword(){
    let userId = 1

    LoginService.alterPassword(userId, this.oldPassword, this.newPassword)
      .then((success: boolean) => {


        this.success = success
      })
      .catch((error) => {

      })

  }

}