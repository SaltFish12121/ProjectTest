import router from '@ohos.router'
import { HeaderTitle, HeaderTitleCollect } from '../../../common/components/CommonComponents'
import Exercise_ShowDetail_Self from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Self'
import Exercise_Top_Self from '../../../views/exercise/exercise_detial/Exercise_Top_Self'
@Entry
@Component
struct SelfFinishPage {

  @State title: string = '基础笔画练习'

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitleCollect({ title: this.title })

        //2内容

        Exercise_Top_Self()


        //3练习情况
        Exercise_ShowDetail_Self()
        .margin({ top: 10 })


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
        //收藏
        Image($r('app.media.icon'))
          .width(40)
      }

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


        //2样例
        Column(){
          Text('样例')

          Image($r('app.media.icon'))
            .width(100)
            .height(200)
        }

        //3评价
        Row(){
          Scroll(){
            Image($r('app.media.icon'))
          }
          .width(50)
          .height(100)

          Column(){
            Row(){
              Text('系统综合评分')

              Text('90')
            }

            Row(){
              Text('总体评价')

            }
          }
        }

        //提示
        Column(){
          Text('点击图片可查看详情')
        }
      }

      //3 关闭
      Button('关闭')
        .onClick((event: ClickEvent) => {

        })
    }
  }
*/