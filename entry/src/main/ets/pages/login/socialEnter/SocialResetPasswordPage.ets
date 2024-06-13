import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import LoginService from '../../../service/LoginService'

@Entry
@Component
struct SocialResetPasswordPage {
  phoneNumber: string
  @State newPassword: string = ''
  @State format: boolean = true
  @State success: boolean = true

  onPageShow(){
    const params = router.getParams()

    this.phoneNumber = params['data1'] as string
    console.log(`phoneNumber = ${this.phoneNumber}`)
  }

  @State title: string = '重置密码'

  build() {
    Column(){
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
          TextInput({ placeholder: '新密码' })
            .backgroundColor($r('app.color.start_window_background'))
            .onChange(v => {
              this.newPassword = v

              this.ifFormat()

            })

          Divider()
        }
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('95%')
        .height(70)

        //提示
        Column(){
          Text('密码要求8-16位，至少包含数字、字母、"_"两种元素')
            .fontSize(14)
            .fontColor($r('app.color.text_gray'))
        }

      }
      .margin({ top: 40 })

      //3按钮
      Column(){
        Button('确认')
          .width('90%')
          .backgroundColor($r('app.color.button1'))
          .onClick(() => {

            this.updataPassword()

          })
      }
      .width('100%')
      .margin({top: 50})


    }
  }

  //格式是否正确
  ifFormat(){

  }


  //更新密码
  updataPassword(){
    if (this.format){
      //格式正确

      LoginService.forgetPassword(this.phoneNumber,this.newPassword)
        .then(success => {

          this.success = success

        })
        .catch(error => {

          console.log('Tags', '没有成功修改密码')
        })

      AlertDialog.show({
        message: '密码修改成功',
        confirm: {
          value: '确定',
          action: ()=>{
            router.back()
            router.back()
          }
        }
      })


    } else {
      //格式错误
      AlertDialog.show({
        message: '新密码格式错误',
        confirm: {
          value: '确定',
          action: ()=>{}
        }
      })

    }


  }

}