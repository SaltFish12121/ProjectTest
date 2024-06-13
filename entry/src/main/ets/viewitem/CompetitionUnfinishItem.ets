import CompetitionInfo from '../viewmodel/CompetitonInfo'

@Component
export default struct CompetitionItem {
  competition: CompetitionInfo
  type: string
  color: any

  aboutToAppear() {
    this.Type()
  }

  Type() {
    switch(this.competition.type){
      case 0:
        this.type = '未开始';
        this.color = $r('app.color.tips')
        break;
      case 1:
        this.type = '进行中';
        this.color = $r('app.color.tips_red')
        break;
      case 2:
        this.type = '已结束';
        break;
      default :
        this.type = ' '
        break;
    }
  }

  build() {

    Row({space: 10}){
      Column({space: 20}){
        Text(this.competition.title)
          .fontSize(20)


        Text(this.competition.startTime)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .height('70%')

      Blank()

      Column(){
        Text('时间：'+this.competition.runTime+'分钟')
          .fontColor($r('app.color.tips_red'))
          .fontSize(14)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height('70%')
      .width(90)

      Column(){
        Text(this.type)
          .fontColor(this.color)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .height('70%')

    }
    .width('90%')
    .height(100)

  }
}