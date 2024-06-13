
import router from '@ohos.router'

//透明白色
@Extend(Text) function  opacityWhiteText(opacity: number, fontSize: number = 10){//继承
  .fontSize(fontSize)
  .fontColor(Color.White)
  .opacity(opacity)//透明度
}

@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World'

  async aboutToAppear(){
    this.jumpToIndex()
  }

  jumpToIndex(){
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/mainpage/HomePage'
      })
    }, 500)//延迟1000ms再跳转
  }

  jumpToLogin(){
    setTimeout(() => {
      router.replaceUrl({
        url: 'pages/login/LoginPage'
      })
    }, 500)//延迟1000ms再跳转
  }

  build() {
    Column({space: 10}){

      /*
      Row({space: 40}){
        Button('登录')
          .fontColor($r('app.color.black'))
          .backgroundColor($r('app.color.button2'))
          .onClick(() => {
            this.jumpToLogin()
          })

        Button('关闭')
          .fontColor($r('app.color.black'))
          .backgroundColor($r('app.color.button2'))
          .onClick(() => {
            this.jumpToIndex()
          })
      }
      */


      //1.中央slogan
      Row(){
        Image($r('app.media.app')).width(260)
      }
      .layoutWeight(1)//布局权重

      //2.logo
      // Image($r('app.media.video_1')).width(150)

      //3.文字描述
      Row(){
        Text('黑马健康支持').opacityWhiteText(0.8, 12)

        Text('IPv6').opacityWhiteText(0.8)
          .border({style: BorderStyle.Solid, width: 1,color: Color.White, radius: 15})//边框
          .padding({left: 5, right: 5})

        Text('网络').fontSize(12).fontColor(Color.White)
          .opacity(0.8)//透明度

      }
      Text(`'减更对‘指黑马健康APP希望通过软件工具的形式，帮助更多用户实现身材管理`).opacityWhiteText(0.6)
      Text('浙ICP备0000000号-36D').opacityWhiteText(0.4)
        .margin({bottom: 35})

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.start_window_background'))
  }
}