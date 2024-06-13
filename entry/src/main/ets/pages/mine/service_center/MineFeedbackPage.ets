import { HeaderTitle } from '../../../common/components/CommonComponents'
import UserService from '../../../service/UserService'
import FeedbackInfo from '../../../viewmodel/FeedbackInfo'

@Entry
@Component
struct MineFeedbackPage {
  private arr: number[] = [0, 1]

  @State feedback: FeedbackInfo[] = [
    new FeedbackInfo('用户1', '如何注册', '2024-6-5'),
    new FeedbackInfo('用户1', '如何创建练习', '2024-6-5'),
    new FeedbackInfo('用户1', '如何报名竞赛', '2024-6-5')/*,
    new FeedbackInfo('用户1', '如何注册', '2024-6-5'),
    new FeedbackInfo('用户1', '如何创建练习', '2024-6-5'),
    new FeedbackInfo('用户1', '如何报名竞赛', '2024-6-5'),
    new FeedbackInfo('用户1', '如何注册', '2024-6-5'),
    new FeedbackInfo('用户1', '如何创建练习', '2024-6-5'),
    new FeedbackInfo('用户1', '如何报名竞赛', '2024-6-5'),*/
  ]

  @State title: string = '我的反馈'

  build() {
    Scroll(){
      Column(){
        //1头部
        HeaderTitle({ title: this.title })
          .backgroundColor($r('app.color.start_window_background'))

        Divider()

        //2反馈内容
        Column(){
          List(){
            ForEach(this.feedback, (feedback: FeedbackInfo) => {
              ListItem() {

                Row(){
                  Column(){
                    Row(){
                      Column(){
                        Image($r('app.media.userhead_example2'))
                          .borderRadius(55)
                          .width(55)
                      }
                      .width(55)


                      Column(){
                        Text(feedback.userName)

                        Text(feedback.time)
                      }
                      .height(45)
                      .alignItems(HorizontalAlign.Start)
                      .justifyContent(FlexAlign.SpaceBetween)
                      .margin({left: 10})

                    }
                    .height(70)
                    .width('95%')

                    Column(){
                      Text(feedback.content)
                    }
                    .alignItems(HorizontalAlign.Start)
                    .width('90%')

                  }
                  .width('100%')
                  .justifyContent(FlexAlign.Center)
                  .alignItems(HorizontalAlign.Center)


                }
                .width('100%')
                .height(120)

              }
              .backgroundColor($r('app.color.start_window_background'))

              ListItem(){
                Divider()
              }

            })

            ListItem(){

            }
            .height(100)

          }

        }
        .width('100%')


      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.mid_gray'))
    }
  }

  //获得个人意见反馈记录
  getMineFeedback(){
    let userId = 1

    UserService.getMineFeedback(userId)
      .then((feedback: FeedbackInfo[]) => {
        console.log('Tags', '获取个人意见反馈记录成功')

        this.feedback = feedback
      })
      .catch((error) => {
        console.log('Tags', '获取个人意见反馈记录失败')
      })
  }

}