
import router from '@ohos.router'
import { CommonConstants } from '../constants/CommonConstants'

/*@Styles function content_formant(){
  .padding({top: 30, bottom: 35})
  .borderRadius(CommonConstants.DEFAULT_10)
  .width(CommonConstants.THOUSANDTH_940)
  .backgroundColor(Color.White)
  .height(86)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}
*/



@Extend(ListItem) function exercise_List(){
  .margin({left: 10, bottom: 5})
  .borderRadius(CommonConstants.DEFAULT_10)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}


@Extend(Column) function content_formant(){
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
export struct HeaderSearch {
  build() {
    Row(){
      Column(){
        Image($r('app.media.return'))
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })

      Column(){
        Search()
      }
      .width(300)
    }
    .width('100%')
    .height(59)
  }
}

@Component
export struct HeaderCollect {
  @State isCollect: boolean = false

  build() {
    Row(){
      Column(){
        Image($r('app.media.return'))
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })

      Column(){
        if (this.isCollect) {
          Image($r('app.media.collect1'))
            .width(30)
        } else {
          Image($r('app.media.collect0'))
            .width(30)
        }

      }
      .onClick(() => {
        this.isCollect=!this.isCollect
      })

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}

@Component
export struct Header {
  isOutControl: boolean = false

  build() {
    Row(){

      if (this.isOutControl) {
        Column(){
          Image($r('app.media.return'))
        }
        .height(34)
        .width(34)
      } else {
        Column(){
          Image($r('app.media.return'))
        }
        .height(34)
        .width(34)
        .onClick(() => {

          router.back()
        })

      }



    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}

@Component
export struct HeaderTitleTypeCollect {
  @State isCollect: boolean = false

  @Prop title: string
  @Prop type: string

  build() {
    Row(){
      Column(){
        Image($r('app.media.return'))
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })

      Row(){
        Column(){
          Text(this.title)
            .fontSize(20)
        }

        Column(){
          Text(this.type)
            .fontSize(14)
            .fontColor($r('app.color.light_black'))
        }
      }

      Column(){
        if (this.isCollect) {
          Image($r('app.media.collect1'))
            .width(30)
        } else {
          Image($r('app.media.collect0'))
            .width(30)
        }

      }
      .onClick(() => {
        this.isCollect=!this.isCollect
      })

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}

@Component
export struct HeaderTitle {
  @Prop title: string

  isOutControl: boolean = false

  build() {
    Row(){
      if (this.isOutControl) {
        Column(){
          Image($r('app.media.return'))
        }
        .height(34)
        .width(34)
      } else {
        Column(){
          Image($r('app.media.return'))
        }
        .height(34)
        .width(34)
        .onClick(() => {

          router.back()
        })

      }

      Column(){
        Text(this.title)
          .fontSize(20)
      }

      Column(){

      }
      .width(34)

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}


@Component
export struct HeaderTitleService {
  title: string = '标题'

  build() {
    Row(){
      Column(){
        Image($r('app.media.return'))
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })

      Column(){
        Text(this.title)
          .fontSize(20)
      }

      Column(){
        Image($r('app.media.customer_service_2'))
          .width(34)

        Text('客服')
          .margin({top: -10})
          .fontColor($r('app.color.blue'))
      }
      .justifyContent(FlexAlign.Center)
      .width(60)
      .onClick(() => {
        router.pushUrl(
          {
            url: 'pages/mine/service_center/ServiceCenterTalkPage'
          }
        )
      })

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}


@Component
export struct HeaderTitleCollect {
  @State isCollect: boolean = false

  @Prop title: string

  build() {
    Row(){
      Column(){
        Image($r('app.media.return'))
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })

      Column(){
        Text(this.title)
          .fontSize(20)
      }

      Column(){
        if (this.isCollect) {
          Image($r('app.media.collect1'))
            .width(30)
        } else {
          Image($r('app.media.collect0'))
            .width(30)
        }

      }
      .onClick(() => {
        this.isCollect=!this.isCollect
      })

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}


@Component
export struct Header_close {
  build() {
    Row(){
      Column(){
        Image($r('app.media.close'))
          .height(20)
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.replaceUrl(
          {
            url: 'pages/login/LoginPage'
          }
        )
      })


    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}


@Component
export struct Header_close_2 {
  build() {
    Row(){
      Column(){
        Image($r('app.media.close'))
          .fillColor($r('app.color.start_window_background'))
          .height(20)
      }
      .height(34)
      .width(34)
      .onClick(() => {
        router.back()
      })


    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(59)
  }
}

/*
      //1头部
      Stack({alignContent: Alignment.TopEnd}){
        Header_close()
          .width('95%')

        Row(){
          Text(`${this.login_type[this.index]}`)
        }
        .height(59)
        .onClick(() => {
          this.index+=1
          this.index%=2
        })

      }
 */