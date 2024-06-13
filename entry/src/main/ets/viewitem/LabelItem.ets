import LabelInfo from '../viewmodel/LabelInfo'

@Component
export default struct LabelItem {
  Label : LabelInfo

  build() {
    Column(){
      Text(this.Label.label)
        .fontSize(12)
    }
    .borderRadius(15)
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor($r('app.color.gray'))


  }
}