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
export default struct Knowledge_Recommend {
  @State knowledge: KnowledgeInfo[] = [
    new KnowledgeInfo(KnowledgeType.Hanzi, true , '汉字的演变过程', 666, '2024-4-10', $r('app.media.show_knoledge')),
    new KnowledgeInfo(KnowledgeType.famousWorks, false , '《洛神赋十三行》王献之', 666, '2024-4-10', $r('app.media.show_knoledge'))
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

