import router from '@ohos.router';
import { HeaderSearch, HeaderTitle } from '../../../common/components/CommonComponents'

//样式
@Styles function card(){
  .width('100%')
  .height(70)
  .backgroundColor($r('app.color.start_window_background'))
}

@Entry
@Component
struct RadicalSearchPage {
  scroller: Scroller = new Scroller();

  private arr: number[] = [0,1,2,3,4,5]

  private arr1: string[] = ['三点水', '单人旁', '口字旁', '木字旁', '女字旁', '火字旁']

  private radicals: string[] = ['氵', '亻', '口', '木', '女', '火']

  build() {
    Column(){

      //1头部
      Column(){
        HeaderTitle()

        Search()
          .width('90%')

        Divider()
      }
      .backgroundColor($r('app.color.start_window_background'))

      //2笔画列表
      Scroll(this.scroller){
        Column(){
          ForEach(
            this.arr,
            (c, index) => {
              Column(){
                Blank()

                Row(){
                  Text(`${this.arr1[c]}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Start)

                  // Image($r('app.media.0001'))
                  //   .width(24)

                  Text(`${this.radicals[c]}`)
                    .fontSize(24)
                }
                .alignItems(VerticalAlign.Center)
                .justifyContent(FlexAlign.SpaceBetween)
                .width('90%')
                .onClick(() => {
                  router.back(

                    {
                      url: 'pages/exercise/exercise_self/NewSelfPage',
                      params: {
                        src: `${this.arr1[c]}`
                      }
                    }

                  )
                })

                Blank()

                //划线
                Divider()
                  .height(1)
              }
              .card()

            }
          )

          Column(){

          }
          .height(200)

        }
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向






    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.mid_gray'))

  }
}