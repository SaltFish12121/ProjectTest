import router from '@ohos.router'
import { Header } from '../../../../common/components/CommonComponents'
@Entry
@Component
struct GenderPage {
  @State select: boolean = true
  @State gender: string = '男'

  onPageShow(){
    const gender = router.getParams()

    this.gender = gender['gender']

    if (this.gender == '女') {
      this.select = false
    } else {
      this.select = true
    }
  }

  build() {
    Column(){
      //1头部
      Column(){
        Stack({alignContent: Alignment.TopEnd}){
          Header()
            .width('95%')

          Row(){
            Text('确定')
              .fontSize(20)
              .fontColor($r('app.color.blue'))
          }
          .height(59)
          .onClick(() => {
            //保存信息

            //返回页面
            router.back({
              url: 'pages/mine/personal_information/EditPersonalInformationPage',
              params: {
                gender: this.gender
              }
            })
          })

        }

      }
      .backgroundColor($r('app.color.start_window_background'))
      .width('100%')


      Divider()


      //2内容
      Column(){
        Row(){
          Text('男')
            .fontSize(20)

          Blank()

          if (this.select==true)
          {
            Column(){
              Image($r('app.media.single_check'))
                .width(26)
            }
          }


        }
        .height(64)
        .width('90%')
        .onClick(() => {
          this.select = true
          this.gender = '男'
        })

        Divider()

        Row(){
          Text('女')
            .fontSize(20)

          Blank()

          if (this.select==false)
          {
            Column(){
              Image($r('app.media.single_check'))
                .width(26)
            }
          }

        }
        .height(64)
        .width('90%')
        .onClick(() => {
          this.select = false
          this.gender = '女'
        })

      }
      .width('100%')
      .backgroundColor($r('app.color.start_window_background'))

      Divider()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.mid_gray'))

  }
}