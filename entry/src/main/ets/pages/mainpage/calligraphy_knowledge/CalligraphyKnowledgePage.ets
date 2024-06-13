import { HeaderSearch } from '../../../common/components/CommonComponents'
import Knowledge_Biography from '../../../views/homepage/calligraphy_knowledge/Knowledge_Biography'
import Knowledge_Culture from '../../../views/homepage/calligraphy_knowledge/Knowledge_Culture'
import Knowledge_FamousWorks from '../../../views/homepage/calligraphy_knowledge/Knowledge_FamousWorks'
import Knowledge_Hanzi from '../../../views/homepage/calligraphy_knowledge/Knowledge_Hanzi'
import Knowledge_Recommend from '../../../views/homepage/calligraphy_knowledge/Knowledge_Recommend'
@Entry
@Component
struct CalligraphyKnowledgePage {
  @State currentIndex: number = 0

  //自定义组件实现tabs组件拥有图片
  @Builder TabBarBuilder(title: ResourceStr, index: number){
    Column({space: 8}){
      Text(title)
        .fontSize(16)
        .fontColor(this.selectColor2(index))

      Divider()
        .color(this.selectColor1(index))
        .strokeWidth(2)
        .width(70)
    }
    .width('100%')
    .height(40)
    // .backgroundColor(this.selectColor(index))
    .justifyContent(FlexAlign.Center)
  }

  selectColor1(index: number){
    return this.currentIndex === index ? $r('app.color.pink') : $r('app.color.start_window_background')
  }

  selectColor2(index: number){
    return this.currentIndex === index ? $r('app.color.pink') : $r('app.color.black')
  }

  build() {
    Column(){
      //1 头部
      HeaderSearch()

      //2 导航栏+内容
      Tabs({barPosition: BarPosition.Start}){
        //1.推荐
        TabContent(){
          // Text('推荐')
          Knowledge_Recommend()
        }
        .tabBar(this.TabBarBuilder($r('app.string.knowledge_recommend'), 0))

        //2.人物传记
        TabContent(){
          // Text('人物传记')
          Knowledge_Biography()
        }
        .tabBar(this.TabBarBuilder($r('app.string.knowledge_biography'), 1))

        //3.汉字
        TabContent(){
          // Text('汉字')
          Knowledge_Hanzi()
        }
        .tabBar(this.TabBarBuilder($r('app.string.knowledge_Hanzi'), 2))

        //4.名家作品
        TabContent(){
          // Text('名家作品')
          Knowledge_FamousWorks()
        }
        .tabBar(this.TabBarBuilder($r('app.string.knowledge_famousWorks'), 3))

        //5.文化
        TabContent(){
          // Text('文化')
          Knowledge_Culture()
        }
        .tabBar(this.TabBarBuilder($r('app.string.knowledge_culture'), 4))


      }
      .width('100%')
      .height('100%')
      .onChange(index => {
        this.currentIndex = index
      })

    }
  }
}