import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'
import { Browser } from '../components/Browser'

import web_webview from '@ohos.web.webview'

@Entry
@Component
struct Index {
  @State url: string = 'https://bing.com'
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
}
