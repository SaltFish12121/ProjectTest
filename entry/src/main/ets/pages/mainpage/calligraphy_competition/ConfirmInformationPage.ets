import router from '@ohos.router'
import { HeaderTitle } from '../../../common/components/CommonComponents'
@Entry
@Component
struct ConfirmInformationPage {
  arr: number[] = [0,1,2,3,4,5,6]
  arr1: string[] = ['报名项目', '姓名', '性别','证件号', '学校', '班级', '教师']
  arr2: string[] = ['项目名称', '王小明', '男', '202293290123', '盘龙小学', '二年级（1）班', '李梅']

  @State title: string = '信息确认'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title})

      //2信息
      Column(){
        ForEach(
          this.arr,
          (arr) => {
            Row(){
              Text(this.arr1[arr])
                .fontSize(20)
                .textAlign(TextAlign.Start)
                .width('30%')

              Text(this.arr2[arr])
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .width('70%')
            }
            .height(50)
            .width('100%')
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Start)
          }
        )

      }
      .width('80%')
      .margin({top: 50, bottom: 50})

      //3是否报名
      Row(){
        Column(){
          Text('取消报名')
            .fontSize(16)
            .fontColor($r('app.color.black'))
        }
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .border({ width: 1, color: $r('app.color.button2'), radius: 20, style: BorderStyle.Solid })
        .backgroundColor($r('app.color.button2'))
        .width('45%')
        .height(65)
        .onClick(() => {
          router.back()
        })

        Column(){
          Text('确认报名')
            .fontSize(16)
            .fontColor($r('app.color.start_window_background'))
        }
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        .border({ width: 1, color: $r('app.color.button1'), radius: 20, style: BorderStyle.Solid })
        .backgroundColor($r('app.color.button1'))
        .width('45%')
        .height(65)
        .onClick(() => {
          AlertDialog.show({
            message: '信息提交成功',
            confirm: {
              value: '确定',
              action: ()=>{

                router.back()
                router.back()
              }
            }
          })


        })

      }
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('90%')

    }


  }
}