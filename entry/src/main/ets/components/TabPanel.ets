import web_webview from '@ohos.web.webview'

import { SettingItem } from '../components/setting/SettingItem'

interface ToolItem {
  id: string,
  img: Resource,
  title: string,
  callback?: Function
}

export interface Controller {
  controller: web_webview.WebviewController,
  id: number
}

@Component
export struct TabPanel {
  @Link browserIdx: number
  @Link controllerArr: Array<Controller>
  @Link tabPanel: boolean

  build() {
    Panel(this.tabPanel) {
      Column() {
        ForEach(this.controllerArr, (c: Controller, index: number) => {
          if (this.browserIdx == c.id) {
            SettingItem({
              content: `[${index}]  主页`, main: true
            })
          } else {
            SettingItem({
              content: `[${index}]  主页`
            }).onClick( event => this.browserIdx = index )
          }
        })
      }
      .width('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Start)
      Flex({
        justifyContent: FlexAlign.Start,alignItems: ItemAlign.Start
      }) {

      }
    }.type(PanelType.Temporary).dragBar(false).backgroundColor(Color.White)
  }
}