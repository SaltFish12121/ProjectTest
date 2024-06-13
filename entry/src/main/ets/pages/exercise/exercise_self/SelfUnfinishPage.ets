import router from '@ohos.router'
import {  HeaderTitle } from '../../../common/components/CommonComponents'
import Exercise_Top_Self from '../../../views/exercise/exercise_detial/Exercise_Top_Self'
import Exercise_Upload from '../../../views/exercise/exercise_detial/Exercise_Upload'
@Entry
@Component
struct SelfUnfinishPage {

  @State title: string = '基础笔画练习'

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitle({ title: this.title })

        //2 内容
        Exercise_Top_Self()

        //3上传作品
        Exercise_Upload()

        //4关闭
        Column(){
          Text('关闭')
            .fontSize(20)
            .onClick((event: ClickEvent) => {
              router.back()
            })
        }
        .margin({top: 50})
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .width(120)
        .height(45)
        .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })


        Column(){

        }
        .height(50)

      }

    }
    .width('100%')
    .height('100%')
  }
}

/*
  build(){
    Column(){
      //1 头部
      HeaderTitle()

      //2 内容
      Column(){
        //1信息
        Row(){

          Row(){
            Text('楷体')
          }

          Row(){
            Text('专项-偏旁部首练习')
          }
        }

        //3样例
        Column(){
          Text('样例')

          Image($r('app.media.icon'))
            .width('80%')
        }

        //5上传作业
        Column(){
          Text('')

          Column(){
            Image($r('app.media.icon'))
              .width(200)
              .height(100)
          }


          Row(){
            Image($r('app.media.icon'))
              .width(20)

            Text('上传图片')

          }
        }
      }

      //3 关闭
      Button('关闭')
        .onClick((event: ClickEvent) => {

        })
    }
  }
*/