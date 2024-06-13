@Component
export default struct Exercise_Top_Self {
  build() {
    Column(){

      //1样例
      Column(){

        Row(){
          Text('样例')

          Text('楷体')

        }
        .width('95%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)


        Image($r('app.media.exercise_test1'))
          .width('90%')

      }
      .width('90%')

    }
  }
}