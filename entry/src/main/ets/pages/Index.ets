import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'
import { Browser } from '../components/Browser'
import { TabPanel } from '../components/TabPanel'

import web_webview from '@ohos.web.webview'

PersistentStorage.PersistProp('defaultEngine', 'bing');
PersistentStorage.PersistProp('defaultHomePage', 'https://bing.com');

@Entry
@Component
struct Index {
  @State url: string = AppStorage.Get('defaultHomePage') // 这里是页面打开的时候读取的默认值
  webviewController: web_webview.WebviewController = new web_webview.WebviewController()
  @State tabPanel: boolean = false

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      TitleBar({
        url: this.url, webviewController: this.webviewController
      })
      Stack() {
        Browser({
          url: this.url, webviewController: this.webviewController
        })
        TabPanel({tabPanel: this.tabPanel})
      }
      ToolBar({
        webviewController: this.webviewController, tabPanel: this.tabPanel
      })
    }
    .backgroundColor(Color.White)
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Pop, duration: 0 })
      .slide(SlideEffect.Left)

    PageTransitionExit({ type: RouteType.Push, duration: 1000000, curve: Curve.Ease  })
      .slide(SlideEffect.Left)
  }
}
