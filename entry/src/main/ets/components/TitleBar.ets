import web_webview from '@ohos.web.webview'

@Component
export struct TitleBar {
  @Prop url: string

  webviewController: web_webview.WebviewController

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Flex({
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Image($r('app.media.ic_public_search_filled')).objectFit(ImageFit.Contain)
          .height(24).width(24)
      }
        .height('100%')
        .width(40)
      TextInput({
          text: this.url
      })
        .borderRadius(40)
        .width(0)
        .border({
          width: 1
        })
        .flexGrow(1)
        .onChange( value => this.url = value)
        .onSubmit( event => this.webviewController.loadUrl(this.url))
      Flex({
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Text('搜索')
          .fontSize(15)
          .fontColor('#64BB5C')
      }
        .width(52)
        .height('60%')
        .borderRadius(40)
        .stateStyles({
          pressed: {
            .backgroundColor('#e5e5e5')
          },
          normal: {
            .backgroundColor('#F1F3F5')
          }
        })

    }
    .height(60)
    .backgroundColor('#F1F3F5')
  }
}