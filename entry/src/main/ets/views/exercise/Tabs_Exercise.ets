import { CommonConstants } from '../../common/constants/CommonConstants'
import Excellent_Works from './excellent_work/Excellent_Works'
import School_Exercise from './school_exercise/School_Exercise'
import Self_Exercise from './self_exercise/Self_Exercise'
import ExerciseService from  '../../service/ExerciseService'
import ExerciseInfo from '../../viewmodel/ExerciseInfo'
import { ExerciseType } from '../../viewmodel/ExerciseInfo'
import ExcellentWorkInfo from '../../viewmodel/ExcellentWorkInfo'
import { WorkType } from '../../viewmodel/ExcellentWorkInfo'

@Component
export default struct Tabs_Exercise {
  @State currentIndex: number = 0

  //接收的数据
  @Link schoolExercise: ExerciseInfo[]/* = [
    new ExerciseInfo(ExerciseType.schoolExercise, false, '笔画练习（一）', '2024-3-3', 0, true),
    new ExerciseInfo(ExerciseType.schoolExercise, true, '将进酒', '2024-3-2', 0, true),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3', 0, false),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'横折练习', '2024-3-2', 0, false)
  ]*/
  @Link selfExercise: ExerciseInfo[]/* = [
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, true),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, true),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, false),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, false)
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
        Text('书法练习')
          .fontSize(CommonConstants.DEFAULT_24)
      }
      .justifyContent(FlexAlign.Center)
      .height(60)

      //2.导航栏：学校作业，自我练习，优秀作业
      Tabs({barPosition: BarPosition.Start}){
        //1.学校作业
        TabContent(){
          // Text('学校作业')
          School_Exercise({ schoolExercise: $schoolExercise })
        }
        .tabBar(this.TabBarBuilder($r('app.string.exercise_homework'), 0))

        //2.自我练习
        TabContent(){
          // Text('自我练习')
          Self_Exercise({ selfExercise: $selfExercise})
        }
        .tabBar(this.TabBarBuilder($r('app.string.exercise_selfExercise'), 1))

        //3.优秀作业
        TabContent(){
          // Text('优秀作业')
          Excellent_Works({ excellentWork: $excellentExercise })
        }
        .tabBar(this.TabBarBuilder($r('app.string.exercise_excellentWorks'), 2))

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

  //获取学校作业
  getSchoolExercise(){
    let userId = 1

    ExerciseService.getSchoolExercise(userId)
      .then((exercise: ExerciseInfo[]) => {
        console.log('Tags', '获取学校作业成功')

        this.schoolExercise = exercise
      })
      .catch((error) => {
        console.log('Tags', '获取学校作业失败')
      })
  }

  //获取自我练习
  getSelfExercise(){
    let userId

    ExerciseService.getMineExercise(userId)
      .then((exercise: ExerciseInfo[]) => {
        console.log('Tags', '获取自我练习成功')

        this.selfExercise = exercise
      })
      .catch((error) => {
        console.log('Tags', '获取自我练习失败')
      })
  }

  //获取优秀作品
  getExcellentExercise(){
    let userId

    ExerciseService.getExcellentExercise(userId)
      .then((exercise: ExcellentWorkInfo[]) => {
        console.log('Tags', '获取优秀作品成功')

        this.excellentExercise = exercise
      })
      .catch((error) => {
        console.log('Tags', '获取优秀作品失败')
      })
  }



}