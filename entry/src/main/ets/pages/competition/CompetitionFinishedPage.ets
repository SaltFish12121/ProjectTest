import router from '@ohos.router'
import {  HeaderTitleCollect } from '../../common/components/CommonComponents'
import Exercise_ShowDetail_Competition from '../../views/exercise/exercise_detial/Exercise_ShowDetail_Competition'
@Entry
@Component
struct CompetitionFinishedPage {
  @State rating: number = 3.5

  @State title: string = '基础笔画练习'

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitleCollect({ title: this.title })

        //2 内容
        Column({space: 15}){
          //1信息
          Row(){
            /*
            Row(){
              Text('难度')

              Rating({ rating: this.rating, indicator: true })
                .stars(5)
                .stepSize(0.5)

            }
            */

            Row({space: 10}){
              Text('字数')

              Text('50')
            }

            Row(){
              Text('楷体')
            }

            /*
            Row(){
              Text('专项-偏旁部首练习')
            }
            */
          }
          .width('90%')
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Center)

          //2要求
          Column({space: 10}){
            Text('要求')
              .width('100%')
              .textAlign(TextAlign.Start)

            Column(){
              Text('作业要求')
                .fontSize(12)
                .width('95%')
                .margin({top: 15, bottom: 15})
            }
            .width('90%')
            .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

          }
          .width('90%')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)

          //3样例
          Column(){
            Text('样例')
              .width('100%')


            Image($r('app.media.exercise_test1'))
              .width('90%')
          }
          .width('90%')


        }



        Exercise_ShowDetail_Competition()
        .margin({ top: 15})

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
  Column(){
    //1 头部
    HeaderTitleType()

    //2 内容
    Column(){
      //1信息
      Row(){

        Row(){
          Text('字数')

          Text('50')
        }

        Row(){
          Text('楷体')
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
* */
