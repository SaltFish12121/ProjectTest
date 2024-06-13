@Component
export default struct Video_Catalogue {
  arr: number[]
  @State arr1: number[] = []

  aboutToAppear(){
    this.arr1 = this.arr
  }

  build() {
    Scroll(){
      Column(){

        ForEach(
          this.arr1,
          (arr) => {
            Column(){
              Column(){
                Row({space: 10}){
                  Text(''+arr)

                  Text('名称')
                }
                .height('50%')
                .alignItems(VerticalAlign.Center)

                Row(){
                  Text('时长')
                    .fontSize(12)
                    .fontColor($r('app.color.text_gray'))

                  Text('观看数')
                    .fontSize(12)
                    .fontColor($r('app.color.text_gray'))
                }
                .height('50%')
                .width('95%')
                .alignItems(VerticalAlign.Center)
                .justifyContent(FlexAlign.SpaceBetween)

              }
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)
              .height(80)
              .width('90%')

              Divider()
            }
            .width('100%')


          }
        )

        Column(){

        }
        .height(50)

      }
      .width('100%')

    }

  }
}