
@Extend(Row) function word_card(){
  .justifyContent(FlexAlign.Center)
  .width("100%")
  .height("100")
  .borderRadius(10)
}

@Component
export default struct Sample_Word {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6/*, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19*/]
  @Link selectNumber: number

  @State currentBp: string = 'unknown'

  @State color1: any = $r('app.color.button1')
  @State color2: any = $r('app.color.start_window_background')
  @State color: any[] = []

  build() {
    Scroll(){

      Column(){

        Column(){

        }
        .height(10)


        GridRow({
          columns: 4,
          gutter: { x: 10, y: 10 },
          breakpoints: { value: ["400vp", "600vp", "800vp"],
            reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {

          ForEach(this.arr , (item) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {

              Row(){
                Row(){
                  Image($r('app.media.0009'))
                    .sourceSize({width: 70, height: 90})
                    .width('80%')
                    .height('80%')
                    .backgroundColor(this.color[item])
                    // .fillColor(this.color[item])
                }
                .backgroundColor(this.color[item])
                .word_card()

              }
              .backgroundColor($r('app.color.start_window_background'))
              .word_card()

            }
            .borderColor($r('app.color.text_gray'))
            // .borderWidth(2)
            .onClick(() => {
              if (this.color[item] != this.color1) {
                this.color[item] = this.color1
                this.selectNumber ++
              } else{
                this.color[item] = this.color2
                this.selectNumber --
              }


            })


          })


        }
        .width("95%")
        .onBreakpointChange((breakpoint) => {
          this.currentBp = breakpoint
          // console.log(`this==${this.currentBp}`)
        })


        Column(){

        }
        .height(100)


      }
      .width('100%')
      .backgroundColor($r('app.color.mid_gray'))


    }
    .width('100%')
    .align(Alignment.TopStart)
    .backgroundColor($r('app.color.mid_gray'))
    .height('100%')
    .width('100%')


  }


}

/*
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'

  build() {

    Column() {

      GridRow({
        columns: 5,
        gutter: { x: 5, y: 10 },
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize },
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2)
        })
      }.width("100%").height("100%")
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })


    }.width('80%').margin({ left: 10, top: 5, bottom: 5 }).height(200)
    .border({ color: '#880606', width: 2 })

  }
*/
