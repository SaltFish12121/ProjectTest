import VideoInfo from '../../../viewmodel/VideoInfo'
import LabelInfo from '../../../viewmodel/LabelInfo'
import LabelItem from '../../../viewitem/LabelItem'

@Component
export default struct Video_Brief_Introduction {
  video: VideoInfo
  label: LabelInfo[]

  build() {
    Scroll(){

      Column(){
        //简介
        Column(){
          Text('简介内容')
            .width('90%')
        }
        .width('100%')

        //标签内容
        Column() {

          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {

            ForEach(
              this.label ,
              (label) => {

                Column(){
                  LabelItem({ Label: label})
                }
                .margin({right: 10, bottom: 10})



              }
            )

          }
          .width('95%')

        }
        .margin({top: 10})


        Column(){

        }
        .height(100)

      }


    }
    .height('100%')
    .width('100%')
    .align(Alignment.TopStart)

  }
}