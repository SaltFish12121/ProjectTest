import router from '@ohos.router'
import { CommonConstants } from '../../../../common/constants/CommonConstants'
import Sample_Word from './Sample_Word'
@Extend(Row) function content_formant(){
  // .padding({top: 30, bottom: 35})
  // .borderRadius(CommonConstants.DEFAULT_10)
  // .width(CommonConstants.THOUSANDTH_940)
  .backgroundColor(Color.White)
  // .height(90)
  .shadow({
    radius: 6,
    color: "#000000",
    // offsetX: 0,
    // offsetY: 2,
  })
}

@Extend(Row) function row_top(){
  .padding({top: 30, bottom: 35})
  .borderRadius(CommonConstants.DEFAULT_10)
  .width(CommonConstants.THOUSANDTH_940)
  .backgroundColor(Color.White)
  .height(90)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}

@Component
export default struct Special_Exercises {
  @State selectNumber: number = 0
  @Prop radical: string

  build() {


    Column(){

      Column(){
        //1头部搜索
        Row({space: 5}){
          Search()
            .width(280)
            .height(30)

          Text('搜索')
        }
        .justifyContent(FlexAlign.Center)
        .width('95%')

        //2分类选择
        Row(){
          Row(){


            if (this.radical == ''){

              Text(`偏旁部首`)
                .textAlign(TextAlign.Center)
                .fontSize(16)
                .fontWeight(500)
                .width(80)
                .height(40)

            } else {

              Text(`${this.radical}`)
                .textAlign(TextAlign.Center)
                .fontSize(16)
                .fontWeight(500)
                .width(80)
                .height(40)
            }


            Image($r('app.media.enter'))
              .width(20)
              .margin({top: 5})
          }
          .width(100)
          .content_formant()
          .onClick(() => {
            console.log(`detail:${this.radical}`)

            router.pushUrl(
              {
                url: 'pages/exercise/exercise_self/RadicalSearchPage'
              }
            )
          })

          Row(){
            Select([{ value: '左右结构', icon: "/common/public_icon.svg" },
              { value: '上下结构', icon: "/common/public_icon.svg" },
              { value: '半包结构', icon: "/common/public_icon.svg" },
              { value: '全包结构', icon: "/common/public_icon.svg" }])
              .selected(2)
              .value('字体结构')
              .font({ size: 16, weight: 500 })
              .fontColor('#182431')
              .selectedOptionFont({ size: 16, weight: 400 })
              .optionFont({ size: 16, weight: 400 })
              .onSelect((index: number) => {
                console.info('Select:' + index)
              })
          }
          .content_formant()

          Row(){
            Select([{ value: '楷书', icon: "/common/public_icon.svg" },
              { value: '行书', icon: "/common/public_icon.svg" },
              { value: '行楷', icon: "/common/public_icon.svg" },
              { value: '草书', icon: "/common/public_icon.svg" }])
              .selected(2)
              .value('字体')
              .font({ size: 16, weight: 500 })
              .fontColor('#182431')
              .selectedOptionFont({ size: 16, weight: 400 })
              .optionFont({ size: 16, weight: 400 })
              .onSelect((index: number) => {
                console.info('Select:' + index)
              })
          }
          .content_formant()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Column(){

        }
        .height(10)

      }
      .height('14%')
      .shadow({
        radius: 6,
        color: "#000000",
        offsetX: 0,
        offsetY: 2,
      })



      Scroll(){
        //3系统样本字
        Sample_Word({ selectNumber: $selectNumber })
      }
      .width('100%')
      .height('68%')



      Column(){
        // Divider()
        //   .strokeWidth(2)

        //4确认
        Row(){
          Text('确认'+this.selectNumber)
            .fontSize(20)

        }
        .border({ width: 1, color: $r('app.color.text_gray'), radius: 10, style: BorderStyle.Solid })
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .height(50)
        .width(150)
        .margin({top: 10})
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/exercise/exercise_self/self_generated/SpecialExerciseSelectedPage'
            }
          )
        })

        // Divider()
      }
      .height('10%')
      .justifyContent(FlexAlign.Start)

    }
    .height('100%')
    .width('100%')
  }
}