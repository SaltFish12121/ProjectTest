import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import ProblemInfo from '../../../viewmodel/ProblemInfo'

@Entry
@Component
struct CommonProblemPage {

  @State problem: ProblemInfo = new ProblemInfo()

  onPageShow(){
    this.problem = router.getParams()?.['problem']
  }

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.problem.title })

      //2内容
      Column({space: 10}){
        Text('问：我在电脑上登录本软件总是说验证码错误，可是我输入的是正确的呀，怎么办？')
          .fontSize(18)

        Text('答：您好，建议提供您的信息及截图联系本软件的在线客服帮您核查下。祝您学习愉快！')
          .fontSize(18)

      }
      .margin({ top: 50, bottom: 80})
      .width('95%')

      //3上一章  下一章
      Row({space: 30}){
        Button('上一章')
          .fontSize(14)
          .fontColor($r('app.color.blue'))
          .backgroundColor($r('app.color.start_window_background'))
          .border({ width: 1, color: $r('app.color.blue'), radius: 10, style: BorderStyle.Solid })
          .onClick(() => {

          })

        Button('下一章')
          .fontSize(14)
          .onClick(() => {

          })

      }
      .justifyContent(FlexAlign.End)
      .alignItems(VerticalAlign.Center)
      .width('90%')

    }
    .width('100%')
    .height('100%')

  }
}