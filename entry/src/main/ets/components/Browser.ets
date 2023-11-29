import web_webview from '@ohos.web.webview'

@Component
export struct Browser {

  webviewController: web_webview.WebviewController
  @Link url: string
  @State progressValue: number = 0
  userAgent: string = 'Mozilla/5.0 (Linux; Android 10; EVR-AL00 Build/HUAWEIEVR-AL00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.186 Mobile Safari/537.36 baiduboxapp/11.0.5.12 (Baidu; P1 10)'

  build() {
    Stack({
      alignContent: Alignment.TopStart
    }) {
      Web({
        src: this.url, controller: this.webviewController
      })
        .onPageBegin( event => this.url = event.url)
        .onProgressChange(event => this.progressValue = event.newProgress)
        .userAgent(this.userAgent)
      if (this.progressValue > 0 && this.progressValue < 100 ) {
        Progress({
          value: this.progressValue, total: 100, type: ProgressType.Linear
        })
          .width('100%')
      }
    }
  }
}