import { HeaderTitle } from '../../common/components/CommonComponents'
import Exercise_Upload from '../../views/exercise/exercise_detial/Exercise_Upload'
@Entry
@Component
struct CompetitionUnfinishedPage {
  @State rating: number = 3.5

  @State title: string = '基础笔画练习'

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitle({ title: this.title })

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

          //4倒计时
          Row({space: 30}){
            Text('剩余时间')

            Text('00:30:00')
          }
          .width('90%')

          //5上传作品
          Exercise_Upload()


        }

        //3 关闭
        Column(){
          Text('提交')
            .fontSize(20)
            .onClick((event: ClickEvent) => {

            })
        }
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