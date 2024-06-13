import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import VideoInfo from '../../../viewmodel/VideoInfo'
import LabelInfo from '../../../viewmodel/LabelInfo'
import VideoCollectItem from '../../../viewitem/collect/VideoCollectItem'
import UserService from '../../../service/UserService'

@Extend(ListItem) function video_List(){
  .width('95%')
  .borderRadius(CommonConstants.DEFAULT_10)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}

@Component
export default struct Video_Collect {

  /*
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
  * */

  @Link videoCollect: VideoInfo[]

  build() {
    Scroll(){
      Column(){
        //作业列表
        List({space: 10}){
          ListItem(){

          }
          .height(5)

          ForEach(
            this.videoCollect,
            (video) => {
              ListItem() {

                VideoCollectItem({ video: video })

              }
              .video_List()

            }
          )

          ListItem(){

          }
          .height(100)
        }
        .alignListItem(ListItemAlign.Center)
        .listDirection(Axis.Vertical) // 排列方向
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
        .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
        .onScrollIndex((firstIndex: number, lastIndex: number) => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .width('100%')
        .height('100%')

      }
    }
  }


  getVideoCollect(){
    let Userid = 1

    UserService.getVideoCollect(Userid)
      .catch((collect) => {
        console.log('Tags', '获取个人视频收藏成功')

        this.videoCollect = collect
      })
      .then((error) => {
        console.log('Tags', '获取个人视频收藏失败')
      })
  }

}