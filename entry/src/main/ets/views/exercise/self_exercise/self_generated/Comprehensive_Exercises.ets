import router from '@ohos.router'
@Component
export default struct Comprehensive_Exercises {
  build() {
    Scroll(){

      Column({space: 15}){
        //1名称
        Row({space: 10}){
          Text('名称')
            .fontSize(20)

          TextInput({placeholder: '请输入名称'})
            .backgroundColor($r('app.color.start_window_background'))
            .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
            .width(200)
        }
        .width('90%')
        .height(77)


        //2内容
        Column({space: 10}){
          Text('内容')
            .fontSize(20)
            .width('100%')
            .textAlign(TextAlign.Start)

          TextArea()
            .backgroundColor($r('app.color.start_window_background'))
            .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
            .height('90%')

        }
        .width('90%')
        .height('40%')

        //3排版
        Row({space: 40}){
          Text('选择排版')
          .fontSize(20)

          Row({space:5}){
            Select([{ value: '默认', icon: "/common/public_icon.svg" },
              { value: '居中', icon: "/common/public_icon.svg" },
              { value: '竖版', icon: "/common/public_icon.svg" }])
              .selected(0)
              .value('默认')
              .font({ size: 14, weight: 500 })
              .fontColor('#182431')
              .selectedOptionFont({ size: 16, weight: 400 })
              .optionFont({ size: 16, weight: 400 })
              .onSelect((index: number) => {
                console.info('Select:' + index)
              })


            // Text('默认')
            //   .fontSize(14)

            // Image($r('app.media.down'))
            //   .width(12)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width(64)
          .height(31)
          .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
          .onClick(() => {

          })

        }
        .margin({top: 20})
        .width('90%')

        //4字体
        Row({space: 40}){
          Text('选择字体')
          .fontSize(20)

          Row({space:5}){
            Select([{ value: '楷书', icon: "/common/public_icon.svg" },
              { value: '行书', icon: "/common/public_icon.svg" },
              { value: '行楷', icon: "/common/public_icon.svg" },
              { value: '草书', icon: "/common/public_icon.svg" }])
              .selected(0)
              .value('楷书')
              .font({ size: 14, weight: 500 })
              .fontColor('#182431')
              .selectedOptionFont({ size: 16, weight: 400 })
              .optionFont({ size: 16, weight: 400 })
              .onSelect((index: number) => {
                console.info('Select:' + index)
              })

            // Text('楷体')
            //
            // Image($r('app.media.down'))
            //   .width(12)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width(64)
          .height(31)
          .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
          .onClick(() => {

          })


        }
        .margin({top: 20})
        .width('90%')

        //5确认
        Column(){
          Text('确认')
            .fontSize(28)
        }
        .margin({top: 40})
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width(170)
        .height(52)
        .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/exercise/exercise_self/self_generated/ComprehensiveExerciseVerifyPage'
            }
          )
        })


      }
      .width('100%')

    }
    .align(Alignment.TopStart)
    .width('100%')
    .height('100%')

  }
}