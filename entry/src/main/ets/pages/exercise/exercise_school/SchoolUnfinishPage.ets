import router from '@ohos.router'
import {   HeaderTitleTypeCollect } from '../../../common/components/CommonComponents'
import Exercise_Top_School from '../../../views/exercise/exercise_detial/Exercise_Top_School'
import Exercise_Upload from '../../../views/exercise/exercise_detial/Exercise_Upload'
@Entry
@Component
struct SchoolUnfinishPage {
  @State rating: number = 3.5

  @State title: string = '标题'
  @State type: string = '类型'

  onPageShow(){
    const get = router.getParams()

    if (get['ifSuccess'] == 1) {
      this.title = get['title']
    }

    this.type = '集体'

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


        //3 倒计时
        Row({space: 30}){
          Text('截止日期')

          Text('2024-4-14')
        }
        .width('90%')


        //4 上传作品
        Exercise_Upload()

        // 3关闭
        Column(){
          Text('关闭')
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