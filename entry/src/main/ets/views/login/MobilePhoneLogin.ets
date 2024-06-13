import router from '@ohos.router'
import LoginService from '../../service/LoginService'

@Component
export default struct MobilePhoneLogin {
  @State phoneNumber: string = ''
  @State verify: string = ''
  getPhoneVerify: string = ''
  @State allow:boolean = false

  build() {
    Column(){
      Text('验证码登录')
        .width('90%')
        .fontSize(28)
        .fontWeight(FontWeight.Medium)
        .margin({bottom: 50})

      Column(){
        TextInput({placeholder: '请输入手机号码'})
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
            .onChange(v => {

              this.verify = v

            })

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


      //3隐私同意
      Row(){
        Checkbox({name: 'checkbox1',  group: 'checkboxGroup'})
          .select(false)
          .selectedColor($r('app.color.blue'))
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is'+ value)
            this.allow = value
          })

        Text('我已阅读并同意')
          .fontSize(14)

        Text('《隐私政策》')
          .fontColor($r('app.color.blue'))
          .fontSize(14)
          .onClick(() => {
            router.pushUrl(
              {
                url: 'pages/mine/mine_set/agreement/PrivacyAgreementPage'
              }
            )
          })

        Text('和')
          .fontSize(14)

        Text('《用户协议》')
          .fontColor($r('app.color.blue'))
          .fontSize(14)
          .onClick(() => {
            router.pushUrl(
              {
                url: 'pages/mine/mine_set/agreement/UserAgreementPage'
              }
            )
          })

      }
      .width('90%')



      //4登录
      Column({space: 30}){
        Button('登录')
          .width('85%')
          .backgroundColor($r('app.color.button1'))
          .onClick(() => {

            //尝试登录
            this.loginUser()

          })

      }
      .margin({top: 40})



    }
    .margin({top: 40})
    .width('100%')
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

  //用户登录
  loginUser(){
    //是否同意隐私条款
    if (this.allow) {
      //勾选
      if (this.verify == this.getPhoneVerify) {
        //验证成功
        console.log('Tags', '验证码登录成功')
        router.replaceUrl(
          {
            url: 'pages/mainpage/HomePage',
            params:{
              ifLogin: 1,
              login: false
            }
          }
        )


      } else {
        //验证失败
        console.log(`1: ${this.verify} 2: ${this.getPhoneVerify}`)
        AlertDialog.show({
          message: '验证失败',
          confirm: {
            value: '确定',
            action: ()=>{}
          }
        })

      }



    } else {
      //未勾选
      AlertDialog.show({
        message: '请勾选隐私同意',
        confirm: {
          value: '确定',
          action: ()=>{}
        }
      })
    }
  }

}