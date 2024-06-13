import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'

@Extend(Row) function set_List(){
  .height(64)
  .width('90%')
  .backgroundColor($r('app.color.start_window_background'))
  .justifyContent(FlexAlign.SpaceBetween)
}

@Extend(Column) function set_column(){
  .border(
    {
      width: 2,

      color: $r('app.color.mid_gray')
    }
  )
  .width('100%')
  .height(76)
  .backgroundColor($r('app.color.start_window_background'))
  .alignItems(HorizontalAlign.Center)
  .justifyContent(FlexAlign.Center)
}

@Entry
@Component
struct MineSetPage {
  private arr: string[] = ['账号管理', '消息设置', '通用设置', '隐私协议', '用户协议', '个人信息收集清单', '第三方信息共享清单']

  @State phoneNumber: string = ''
  @State email: string = ''

  onPageShow(){
    const user = router.getParams()

    this.phoneNumber = user['phoneNumber']
    this.email = user['email']
  }

  @State title: string = '我的设置'

  build() {
    Column(){
      //1标题
      HeaderTitle({ title: this.title })
      .backgroundColor($r('app.color.start_window_background'))

      //2内容

      List(){

        ForEach(this.arr, (item) => {

          ListItem() {
            Row(){
              Text(`${item}`)
                .fontSize(20)


              Image($r('app.media.enter'))
                .height(24)
            }
            .set_List()

          }
          .backgroundColor($r('app.color.start_window_background'))
          .width('100%')
          .onClick(() => {
            switch (item) {
              case '账号管理':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/account_management/AccountManagementPage',
                    params: {
                      phoneNumber: this.phoneNumber,
                      email: this.email
                    }
                  }
                )
                break;

              case '消息设置':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/message_set/MessageSetPage'
                  }
                )
                break;

              case '通用设置':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/message_set/NotificationSetPage'
                  }
                )
                break;

              case '隐私协议':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/agreement/PrivacyAgreementPage'
                  }
                )
                break;

              case '用户协议':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/agreement/UserAgreementPage'
                  }
                )
                break;

              case '个人信息收集清单':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/agreement/PersonalInformationCollectionListPage'
                  }
                )
                break;

              case '第三方信息共享清单':
                router.pushUrl(
                  {
                    url: 'pages/mine/mine_set/agreement/ThirdPartyInformationSharingListPage'
                  }
                )
                break;



              default:
                break;
            }
          })


        }, item => item)

      }


      Row(){
        Row(){
          Text('关于')
            .fontSize(20)


          Row(){
            Text('版本')
              .fontSize(16)

            Image($r('app.media.enter'))
              .height(24)
          }
        }
        .set_List()
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/mine/mine_set/about/AboutPage'
            }
          )
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.start_window_background'))





      Column({space: 10}){
        //切换账号
        Column(){
          Text('切换账号')
        }
        .set_column()
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/mine/mine_set/SwitchAccountPage'
            }
          )
        })


        //退出登录
        Column(){
          Text('退出登录')
            .fontColor($r('app.color.text_red'))
        }
        .set_column()

      }
      .margin({top: 20})


    }
    .backgroundColor($r('app.color.mid_gray'))
    .width('100%')
    .height('100%')
  }
}