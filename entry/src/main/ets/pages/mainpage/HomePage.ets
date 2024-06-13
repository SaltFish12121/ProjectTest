import Tabs_Comptition from '../../views/competition/Tabs_Compition'
import Tabs_Exercise from '../../views/exercise/Tabs_Exercise'
import Tabs_HomePage from '../../views/homepage/Tabs_HomePage'
import Tabs_Message from '../../views/message/Tabs_Message'
import Tabs_Mine from '../../views/mine/Tabs_Mine'
import UserInfo from '../../viewmodel/user/UserInfo'
import RegionInfo from '../../viewmodel/user/RegionInfo'
import KlassInfo from '../../viewmodel/user/KlassInfo'
import LoginService from '../../service/LoginService'
import PreferencesUtil from '../../common/util/PreferencesUtil'
import InformationService from  '../../service/InformationService'
import KnowledgeInfo from '../../viewmodel/KnowledgeInfo'
import { KnowledgeType } from '../../viewmodel/KnowledgeInfo'
import VideoInfo from '../../viewmodel/VideoInfo'
import LabelInfo from '../../viewmodel/LabelInfo'
import CompetitionInformInfo from '../../viewmodel/CompetitionInformInfo'
import UserService from '../../service/UserService'
import router from '@ohos.router'

import ExerciseService from  '../../service/ExerciseService'
import ExerciseInfo from '../../viewmodel/ExerciseInfo'
import { ExerciseType } from '../../viewmodel/ExerciseInfo'
import ExcellentWorkInfo from '../../viewmodel/ExcellentWorkInfo'
import { WorkType } from '../../viewmodel/ExcellentWorkInfo'

import CompetitionInfo from '../../viewmodel/CompetitonInfo'
import { CompetitionType } from '../../viewmodel/CompetitonInfo'

@Entry
@Component
struct HomePage {
  @State currentIndex: number = 0
  @State user: UserInfo = new UserInfo( 3, '用户1', '', '', new RegionInfo(), '', '', new KlassInfo(0, '1', '盘城小学', '一年级'), '18912345678', '123456789@qq.com', '', false)

