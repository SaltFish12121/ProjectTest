import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import ExerciseItem from '../../../viewitem/ExerciseItem'
import ExerciseInfo from '../../../viewmodel/ExerciseInfo'
import PreferencesUtil from '../../../common/util/PreferencesUtil'

@Extend(Column) function exercise_List(){
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
export default struct Finish_School {
  @Link exercise: ExerciseInfo[]/* = [
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3'),
    new ExerciseInfo(ExerciseType.schoolExercise,true ,'将进酒', '2024-3-2')
  ]*/

  build() {
    Scroll(){
      Column(){
        //作业列表
        Column({space: 10}){
          Column(){

          }
          .height(5)

          ForEach(
            this.exercise ,
            (exercise: ExerciseInfo) => {

              if (exercise.finish == true){
                Column() {
                  ExerciseItem({ exercise: exercise })
                }
                .exercise_List()
                .onClick(() => {
                  router.pushUrl(
                    {
                      url: 'pages/exercise/exercise_school/SchoolFinishPage',
                      params: {
                        ifSuccess: 1,
                        title: exercise.title
                      }
                    }
                  )

                })
              }


            }
          )

          //3 Preferences测试
          /*
          Column(){
            Text('字体'+this.fontSize)
              .fontSize(20)

            Slider({
              min: 14,
              max: 20,
              step: 2,
              value: this.fontSize
            })
              .onChange(val => {
                this.fontSize = val
                //导入Preferences
                PreferencesUtil.putPreferenceValue('MyPreferences', 'MineFontSize', val)
              })
          }
          */


          Column(){

          }
          .height(100)
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        // .height('100%')

      }
    }
    .align(Alignment.Top)
    .height('100%')

  }
}

