import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'
import { Browser } from '../components/Browser'

import web_webview from '@ohos.web.webview'

PersistentStorage.PersistProp('defaultEngine', 'bing');
PersistentStorage.PersistProp('defaultHomePage', 'https://bing.com');

@Entry
@Component
struct Index {
  @State url: string = AppStorage.Get('defaultHomePage') // 这里是页面打开的时候读取的默认值
  webviewController: web_webview.WebviewController = new web_webview.WebviewController()

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      TitleBar({
        url: this.url, webviewController: this.webviewController
      })
      Browser({
        url: this.url, webviewController: this.webviewController
      })
      ToolBar({
        webviewController: this.webviewController
      })
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 200 })
      .slide(SlideEffect.Left)

    PageTransitionExit({ type: RouteType.None, duration: 200 })
      .slide(SlideEffect.Left)
  }
}
