import MessageInfo from '../viewmodel/MessageInfo'

@Component
export default struct MessageItem {
  message: MessageInfo

  build() {
    Column(){
      Row(){
        Text(this.message.title)
          .fontSize(20)
      }
      .width('90%')
      .height(50)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)

      Row(){
        Text(this.message.content)

        Text(this.message.time)
      }
      .width('90%')
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height(100)
  }
}