import web_webview from '@ohos.web.webview'

import { isUrlString } from '../utils/urlUtil'

@Component
export struct TitleBar {
  @Prop url: string

  webviewController: web_webview.WebviewController
  @State input: boolean = false

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
        if (this.input) {
          Image($r('app.media.ic_public_cancel'))
            .objectFit(ImageFit.Contain)
            .height(24).width(24)
        } else {
          Image($r('app.media.ic_public_search_filled'))
            .objectFit(ImageFit.Contain)
            .height(24).width(24)
        }
      }
        .width(40)
        .height('60%')
        .borderRadius(100)
        .stateStyles({
          pressed: {
            .backgroundColor('#e5e5e5')
          },
          normal: {
            .backgroundColor(Color.White)
          }
      })
        .onClick( () => {
          if (this.input) this.url = ''
          else AlertDialog.show({
             message: this.webviewController.getTitle() + '\n' + this.webviewController.getUrl()
          })
        })
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
        .onSubmit( event => {
          if (isUrlString(this.url)) this.webviewController.loadUrl(this.url)
          else {
            const engine = AppStorage.Get('defaultEngine')
            switch (engine) {
              case 'bing':
                this.webviewController.loadUrl(`https://bing.com/search?q=${this.url}`)
                break
              case 'baidu':
                this.webviewController.loadUrl(`https://www.baidu.com/s?wd=${this.url}`)
                break
              case  'google':
                this.webviewController.loadUrl(`https://www.google.com/search?q=${this.url}`)
                break
            }
          }
        })
        .onEditChange( value => this.input = value)
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
            .backgroundColor(Color.White)
          }
        })
        .onClick( event => {
          if (isUrlString(this.url)) this.webviewController.loadUrl(this.url)
          else this.webviewController.loadUrl(`https://bing.com/search?q=${this.url}`)
        })
    }
    .height(60)
  }
}