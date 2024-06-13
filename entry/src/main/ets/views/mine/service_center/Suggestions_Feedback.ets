import router from '@ohos.router'
@Component
export default struct Suggestions_Feedback {
  build() {
    Column(){


      //提交区
      Column(){
        Column(){
          Text('我的反馈')
            .fontColor($r('app.color.blue'))
        }
        .alignItems(HorizontalAlign.End)
        .width('95%')
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/mine/service_center/MineFeedbackPage'
            }
          )
        })


        Column(){
          TextArea({ placeholder: '填写建议与反馈' })
            .backgroundColor($r('app.color.start_window_background'))
        }
        .height(200)

        Column(){
          Stack(){
            Image($r('app.media.juxin'))
              .width(78)
              .height(78)

            Image($r('app.media.add'))
              .height(38)
              .width(38)
          }
        }
        .width('90%')
        .alignItems(HorizontalAlign.Start)
      }
      .justifyContent(FlexAlign.SpaceAround)
      .width('100%')
      .height(350)
      .backgroundColor($r('app.color.start_window_background'))


      //确定
      Button('确定')
        .margin({top: 20})
        .width('85%')
        .onClick((event: ClickEvent) => {

        })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.mid_gray'))
  }
}