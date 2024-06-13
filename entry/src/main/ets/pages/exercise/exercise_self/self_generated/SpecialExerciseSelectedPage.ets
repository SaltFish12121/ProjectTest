import router from '@ohos.router'
import { HeaderTitle } from '../../../../common/components/CommonComponents'

@Extend(Column) function Select_colum(){
  .justifyContent(FlexAlign.Center)
  .alignItems(HorizontalAlign.Center)
  .width(120)
  .height(50)
  .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

}

@Extend(Row) function word_card(){
  .justifyContent(FlexAlign.Center)
  .width("100%")
  .height("100")
  .borderRadius(10)
}

@Entry
@Component
struct SpecialExerciseSelectedPage {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6/*, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19*/]
  @State currentBp: string = 'unknown'

  @State color1: any = $r('app.color.button1')
  @State color2: any = $r('app.color.gray')
  @State color: any[] = []

  @State ifEdit: boolean = false

  build() {
    Column(){
      //1头部
      HeaderTitle()

      //2内容
      Column({space: 15}){
        //提示
        Row(){
          Text('所选样例字')

          Text('编辑')
            .onClick(() => {
              this.ifEdit = !this.ifEdit
            })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')


        //选的字
        GridRow({
          columns: 4,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ["400vp", "600vp", "800vp"],
            reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {

          ForEach(this.arr, (item) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {


              if (this.ifEdit) {
                //编辑

                Row() {
                  Stack({alignContent: Alignment.TopEnd}){

                    Row(){
                      Image($r('app.media.delete'))
                    }
                    .margin({ top: -5, right: -5})
                    .width(20)
                    .height(20)


                    Row() {
                      Image($r('app.media.0009'))
                        .sourceSize({width: 70, height: 90})
                        .width('80%')
                        .height('80%')
                    }
                    .backgroundColor(this.color[item])
                    .word_card()


                  }
                  .onClick(() => {

                    console.log('onclick')

                    this.arr = this.arr.filter((index) => index != item)

                  })



                }
                .backgroundColor(this.color2)
                .word_card()
                // .borderWidth(1)
                // .borderColor($r('app.color.mid_gray'))

              } else {
                //未编辑

                Row() {
                  Row() {
                    Image($r('app.media.0009'))
                      .sourceSize({width: 70, height: 90})
                      .width('80%')
                      .height('80%')
                  }
                  .backgroundColor(this.color[item])
                  .word_card()

                }
                .backgroundColor(this.color2)
                .word_card()
                .borderWidth(1)
                .borderColor($r('app.color.mid_gray'))


              }


            }
            /*
            .onClick(() => {
              if (this.color[item] != this.color1) {
                this.color[item] = this.color1
              } else {
                this.color[item] = this.color2
              }

            })
            */

          })
        }


      }
      .margin({top: 50})
      .height('75%')
      .width('90%')


      //3按钮
      Row(){
        Column(){
          Text('取消')
            .fontSize(28)
        }
        .Select_colum()
        .onClick(() => {
          router.back()
        })

        Column(){
          Text('下一步')
            .fontSize(28)
        }
        .Select_colum()
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/exercise/exercise_self/self_generated/SpecialPreviewPage'
            }
          )
        })


      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('80%')


    }
    .width('100%')
    .height('100%')

  }
}