  //传入的数据
  //Tabs_HomePage
  @State knowledgeShow: KnowledgeInfo[] = [
    new KnowledgeInfo(KnowledgeType.famousWorks, true, '面对与超越', 666, '2024-6-4', $r('app.media.homepage_knowledge')),
    new KnowledgeInfo(KnowledgeType.famousWorks, true, '博览旧书法', 666, '2024-6-4', $r('app.media.homepage_knowledge2')),
    new KnowledgeInfo(KnowledgeType.famousWorks, true, '上海中国书法院院展', 666, '2024-6-4', $r('app.media.homepage_knowledge3'))
  ]
  @State videoShow: VideoInfo[] = [
    new VideoInfo('楷书的教学视频1', '2024-4-10', $r('app.media.homepage_video'), [
      new LabelInfo('楷书叔'),
      new LabelInfo('教育'),
      new LabelInfo('学习'),
      new LabelInfo('横折练习'),
      new LabelInfo('弯钩'),
      new LabelInfo('撇捺'),
      new LabelInfo('笔画'),
    ]),
    new VideoInfo('楷书的教学视频2', '2024-4-10', $r('app.media.homepage_video2'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频3', '2024-4-10', $r('app.media.homepage_video3'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频4', '2024-4-10', $r('app.media.homepage_video4'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ]),
    new VideoInfo('楷书的教学视频5', '2024-4-10', $r('app.media.homepage_video'), [
      new LabelInfo('楷书'),
      new LabelInfo('基础')
    ])
  ]
  @State competitionInformShow: CompetitionInformInfo[] = [
    new CompetitionInformInfo(true, '“第一次书法竞赛”', '2024-4-5'),
    new CompetitionInformInfo(true, '“第二次书法竞赛”', '2024-4-5'),
    new CompetitionInformInfo(true, '“全国大赛”', '2024-4-5'),
    new CompetitionInformInfo(true, '“全国大赛（2）”', '2024-4-5'),
  ]
  //Tabs_Exercise
  @State schoolExercise: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.schoolExercise, false, '笔画练习（一）', '2024-3-3', 0, true),
    new ExerciseInfo(ExerciseType.schoolExercise, true, '将进酒', '2024-3-2', 0, true),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'笔画练习（一）', '2024-3-3', 0, false),
    new ExerciseInfo(ExerciseType.schoolExercise,false ,'横折练习', '2024-3-2', 0, false)
  ]
  @State selfExercise: ExerciseInfo[] = [
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, true),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, true),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(2)', '2024-3-3', 90, false),
    new ExerciseInfo(ExerciseType.selfExercise,false ,'基础笔画练习(1)', '2024-3-2', 91, false)
  ]
  @State excellentExercise: ExcellentWorkInfo[] = [
    new ExcellentWorkInfo(WorkType.schoolWork, '','横折练习', '2024-3-3'),
    new ExcellentWorkInfo(WorkType.competitionWork, '','第一次书法竞赛', '2024-3-2')
  ]
  //Tabs_Competition
  @State competition: CompetitionInfo[] = [
    new CompetitionInfo(CompetitionType.underWay, '第三次书法竞赛', '2024-6-20 13:30', '30'),
    new CompetitionInfo(CompetitionType.unStart, '第四次竞赛', '2024-6-22 13:30', '30'),
    new CompetitionInfo(CompetitionType.unStart, '全国大赛', '2024-6-24 13:30', '30'),
    new CompetitionInfo(CompetitionType.completed, '第二次书法竞赛', '2024-3-3', '30', 91),
    new CompetitionInfo(CompetitionType.completed, '第一次书法竞赛', '2024-3-2', '30', 90)
  ]
  //Tabs_Mine
  @State userPersonal: UserInfo = new UserInfo()
  @State userType: boolean = false

  aboutToAppear() {
    // this.loadUserInfo()

    // this.fontSize = await PreferencesUtil.getPreferenceValue('MyPreferences', 'MineFontSize', 16) as number
  }

  onPageShow(){
    const user = router.getParams()//从Tabs_Mine得到的user更新值

    if (user['ifSuccess'] == 1) {
      console.log('HomePage', 'success', this.userPersonal.gender)
      this.userPersonal = user['user']
    }

    if (user['ifLogin'] == 1) {
      this.userType = user['login']

      if (this.userType) {
          this.userPersonal = new UserInfo( 1, '用户1', '202283290123', '123456', new RegionInfo(1, '南京'), '男', '', new KlassInfo(0, '（1）', '盘城小学', '一年级', '李梅'), '18912345678', '123456789@qq.com', '', true)
      } else {
          this.userPersonal = new UserInfo( 2, '用户2', '', '123456', new RegionInfo(1, '南京'), '男', '', new KlassInfo(0, '', '', '未设置年级', ''), '18912345678', '123456789@qq.com', '', false)
      }

    }

  }

  //???
  loadUserInfo(){
    //加载数据
    LoginService.login('123','123')
      .then(userId => {
        console.log('Tag', 'Tabs_Mine获取user数据')
        this.user.id = userId

        console.log(`${this.user.id}`)

      })
      .catch(error => {
        console.log('Tag', '没有在Tabs_Mine获取user数据')
      })

  }


  //自定义组件实现tabs组件拥有图片
  @Builder TabBarBuilder(title: ResourceStr, image: ResourceStr, index: number){
    Column({space: 8}){
      Image(image)
        .width(22)
        .fillColor(this.selectColor(index))
      Text(title)
        .fontSize(14)
        .fontColor(this.selectColor(index))
    }
  }

  selectColor(index: number){
    return this.currentIndex === index ? $r('app.color.blue') : $r('app.color.light_black')
  }

  build() {
    Tabs({barPosition: BarPosition.End}){
      //1.首页
      TabContent(){
        // Text('首页')
        Tabs_HomePage({ knowledgeShow: $knowledgeShow, videoShow: $videoShow, CompetitionInformShow: $competitionInformShow })
      }
      .tabBar(this.TabBarBuilder($r('app.string.tab_homepage'), $r('app.media.homepage'), 0))

      //2.书法练习
      TabContent(){
        // Text('书法练习')
        if (this.currentIndex == 1){
          Tabs_Exercise({ schoolExercise: $schoolExercise, selfExercise: $selfExercise, excellentExercise: $excellentExercise })
        }


      }
      .tabBar(this.TabBarBuilder($r('app.string.tab_exercise'), $r('app.media.read'), 1))

      //3.书法竞赛
      TabContent(){
        // Text('书法竞赛')
        if (this.currentIndex == 2){
          Tabs_Comptition({ competition: $competition, excellentExercise: $excellentExercise })
        }

      }
      .tabBar(this.TabBarBuilder($r('app.string.tab_competition'), $r('app.media.trophy'), 2))

      //4.消息中心
      TabContent(){
        // Text('消息中心')
        if (this.currentIndex == 3){
          Tabs_Message()
        }

      }
      .tabBar(this.TabBarBuilder($r('app.string.tab_message'), $r('app.media.message'), 3))

      //5.个人信息
      TabContent(){
        // Text('个人信息')

        if (this.currentIndex == 4){

          Tabs_Mine({ userPersonal: $userPersonal })

        }


        // Tabs_Mine()

      }
      .tabBar(this.TabBarBuilder($r('app.string.tab_mine'), $r('app.media.user'), 4))

    }
    .width('100%')
    .height('100%')
    .onChange(index => {
      this.currentIndex = index

    })
  }


  /**
   * Tabs_HomePage
   */
  //获取展示的书法知识
  getShowKnowledge(){
    InformationService.getKnowledgeShow()
      .then((knowledge: KnowledgeInfo[]) => {
        console.log('Tags', '获取书法知识成功')

        this.knowledgeShow = knowledge

      })
      .catch((error) => {

        console.log('Tags', '获取书法知识失败')
      })
  }

  //获取展示的书法教学视频
  getShowVideo(){
    InformationService.getVideoShow()
      .then((video: VideoInfo[]) => {
        console.log('Tags', '获取书法教学视频成功')

        this.videoShow = video
      })
      .catch((error) => {
        console.log('Tags', '获取书法教学视频失败')


      })

  }

  //获取竞赛通知
  getShowCompetition(){
    InformationService.getCompetitionShow()
      .then((competitionInform: CompetitionInformInfo[]) => {
        console.log('Tags', '获取竞赛通知成功')

        this.competitionInformShow = competitionInform
      })
      .catch((error) => {
        console.log('Tags', '获取竞赛通知失败')


      })

  }


  /**
   * Tabs_Mine
   */
  //获取个人信息
  getPersonalInformation(){
    let userId = 1

    UserService.getPersonal(userId)
      .then((user) => {
        console.log('Tags', '获取个人信息成功')

        this.userPersonal = user
      })
      .catch((error) => {
        console.log('Tags', '获取个人信息失败')

      })
  }

}