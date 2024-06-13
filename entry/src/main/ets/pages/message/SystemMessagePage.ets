import { HeaderTitle } from '../../common/components/CommonComponents'
import { CommonConstants } from '../../common/constants/CommonConstants'
import MessageItem from '../../viewitem/MessageItem'
import { MessageType } from '../../viewmodel/MessageInfo'
import MessageInfo from '../../viewmodel/MessageInfo'
import UserService from '../../service/UserService'

@Extend(Column) function message_List(){
  .width('100%')
  .backgroundColor(0xFFFFFF)

}

@Entry
@Component
struct SystemMessagePage {
  @State System_messages: MessageInfo[] = [
    new MessageInfo(MessageType.system,'信息设置','2024-5-24','您修改头像已经通过审核'),
    new MessageInfo(MessageType.system,'尊贵的VIP用户','2024-4-9','恭喜你成为VIP')
  ]

  @State title: string = '系统消息'

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
            this.System_messages,
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

    UserService.getMineMessage(userId, 0)
      .then((message: MessageInfo[]) => {
        console.log('Tags', '获取消息通知成功')

        this.System_messages = message
      })
      .catch((error) => {
        console.log('Tags', '获取消息通知失败')

      })
  }

}