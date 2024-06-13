import router from '@ohos.router'
import VideoInfo from '../../viewmodel/VideoInfo'

@Component
export default struct VideoCollectItem {
  video: VideoInfo

  build() {
    Row({space: 10}){
      Column({space: 20}){
        Text(this.video.title)
          .fontSize(19)

        Row({space: 10}){
          // Text(`${this.knowledge.viewNumber}阅读`)
          //   .fontSize(12)

          Text(this.video.time)
            .fontSize(12)
        }

      }
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      .height('70%')

      Blank()

      Column(){
        Image(this.video.cover)
          .width(70)
          .height(70)

      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height('60%')
      .width(90)


    }
    .width('95%')
    .height(100)
    .onClick(() => {
      router.pushUrl(
        {
          url: 'pages/mainpage/calligraphy_teachingVideo/TeachingVideoDetialPage',
          params: {
            data1: this.video.label,
            data2: this.video.title
          }
        }
      )

    })
  }
}