import { HeaderTitle } from '../../../common/components/CommonComponents'
import Comprehensive_Exercises from '../../../views/exercise/self_exercise/self_generated/Comprehensive_Exercises'
import ExpertCopywriting from '../../../views/exercise/self_exercise/self_generated/ExpertCopywriting'
import Special_Exercises from '../../../views/exercise/self_exercise/self_generated/Special_Exercises'
import ExerciseService from '../../../service/ExerciseService'
import router from '@ohos.router'


@Entry
@Component
struct NewSelfPage {
  @State title: string = '自我练习'
  @State currentIndex: number = 0
  @State currentIndex2: number = 0

  @State sampleWord: any[] = []
  @State radical: string = ''

  //自定义组件实现tabs组件拥有图片
  @Builder TabBarBuilder(title: ResourceStr, index: number){
    Column({space: 8}){
      Text(title)
        .fontSize(14)
        .fontColor(this.selectColor2(index))
    }
    .border({ width: 1 ,color: $r('app.color.blue')})
    .width('95%')
    .height(29)
    .backgroundColor(this.selectColor1(index))
    .justifyContent(FlexAlign.Center)
  }

  selectColor1(index: number){
    return this.currentIndex === index ? $r('app.color.blue') : $r('app.color.start_window_background')
  }

  selectColor2(index: number){
    return this.currentIndex2 === index ? $r('app.color.start_window_background') : $r('app.color.blue')
  }

  onPageShow() {

    this.radical = router.getParams()?.['src']

    if (this.radical == null) {
      this.radical = ''
    }

    console.log(`${this.radical}`)
  }

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })
      Divider()
        .strokeWidth(2)

      //2导航栏：专项练习，综合练习，专家字帖
      Tabs({barPosition: BarPosition.Start}){
        //1.专项练习
        TabContent(){
          // Text('专项练习')
          Special_Exercises({ radical: this.radical })

        }
        .tabBar(this.TabBarBuilder($r('app.string.self_specialExercises'), 0))

        //2.综合练习
        TabContent(){
          // Text('综合练习')
          Comprehensive_Exercises()
        }
        .tabBar(this.TabBarBuilder($r('app.string.self_comprehensiveExercises'), 1))

        //3.专家字帖
        TabContent(){
          // Text('专家字帖')
          ExpertCopywriting()
        }
        .tabBar(this.TabBarBuilder($r('app.string.self_expertCopywriting'), 2))

      }
      .width('100%')
      .height('100%')
      .onChange(index => {
        this.currentIndex = index
        this.currentIndex2 = index
      })
    }
  }

  //获取样本字
  getSampleWord(){
    ExerciseService.getSampleWord()
      .then((sampleWord: any[]) => {

        this.sampleWord = sampleWord
      })
      .catch(() => {

      })
  }

}