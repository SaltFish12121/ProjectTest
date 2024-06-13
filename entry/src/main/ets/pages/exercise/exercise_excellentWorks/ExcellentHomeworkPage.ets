import router from '@ohos.router'
import { HeaderTitleCollect } from '../../../common/components/CommonComponents'
import Exercise_ShowDetail_Competition from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Competition'
import Exercise_ShowDetail_Self from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Self'
import Exercise_Top_School from '../../../views/exercise/exercise_detial/Exercise_Top_School'
@Entry
@Component
struct ExcellentHomeworkPage {
  @State rating: number = 3.5

  @State title: string = '基础笔画练习'

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitleCollect({ title: this.title })
          .width('95%')

        //2出处
        Row(){
          Row(){
            Text('来源：')
              .fontSize(16)

            Text('教师李梅')
              .fontSize(16)
          }

          /*
          Column(){
            //收藏
            Image($r('app.media.collect0'))
              .width(40)
          }
          */

        }
        .margin({bottom: 20})
        .width('90%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceBetween)


        //3信息
        Exercise_Top_School()

        //4详情
        Exercise_ShowDetail_Self()


        //5教师评语
        Column(){
          Text('教师评语')
            .width('100%')

          Column(){
            Text('教师评语内容')
              .fontSize(12)
              .width('95%')
              .margin({top: 15, bottom: 15})
          }
          .width('90%')
          .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

        }
        .margin({top: 20})
        .width('90%')


        //3 关闭
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
  Scroll(){
    Column(){
      //1 头部
      HeaderTitleType()

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
            Text('难度')

            Rating({ rating: this.rating, indicator: true })
              .stars(5)
              .stepSize(0.5)
          }

          Row(){
            Text('字数')

            Text('50')
          }

          Row(){
            Text('楷体')
          }

          Row(){
            Text('专项-偏旁部首练习')
          }
        }

        //2要求
        Column(){
          Text('要求')

          Text('作业要求')
        }

        //3样例
        Column(){
          Text('样例')

          Image($r('app.media.icon'))
            .width('80%')
        }

        //4作业情况
        Column(){
          Row(){
            Image($r('app.media.icon'))
              .width('40%')
              .height(200)

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

          Column(){
            Text('点击图片可查看详情')
          }
        }


        //5教师评语
        Column(){
          Text('教师评语')

          Text('教师评语内容')
        }
      }

      //3 关闭
      Button('关闭')
        .onClick((event: ClickEvent) => {

        })
    }
  }
}
*/