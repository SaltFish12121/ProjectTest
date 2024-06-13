@Component
export default struct Exercise_Upload {
  build() {
    Column({space: 10}){
      Text('上传作品')
        .width('100%')

      Scroll(){
        Column(){
          Image($r('app.media.exercise_test1'))

        }
        .width(250)
        .height(300)

      }
      .width('90%')
      .height(177)



      Row(){

        Row({space: 10}){
          Image($r('app.media.camera'))
            .width(20)
            .margin({left: 8})

          Text('上传图片')
        }
        .width(110)
        .height(32)
        .border({ width: 1, color: $r('app.color.text_gray'), radius: 5, style: BorderStyle.Solid })

      }
      .margin({top: 30})
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)



    }
    .width('90%')
    .margin({top: 30, bottom: 60})
  }
}