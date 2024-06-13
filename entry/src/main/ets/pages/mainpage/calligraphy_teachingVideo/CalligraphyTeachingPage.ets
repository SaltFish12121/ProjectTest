import router from '@ohos.router'
import { HeaderSearch } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import VideoItem from '../../../viewitem/VideoItem'
import VideoInfo from '../../../viewmodel/VideoInfo'
import LabelInfo from '../../../viewmodel/LabelInfo'


@Extend(GridCol) function video_List(){
  .borderRadius(CommonConstants.DEFAULT_10)
  .backgroundColor(Color.White)
  .borderColor($r('app.color.text_gray'))
  .borderWidth(1)
  .height(200)
}

@Entry
@Component
struct CalligraphyTeachingPage {

  @State video: VideoInfo[] = [
    new VideoInfo('楷书的教学视频1', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书叔'),
      new LabelInfo('教育'),
      new LabelInfo('学习'),
      new LabelInfo('横折练习'),
      new LabelInfo('弯钩'),
      new LabelInfo('撇捺'),
      new LabelInfo('笔画'),
    ]),
    new VideoInfo('楷书的教学视频2', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频3', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频4', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频5', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频6', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频7', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ])
  ]

  build(){
    Column(){
      //1.头部
      HeaderSearch()

      //2.视频 排列??
      Scroll(){
        Column(){
          Column(){

          }
          .height(5)

          GridRow({
            columns: 2,
            gutter: { x: 5, y: 10 },
            breakpoints: { value: ["400vp", "600vp", "800vp"],
              reference: BreakpointsReference.WindowSize },
            direction: GridRowDirection.Row
          }) {

            ForEach(
              this.video ,
              (video: VideoInfo) => {
                GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {

                  VideoItem({ video: video })

                }
                .video_List()


              }
            )


          }
          .width("98%")
          .onBreakpointChange((breakpoint) => {
            // this.currentBp = breakpoint
            // console.log(`this==${this.currentBp}`)
          })

          Column(){

          }
          .height(100)

        }
        .margin({top: 5})
      }

    }


  }
}