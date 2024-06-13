import router from '@ohos.router'
import {  HeaderTitleTypeCollect } from '../../../common/components/CommonComponents'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import Exercise_ShowDetail_Self from '../../../views/exercise/exercise_detial/Exercise_ShowDetail_Self'
import Exercise_Top_School from '../../../views/exercise/exercise_detial/Exercise_Top_School'
import ExerciseInfo from '../../../viewmodel/ExerciseInfo'
import { ExerciseType } from '../../../viewmodel/ExerciseInfo'

@Entry
@Component
struct SchoolFinishPage {
  @State rating: number = 3.5

  @State title: string = '基础笔画练习'
  @State type: string = '个人'

  onPageShow(){
    const get = router.getParams()

    if (get['ifSuccess'] == 1) {
      this.title = get['title']
    }

    this.type = '个人'

    console.log('Tabs_Exercise', this.title, this.type)
  }

  build(){
    Scroll(){
      Column(){
        //1 头部
        HeaderTitleTypeCollect({ title: this.title, type: this.type })
          .width('95%')


        //2 内容

        Exercise_Top_School()
        .margin({bottom: 15})

        //3详情
        Exercise_ShowDetail_Self()


        //4教师评语
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


        //5 关闭
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
        Column({space: 15}){


          //4作业情况
          Column(){
            Row({space: 10}){

              Scroll(){
                Column({space: 10}){
                  Image($r('app.media.exercise_test1'))
                    .width('100%')
                    .height(250)
                    .onClick(() => {
                      router.pushUrl(
                        {
                          url: 'pages/exercise/exercise_detail/ExerciseDetailPage'
                        }
                      )
                    })

                  Image($r('app.media.exercise_test1'))
                    .width('100%')
                    .height(250)
                    .onClick(() => {
                      router.pushUrl(
                        {
                          url: 'pages/exercise/exercise_detail/ExerciseDetailPage'
                        }
                      )
                    })

                }

              }
              .width('55%')
              .height(250)


              Column({space: 40}){

                Row({space: 10}){
                  Text('系统综合评分')
                    .fontSize(18)

                  Text('90')
                    .fontSize(18)
                    .fontColor($r('app.color.text_red'))
                }
                .width('100%')


                Row({space: 10}){
                  Text('本人排名')
                    .fontSize(18)

                  Text('128')
                    .fontSize(18)
                    .fontColor($r('app.color.text_red'))
                }
                .width('100%')


                Column({space: 5}){
                  Text('系统评语')
                    .width('100%')

                  Column(){
                    Text('评语内容')
                      .fontSize(12)
                      .width('95%')
                      .margin({top: 15, bottom: 15})
                  }
                  .width('90%')
                  .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })

                }
                .justifyContent(FlexAlign.Center)
                .width('100%')

              }
              .width('40%')
              .height('80%')

            }
            .width('100%')



            Column(){
              Text('点击图片可查看详情')
                .fontSize(14)
            }
            .height(40)
            .width('95%')
            .alignItems(HorizontalAlign.Start)
            .justifyContent(FlexAlign.Center)




          }
          .height(280)
          .width('100%')




        }
*/