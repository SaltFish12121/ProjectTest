import router from '@ohos.router'
import { Header_close } from '../../../common/components/CommonComponents'
import LoginService from '../../../service/LoginService'
import PreferencesUtil from '../../../common/util/PreferencesUtil'
import UserInfo from '../../../viewmodel/user/UserInfo'

@Entry
@Component
struct StudentEnter {
  @State userName: string = ''
  @State userPassword: string = ''
  @State allow:boolean = false

  build() {
    Column(){
      //1头部
      Header_close()
        .width('95%')

      //2登录输入
      Column(){
        Text('学校账号登录')
          .width('90%')
          .fontSize(28)
          .fontWeight(FontWeight.Medium)
          .margin({bottom: 50})

        Column(){
          TextInput({placeholder: '账号'})
            .backgroundColor($r('app.color.start_window_background'))
            .onChange((v) => {
              this.userName = v
            })

          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)

        Column(){
          Row(){
            TextInput({placeholder: '请输入密码'})
              .width('75%')
              .backgroundColor($r('app.color.start_window_background'))
              .onChange((v) => {
                this.userPassword = v
              })

            Text('忘记密码？')
              .fontColor($r('app.color.text_gray'))
              .onClick(() => {
                router.pushUrl(
                  {
                    url: 'pages/mine/service_center/ServiceCenterPage'
                  }
                )
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
        Column(){
          Button('登录')
            .width('85%')
            .backgroundColor($r('app.color.button1'))
            .onClick(() => {

              //1.判断用户登录
              this.loginUser()

            })
        }
        .margin({top: 40})



      }
      .margin({top: 40})
      .width('100%')
    }

  }






  loginUser(){
    if (this.allow) {
      console.log(`userName = ${this.userName} : userPassword = ${this.userPassword}`)

      LoginService.login(this.userName, this.userPassword)
        .then((userId: number) => {
          console.log('Tags','Enter获取user数据')

          this.preferenceUser(userId)

        })
        .catch(error => {


          console.log('Tags', '没有在Enter获取user数据')
        })

      router.replaceUrl(
        {
          url: 'pages/mainpage/HomePage',
          params:{
            ifLogin: 1,
            login: true
          }
        }
      )
    } else {
      AlertDialog.show({
        message: '请勾选隐私同意',
        confirm: {
          value: '确定',
          action: ()=>{}
        }
      })
    }
  }

  preferenceUser(userId: number) {
    // user.name = await PreferencesUtil.getPreferenceValue('MyPerferences', 'UserName', '默认名') as string
    PreferencesUtil.putPreferenceValue('MyPreferences', 'UserID', userId)
  }

}