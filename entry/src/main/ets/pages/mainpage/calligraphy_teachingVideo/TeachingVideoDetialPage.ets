import router from '@ohos.router'
import { HeaderCollect } from '../../../common/components/CommonComponents'
import Video_Brief_Introduction from '../../../views/homepage/calligraphy_teaching/Video_Brief_Introduction'
import VideoInfo from '../../../viewmodel/VideoInfo'
import LabelInfo from '../../../viewmodel/LabelInfo'
import Video_Catalogue from '../../../views/homepage/calligraphy_teaching/Video_Catalogue'

@Entry
@Component
struct TeachingVideoDetialPage {
  @State currentIndex: number = 0
  @State video_title : string = ''
  label : LabelInfo[]
  @State order: any = $r('app.media.positive_order')
  private order1: any = $r('app.media.inverted_order')
  private  temp: any

  @State videoSrc: Resource = $rawfile('video1.mp4')
  @State previewUri: Resource = $r('app.media.show_knoledge')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()


  @State arr: number[] = [1,2,3,4,5,6,7,8,9]

  //自定义组件实现tabs组件拥有图片
  @Builder TabBarBuilder(title: ResourceStr, index: number){
    if (index == 0){
      Column({space: 8}){
        Text(title)
          .fontSize(14)
          .fontColor(this.selectColor(index))

        Divider()
          .color(this.selectColor(index))
          .width(40)
          .strokeWidth(4)
      }
    }
    else {
      Row(){
        Column({space: 8}){
          Text(title)
            .fontSize(14)
            .fontColor(this.selectColor(index))

          Divider()
            .color(this.selectColor(index))
            .width(40)
            .strokeWidth(4)
        }

        if (this.currentIndex == 1) {
          Column(){
            Image(this.order)
              .width(24)
          }
          .onClick(() => {
            this.temp = this.order
            this.order = this.order1
            this.order1 = this.temp
            this.arr.reverse()
          })

        }

      }
      .margin({left: 40})
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .width('70%')
    }

  }

  selectColor(index: number){
    return this.currentIndex === index ? $r('app.color.blue') : $r('app.color.light_black')
  }

  onPageShow(){
    const params = router.getParams();

    this.label = params['data1'];
    this.video_title = params['data2'] as string;
    // console.log(`title=${this.video_title}`)
  }

  build() {
    Column(){
      //1 头部
      HeaderCollect()

      //2 知识内容
      Column({space: 10}){

        Text(this.video_title)
          .fontSize(36)

        Column(){
          // Text('这是视频主体')

          Video({
            src: this.videoSrc,
            previewUri: this.previewUri,
            currentProgressRate: this.curRate,
            controller: this.controller
          }).width('100%').height(200)
            .autoPlay(this.isAutoPlay)
            .controls(this.showControls)
            .onStart(() => {
              console.info('onStart')
            })
            .onPause(() => {
              console.info('onPause')
            })
            .onFinish(() => {
              console.info('onFinish')
            })
            .onError(() => {
              console.info('onError')
            })
            .onPrepared((e) => {
              console.info('onPrepared is ' + e.duration)
            })
            .onSeeking((e) => {
              console.info('onSeeking is ' + e.time)
            })
            .onSeeked((e) => {
              console.info('onSeeked is ' + e.time)
            })
            .onUpdate((e) => {
              console.info('onUpdate is ' + e.time)
            })

        }
        .width('90%')
        .height(200)
        .backgroundColor($r('app.color.light_gray'))


        Column(){
          Tabs({barPosition: BarPosition.Start}){
            //简介
            TabContent(){
              Video_Brief_Introduction({ label: this.label})
            }.tabBar(this.TabBarBuilder('简介', 0))

            //目录
            TabContent(){
              Video_Catalogue({ arr: this.arr })
            }.tabBar(this.TabBarBuilder('目录', 1))

          }
          .barMode(BarMode.Scrollable)
          .onChange(index => {
            this.currentIndex = index
          })

        }
        .width('100%')
        .height(500)

      }
      .alignItems(HorizontalAlign.Center)

    }
  }
}