import router from '@ohos.router'
import { Header } from '../../../../common/components/CommonComponents'

@Extend(Column) function Select_colum(){
  .justifyContent(FlexAlign.Center)
  .alignItems(HorizontalAlign.Center)
  .width(120)
  .height(50)
  .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

}

@Entry
@Component
struct ComprehensiveExerciseVerifyPage {

  build() {
    Column(){
      //1头部
      Header()


      //2内容
      Column(){
        Row(){
          Text('练习名称')
            .fontSize(28)
        }
        .width('90%')
        .justifyContent(FlexAlign.Center)

        Column(){
          Image($r('app.media.exercise_test1'))
            .width(350)

        }
        .width(350)
      }
      .height('75%')
      .margin({top: 20})


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
          Text('生成')
            .fontSize(28)
        }
        .Select_colum()
        .onClick(() => {
          router.back()
          router.back()
        })


      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('80%')

    }
    .width('100%')
    .height('100%')

  }
}