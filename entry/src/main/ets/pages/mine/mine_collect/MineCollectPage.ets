import { HeaderTitle } from '../../../common/components/CommonComponents'
import Exercise_Collect from '../../../views/mine/mine_collect/Exercise_Collect'
import Knowledge_Collect from '../../../views/mine/mine_collect/Knowledge_Collect'
import Video_Collect from '../../../views/mine/mine_collect/Video_Collect'
import UserService from '../../../service/UserService'
import ExerciseInfo from '../../../viewmodel/ExerciseInfo'
import { ExerciseType } from '../../../viewmodel/ExerciseInfo'
import ExcellentWorkInfo from '../../../viewmodel/ExcellentWorkInfo'
import { WorkType } from '../../../viewmodel/ExcellentWorkInfo'
import KnowledgeInfo from '../../../viewmodel/KnowledgeInfo'
import { KnowledgeType } from '../../../viewmodel/KnowledgeInfo'
import VideoInfo from '../../../viewmodel/VideoInfo'
import LabelInfo from '../../../viewmodel/LabelInfo'

@Entry
@Component
struct MineCollectPage {
  @State currentIndex: number = 0

  @State exerciseCollect: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3'),
    new ExerciseInfo(ExerciseType.schoolExercise,true ,'将进酒', '2024-3-2'),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, true),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, true)
  ]
  @State excellentCollect: ExcellentWorkInfo[] = [
    new ExcellentWorkInfo(WorkType.schoolWork, '','横折练习', '2024-3-3'),
    new ExcellentWorkInfo(WorkType.competitionWork, '','第一次书法竞赛', '2024-3-2')
  ]
  @State knowledgeCollect: KnowledgeInfo[] = [
    new KnowledgeInfo(KnowledgeType.Hanzi, true , '汉字的演变过程', 666, '2024-4-10', $r('app.media.show_knoledge')),
    new KnowledgeInfo(KnowledgeType.famousWorks, false , '《洛神赋十三行》王献之', 666, '2024-4-10', $r('app.media.show_knoledge'))
  ]
  @State videoCollect: VideoInfo[] = [
    new VideoInfo('楷书的教学视频1', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书叔'),
      new LabelInfo('教育'),
      new LabelInfo('学习'),
      new LabelInfo('横折练习'),
      new LabelInfo('弯钩'),
      new LabelInfo('撇捺'),
      new LabelInfo('笔画'),
    ]),
    new VideoInfo('楷书的教学视频2', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频3', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频4', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频5', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频6', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频7', '2024-4-10', $r('app.media.show_knoledge'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ])
  ]

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

  @State title: string = '我的收藏'

  build() {
    Column(){
      //1头部
      HeaderTitle({ title: this.title })


      //2导航栏
      Tabs({barPosition: BarPosition.Start}){
        //1.练习
        TabContent(){
          // Text('练习')
          Exercise_Collect({ exerciseCollect: $exerciseCollect, excellentCollect : $excellentCollect })
        }
        .tabBar(this.TabBarBuilder('练习', 0))

        //2.文章
        TabContent(){
          // Text('文章')
          Knowledge_Collect({ knowledgeCollect: $knowledgeCollect })
        }
        .tabBar(this.TabBarBuilder('知识', 1))

        //3.视频
        TabContent(){
          // Text('视频')
          Video_Collect({ videoCollect: $videoCollect })
        }
        .tabBar(this.TabBarBuilder('教学', 2))

      }
      .width('100%')
      .height('100%')
      .onChange(index => {
        this.currentIndex = index
      })

    }


  }


  getExerciseCollect(){
    let userId = 1

    UserService.getExerciseCollect(userId)
      .then((collect: ExerciseInfo[]) => {
        console.log('Tags', '获取练习收藏成功')

        this.exerciseCollect = collect
      })
      .catch((error) => {
        console.log('Tags', '获取练习收藏失败')
      })

    UserService.getExerciseExcellentCollect(userId)
      .then((collect: ExcellentWorkInfo[]) => {
        console.log('Tags', '获取优秀作品收藏成功')

        this.excellentCollect = collect
      })
      .catch((error) => {
        console.log('Tags', '获取优秀作品收藏失败')
      })

  }


  getKnowledgeCollect(){
    let userId

    UserService.getKnowledgeCollect(userId)
      .then((collect: KnowledgeInfo[]) => {
        console.log('Tags', '获取知识收藏成功')

        this.knowledgeCollect = collect
      })
      .catch((error) => {
        console.log('Tags', '获取知识收藏失败')
      })
  }

  getVideoCollect(){
    let Userid = 1

    UserService.getVideoCollect(Userid)
      .catch((collect) => {
        console.log('Tags', '获取个人视频收藏成功')

        this.videoCollect = collect
      })
      .then((error) => {
        console.log('Tags', '获取个人视频收藏失败')
      })
  }
}