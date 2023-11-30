import { SettingHead } from '../components/setting/SettingHead'
import { SettingItem } from '../components/setting/SettingItem'
import { InputDialog } from '../components/dialog/InputDialog'
import { SelectDialog } from '../components/dialog/SelectDialog'

interface Setting {
  id: string
  title: string,
  items: Array<{
    id: string, content: string, callback?: () => void
  }>
}

@Entry
@Component
struct Settings {

  @StorageLink('defaultEngine') defaultEngine: string = AppStorage.Get('defaultEngine')
  @StorageLink('defaultHomePage') defaultHomePage: string = AppStorage.Get('defaultHomePage')

  // 弹窗控制器
  homePageDialogController: CustomDialogController = new CustomDialogController({
    builder: InputDialog({
      inputValue: this.defaultHomePage
    })
  })
  engineDialogController: CustomDialogController = new CustomDialogController({
    builder: SelectDialog({
      selectValue: this.defaultEngine
    })
  })
  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.homePageDialogController = undefined
  }
  settings: Array<Setting> = [
    {
      id: '01',
      title: '搜索设置',
      items: [
        { id: '0101', content: '默认搜索引擎', callback:  () => {
          this.engineDialogController.open()
        } },
        { id: '0102', content: '主页', callback: () => {
          this.homePageDialogController.open()
        } }
      ]
    },
    {
      id: '02',
      title: '更多',
      items: [
        {id: '0201',content: '检查更新'},
        {id: '0202',content: '关于'}
      ]
    }
  ]


  build() {
    Column() {
      SettingHead({title: '设置'})
      List() {
        ForEach(this.settings, s => {
          ListItemGroup({header: this.listHead(s.title)}) {
            ForEach(s.items, i => {
              ListItem() {
                SettingItem({content: i.content, callback: i.callback})
              }
            }, i => i.id)
          }
        }, s => s.id)
      }
      .padding(10)
    }
  }

  @Builder
  listHead(title: string) {
    Text(title)
      .margin({left: 10, bottom: 10, top: 10})
      .fontColor('#66000000')
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 200 })
      .slide(SlideEffect.Right)

    PageTransitionExit({ type: RouteType.None, duration: 200 })
      .slide(SlideEffect.Right)
  }
}