import web_webview from '@ohos.web.webview'

@Component
export struct Browser {

  webviewController: web_webview.WebviewController
  @Link url: string
  @State progressValue: number = 0

  build() {
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
  }
}