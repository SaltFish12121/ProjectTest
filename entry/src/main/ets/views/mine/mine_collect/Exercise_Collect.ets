import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import ExerciseItem from '../../../viewitem/ExerciseItem'
import ExerciseInfo from '../../../viewmodel/ExerciseInfo'
import Excellent_Collect from './exercise_collect/Excellent_Collect'
import School_Collect from './exercise_collect/School_Collect'
import Self_Collect from './exercise_collect/Self_Collect'
import ExcellentWorkInfo from '../../../viewmodel/ExcellentWorkInfo'

@Extend(ListItem) function exercise_List(){
  .width('95%')
  .borderRadius(CommonConstants.DEFAULT_10)
  .shadow({
    radius: 6,
    color: "#000000",
    offsetX: 0,
    offsetY: 2,
  })
}

@Component
export default struct Exercise_Collect {
  @State currentIndex: number = 0
  @State currentIndex2: number = 0

  @Link exerciseCollect: ExerciseInfo[]
  @Link excellentCollect: ExcellentWorkInfo[]

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


  build() {
    Column(){


      //2导航栏
      Tabs({barPosition: BarPosition.Start}){
        //1.学校练习
        TabContent(){
          // Text('练习')
          School_Collect({ exercise: $exerciseCollect })
        }
        .tabBar(this.TabBarBuilder('学校练习', 0))

        //2.自我练习
        TabContent(){
          // Text('文章')
          Self_Collect({ exercise: $exerciseCollect })
        }
        .tabBar(this.TabBarBuilder('自我练习', 1))

        //3.优秀作品
        TabContent(){
          // Text('视频')
          Excellent_Collect({ excellentWork: $excellentCollect })
        }
        .tabBar(this.TabBarBuilder('优秀作品', 2))

      }
      .width('100%')
      .height('100%')
      .onChange(index => {
        this.currentIndex = index
        this.currentIndex2 = index
      })
    }
    .width('100%')
    .height('100%')

  }






}

