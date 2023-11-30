import web_webview from '@ohos.web.webview'
import promptAction from '@ohos.promptAction'

import { isUrlString, searchAPI } from '../utils/urlUtil'

@Component
export struct TitleBar {
  @Prop @Watch('urlChange') url: string
  @State inputValue: string = this.url // url初始化

  urlChange() {
    this.inputValue = this.url // url外部改变
  }

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
          if (this.input) this.inputValue = ''
          else AlertDialog.show({
             message: this.webviewController.getTitle() + '\n' + this.webviewController.getUrl()
          })
        })
      TextInput({
          text: this.inputValue
      })
        .borderRadius(40)
        .width(0)
        .border({
          width: 1
        })
        .flexGrow(1)
        .onChange( value => this.inputValue = value)
        .onSubmit( event => {
          if (isUrlString(this.inputValue)) this.webviewController.loadUrl(this.inputValue)
          else {
            const engine: string = AppStorage.Get('defaultEngine')
            this.webviewController.loadUrl(searchAPI(engine, this.inputValue))
          }
        })
        .onEditChange( bool => {
          this.input = bool
          if (!bool) this.inputValue = this.url // 失去输入状态再次初始化
        })
      Flex({
        justifyContent: FlexAlign.Center,
        alignItems: ItemAlign.Center
      }) {
        Text(this.input ? '搜索': '刷新')
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
        .animation({duration: 220})
        .onClick( event => {
          if (this.input) {
            if (isUrlString(this.inputValue)) this.webviewController.loadUrl(this.inputValue)
            else {
            const engine: string = AppStorage.Get('defaultEngine')
            this.webviewController.loadUrl(searchAPI(engine, this.inputValue))
          }
          } else {
            this.webviewController.refresh()
          }
        })
    }
    .height(60)
  }
}