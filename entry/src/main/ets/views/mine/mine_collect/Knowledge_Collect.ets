import router from '@ohos.router'
import { CommonConstants } from '../../../common/constants/CommonConstants'
import KnowledgeItem from '../../../viewitem/KnowledgeItem'
import KnowledgeInfo from '../../../viewmodel/KnowledgeInfo'
import { KnowledgeType } from '../../../viewmodel/KnowledgeInfo'

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
export default struct Knowledge_Collect {
  /*
  @State knowledge: KnowledgeInfo[] = [
    new KnowledgeInfo(KnowledgeType.Hanzi, true , '汉字的演变过程', 666, '2024-4-10', $r('app.media.show_knoledge')),
    new KnowledgeInfo(KnowledgeType.famousWorks, false , '《洛神赋十三行》王献之', 666, '2024-4-10', $r('app.media.show_knoledge'))
  ]
  * */

  @Link knowledgeCollect: KnowledgeInfo[]

  build() {
    Scroll(){
      Column(){
        //作业列表
        List({space: 10}){
          ListItem(){

          }
          .height(5)

          ForEach(this.knowledgeCollect,
            (knowledge) => {

              ListItem() {

                KnowledgeItem({ knowledge: knowledge })

              }
              .exercise_List()
              .onClick(() => {
                router.pushUrl(
                  {
                    url: 'pages/mainpage/calligraphy_knowledge/KnowledgeDetialPage'
                  }
                )
              })
            }
          )

          ListItem(){

          }
          .height(100)
        }
        .alignListItem(ListItemAlign.Center)
        .listDirection(Axis.Vertical) // 排列方向
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
        .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
        .onScrollIndex((firstIndex: number, lastIndex: number) => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
        })
        .width('100%')
        .height('100%')

      }
    }
  }




}