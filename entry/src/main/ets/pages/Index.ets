import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'

import web_webview from '@ohos.web.webview'

@Entry
@Component
struct Index {
  webviewController: web_webview.WebviewController = new web_webview.WebviewController()
  @State url: string = 'https://www.baidu.com/'
  @State progressValue: number = 0


  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      TitleBar({
        url: this.url
      })
        Stack({
          alignContent: Alignment.TopStart
        }) {
          Web({
            src: this.url, controller: this.webviewController
          })
            .onPageBegin( event => this.url = event.url)
            .onProgressChange(event => this.progressValue = event.newProgress)
          if (this.progressValue > 0 && this.progressValue < 100 ) {
            Progress({
              value: this.progressValue, total: 100, type: ProgressType.Linear
            })
              .width('100%')
        }
      }
      ToolBar()
    }
  }
}