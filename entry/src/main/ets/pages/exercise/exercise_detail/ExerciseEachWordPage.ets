import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
import WordInfo from '../../../viewmodel/WordInfo'

@Entry
@Component
struct ExerciseEachWordPage {
  content: string =
`优点
    总体大小适中，位置合理




不足
    这个字整体过于分离左右结构，左右分的太开右半部分，撇点与点过小`

  @State word: WordInfo = new WordInfo('', [])


  onPageShow(){
    const word = router.getParams()

    if (word['ifSuccess'] == 1) {
      this.word = word['data']
    }

  }

  build() {
    Column(){
      //1头部
      HeaderTitle()
      // .position({ x: 0, y: 0})

      Scroll(){
        Column(){

          //2内容
          Row(){
            //左边
            Column({space: 10}){
              //1字
              Column(){
                Image(this.word.word)
                  .width(120)
                  .height(120)
              }
              .alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.Center)
              .width(140)
              .height(140)
              .border({ width: 1, color: $r('app.color.text_gray'), radius: 0, style: BorderStyle.Solid})

              //2提示
              Column(){
                Text('笔画详情也可以点击查看哦')
                  .fontSize(12)
                  .fontColor($r('app.color.light_black'))
              }

              //3综合建议
              Column({space: 10}){
                Text('综合建议')
                  .fontSize(20)

                Column(){
                  Text(this.content)
                    .fontSize(16)
                    .width('90%')
                }
                .width('100%')
                .padding({top: 10, bottom: 10})
                .constraintSize({ minHeight: 300})
                .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid})
              }
              .alignItems(HorizontalAlign.Start)
              .width('100%')
              .margin({top: 20})

            }
            .height('80%')
            .width('48%')
            .align(Alignment.Top)




            //右边
            Column(){
              //1综合评分
              Row({ space: 10 }){
                Text('综合评分')
                  .fontSize(28)

                Text('86')
                  .fontColor($r('app.color.text_red'))
                  .fontSize(28)
              }
              .height(100)
              .alignItems(VerticalAlign.Center)



              //2笔画详情
              Column(){

                Column(){
                  Text('笔画详情')
                    .height(50)

                  Divider()
                }
                .alignItems(HorizontalAlign.Center)
                .justifyContent(FlexAlign.SpaceBetween)
                .height(50)


                ForEach(
                  this.word.strokes,
                  (stroke: any) => {


                    Column(){
                      Row(){
                        Image(stroke)
                          .sourceSize({width: 50, height: 40})
                          .height(40)
                          .width(50)

                        Text('80')
                          .fontColor($r('app.color.text_red'))
                      }
                      .width('90%')
                      .height(50)
                      .alignItems(VerticalAlign.Center)
                      .justifyContent(FlexAlign.SpaceBetween)

                      Divider()

                    }

                    .width('100%')


                  }
                )



              }
              // .width('100%')
              .padding({top: 10, bottom: 10})
              .constraintSize({ minHeight: 300})
              .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid})

            }
            .height('80%')
            .width('48%')

          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('95%')

          //3关闭
          Column(){
            Text('关闭')
              .fontSize(28)
          }
          .margin({top: 50})
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .border({ width: 1, color: $r('app.color.text_gray'), radius: 0, style: BorderStyle.Solid})
          .height(50)
          .width(150)
          .onClick(() => {
            router.back()
          })

          Column(){

          }
          .height(100)

        }
        .align(Alignment.Top)
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
    }

  }
}