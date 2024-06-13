import { CommonConstants } from '../../common/constants/CommonConstants'
import Excellent_Works from '../exercise/excellent_work/Excellent_Works'
import Competition_Finished from './Competition_Finished'
import Compition_Unfinished from './Competition_Unfinished'
import CompetitionInfo from '../../viewmodel/CompetitonInfo'
import { CompetitionType } from '../../viewmodel/CompetitonInfo'
import CompetitionService from '../../service/CompetitionService'
import ExcellentWorkInfo from '../../viewmodel/ExcellentWorkInfo'
import { WorkType } from '../../viewmodel/ExcellentWorkInfo'
import ExerciseService from  '../../service/ExerciseService'

@Component
export default struct Tabs_Comptition {
  @State currentIndex: number = 0

  //接收的数据
  @Link competition: CompetitionInfo[]/* = [
    new CompetitionInfo(CompetitionType.underWay, '第三次书法竞赛', '2024-6-20', '30'),
    new CompetitionInfo(CompetitionType.unStart, '第四次竞赛', '2024-6-22', '30'),
    new CompetitionInfo(CompetitionType.unStart, '全国大赛', '2024-6-24', '30'),
    new CompetitionInfo(CompetitionType.completed, '第二次书法竞赛', '2024-3-3', '30', 91),
    new CompetitionInfo(CompetitionType.completed, '第一次书法竞赛', '2024-3-2', '30', 90)
  ]*/
  @Link excellentExercise: ExcellentWorkInfo[]/* = [
    new ExcellentWorkInfo(WorkType.schoolWork, '','横折练习', '2024-3-3'),
    new ExcellentWorkInfo(WorkType.competitionWork, '','第一次书法竞赛', '2024-3-2')
  ]*/

  //自定义组件实现tabs组件拥有图片
  @Builder TabBarBuilder(title: ResourceStr, index: number){
    Column({space: 8}){
      Text(title)
        .fontSize(14)
        .fontColor($r('app.color.black'))
    }
    .width('100%')
    .height(40)
    .backgroundColor(this.selectColor(index))
    .justifyContent(FlexAlign.Center)
  }

  selectColor(index: number){
    return this.currentIndex === index ? $r('app.color.button1') : $r('app.color.gray')
  }

  build() {
    Column(){
      //1. 顶部标题
      Column(){
        Text('书法竞赛')
          .fontSize(CommonConstants.DEFAULT_24)
      }
      .justifyContent(FlexAlign.Center)
      .height(60)

      //2.导航栏：未开始/进行中，历史竞赛，优秀作业
      Tabs({barPosition: BarPosition.Start}){
        //1.未开始/进行中
        TabContent(){
          // Text('未开始/进行中')
          Compition_Unfinished({ competition: $competition })
        }
        .tabBar(this.TabBarBuilder($r('app.string.competition_unfinished'), 0))

        //2.历史竞赛
        TabContent(){
          // Text('历史竞赛')
          Competition_Finished({ competition: $competition })
        }
        .tabBar(this.TabBarBuilder($r('app.string.competition_finished'), 1))

        //3.优秀作业
        TabContent(){
          // Text('优秀作业')
          Excellent_Works({ excellentWork: $excellentExercise })
        }
        .tabBar(this.TabBarBuilder($r('app.string.competition_excellentWorks'), 2))

      }
      .width('100%')
      .height('100%')
      .onChange(index => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }

  //获取竞赛
  getCompetition(){
    let userId = 1

    CompetitionService.getCompetition(userId)
      .then((competition: CompetitionInfo[]) => {
        this.competition = competition
      })
      .catch((error) => {

      })
  }

  //获取优秀作品
  getExcellentExercise(){
    let userId

    ExerciseService.getExcellentExercise(userId)
      .then((exercise: ExcellentWorkInfo[]) => {

        this.excellentExercise = exercise
      })
      .catch((error) => {

      })
  }

}