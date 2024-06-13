import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import KnowledgeItem from '../../../viewitem/KnowledgeItem'
import KnowledgeInfo from '../../../viewmodel/KnowledgeInfo'

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

enum KnowledgeType{
  biography = '人物传记',
  famousWorks = '名家作品',
  Hanzi = '汉字',
  culture = '文化'
}

@Component
export default struct Knowledge_Biography {
  @State knowledge: KnowledgeInfo[] = [
    new KnowledgeInfo(KnowledgeType.biography, false, '王羲之的童年时期', 666, '2024-4-10', $r('app.media.show_knoledge')),
    new KnowledgeInfo(KnowledgeType.biography, false, '颜真卿的人物传记', 666, '2024-4-10', $r('app.media.show_knoledge')),
    new KnowledgeInfo(KnowledgeType.biography, false, '李斯的生平', 666, '2024-4-10', $r('app.media.show_knoledge'))
  ]

  build() {
    Scroll(){
      Column(){
        //作业列表
        Column({space: 10}){
          Column(){

          }
          .height(5)

          ForEach(
            this.knowledge ,
            (knowledge) => {
              Column() {
                KnowledgeItem({ knowledge: knowledge })
              }
              .exercise_List()

            }
          )

          Column(){

          }
          .height(100)
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height('100%')

      }
    }

  }
}

