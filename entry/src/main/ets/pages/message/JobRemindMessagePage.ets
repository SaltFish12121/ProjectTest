import router from '@ohos.router'
import { HeaderTitle } from '../../common/components/CommonComponents'
import { CommonConstants } from '../../common/constants/CommonConstants'
import MessageInfo from '../../viewmodel/MessageInfo'
import MessageItem from '../../viewitem/MessageItem'
import { MessageType } from '../../viewmodel/MessageInfo'
import UserService from '../../service/UserService'

@Extend(Column) function message_List(){
  // .margin({left: 10, bottom: 5})
  .width('100%')
  .backgroundColor(0xFFFFFF)
  // .borderRadius(CommonConstants.DEFAULT_10)
  /*
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
  */
}


@Entry
@Component
struct JobRemindMessagePage {
  @State JobRemind_messages: MessageInfo[] = [
    new MessageInfo(MessageType.homeworkRemind,'作业“基础练习”已即将截止','2024-5-24','还剩4小时'),
    new MessageInfo(MessageType.homeworkRemind,'作业“基础练习”已即将截止','2024-4-9','还剩4小时')
  ]

  @State title: string = '作业提醒'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })

      Divider()
        .strokeWidth(2)

      //2消息列表
      Scroll(){
        //作业列表
        Column({space: 5}){
          Column(){

          }
          .height(5)

          //当前页获取
          ForEach(
            this.JobRemind_messages,
            (message) => {

              Column(){
                MessageItem({ message: message})
              }
              .message_List()

            }
          )

          /*
          //其他页获取
          ForEach(
            messages,
            (message) => {

              Column() {
                MessageItem({ message: message})
              }
              .message_List()

            }
          )
          */

          Column(){
            // Text('end')
          }
          .height(100)


        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height('100%')
        .backgroundColor($r('app.color.light_gray'))


      }


    }
  }

  getMineMessage(){
    let userId

    UserService.getMineMessage(userId, 2)
      .then((message: MessageInfo[]) => {
        console.log('Tags', '获取消息通知成功')

        this.JobRemind_messages = message
      })
      .catch((error) => {
        console.log('Tags', '获取消息通知失败')

      })
  }

}