@Component
export default struct Exercise_Top_School {
  @State rating: number = 3.5

  build() {
    Column(){
      //2
      Column({space: 15}){
        //1信息
        Row(){

          Row(){
            Text('难度')

            Rating({ rating: this.rating, indicator: true })
              .stars(5)
              .stepSize(0.5)

          }


          Row({space: 10}){
            Text('字数')
              .fontSize(14)

            Text('50')
              .fontSize(14)
          }

          Row(){
            Text('楷体')
              .fontSize(14)
          }


          Row(){
            Text('专项-偏旁部首练习')
              .fontSize(14)
          }
          .margin({right: -10})

        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)

        //2要求
        Column({space: 10}){
          Text('要求')
            .width('100%')
            .textAlign(TextAlign.Start)

          Column(){
            Text('作业要求')
              .fontSize(12)
              .width('95%')
              .margin({top: 15, bottom: 15})
          }
          .width('90%')
          .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

        }
        .width('90%')
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)

        //3样例
        Column(){
          Text('样例')
            .width('100%')


          Image($r('app.media.exercise_test1'))
            .width('90%')
        }
        .width('90%')
      }


    }

  }
}