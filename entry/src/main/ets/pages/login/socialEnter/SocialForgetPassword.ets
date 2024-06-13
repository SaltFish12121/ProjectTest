import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import LoginService from '../../../service/LoginService'

@Entry
@Component
struct SocialForgetPassword {
  @State phoneNumber: string = ''
  @State verify: string = ''
  getPhoneVerify: string = ''

  @State title: string = '忘记密码'

  build() {
    Column() {
      //1头部
      Stack({ alignContent: Alignment.TopEnd }) {
        HeaderTitle({ title: this.title })
          .width('95%')

        Row() {
          Text('客服')
            .fontSize(16)
        }
        .height(59)
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/mine/service_center/ServiceCenterPage'
            }
          )
        })
      }

      //2输入
      Column() {
        Column() {
          TextInput({ placeholder: '请输入手机号码' })
            .backgroundColor($r('app.color.start_window_background'))
            .onChange(v => {
              this.phoneNumber = v
            })

          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)

        Column() {
          Row() {
            TextInput({ placeholder: '请输入验证码' })
              .width('70%')
              .backgroundColor($r('app.color.start_window_background'))

            Button('获取验证码')
              .backgroundColor($r('app.color.button1'))
              .margin({ top: -20, right: 20 })
              .onClick(() => {

                //发送手机号获取验证码，进入重发倒计时
                this.getVerify()

              })
          }



            Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)

        }
        .margin({ top: 40 })

      //3按钮
      Column(){
        Button('下一步')
          .width('90%')
          .backgroundColor($r('app.color.button1'))
          .onClick(() => {

            //判断验证码是否正确
            this.ifVerity()


          })
      }
      .width('100%')
      .margin({top: 20})



    }
  }

  //获取手机验证码
  getVerify(){
    LoginService.getPhoneVerify(this.phoneNumber)
      .then(verify => {
        console.log('Tags', '获取验证码', verify)

        this.getPhoneVerify = verify
      })
      .catch(error => {
        console.log('Tags', '没有获得验证码')

      })
  }

  //判断验证码是否正确
  ifVerity(){
    if (this.verify == this.getPhoneVerify) {
      //验证成功
      router.pushUrl(
        {
          url: 'pages/login/socialEnter/SocialResetPasswordPage',
          params: {
            data1: this.phoneNumber
          }
        }
      )
    } else {
      //验证失败
      AlertDialog.show({
        message: '验证码错误',
        confirm: {
          value: '确定',
          action: ()=>{}
        }
      })

    }
  }

}