import web_webview from '@ohos.web.webview'
import router from '@ohos.router'

interface ToolItem {
  id: string,
  img: Resource,
  callback?: Function
}

@Component
export  struct ToolBar {

  @Link webviewController: web_webview.WebviewController
  @Link tabPanel: boolean

  items: Array<ToolItem> = [
  { id: '1', img: $r('app.media.ic_public_arrow_left'), callback: () => this.webviewController.backward() },
  { id: '2', img: $r('app.media.ic_public_arrow_right'), callback: () => this.webviewController.forward() },
  { id: '3', img: $r('app.media.ic_public_home'), callback: () => {
    this.webviewController.stop()
    this.webviewController.loadUrl(AppStorage.Get('defaultHomePage'))
  }},
  { id: '4', img: $r('app.media.ic_public_view_list'), callback: () => this.tabPanel = ! this.tabPanel },
  { id: '5', img: $r('app.media.ic_public_settings'), callback: () => router.pushUrl({url: 'pages/Settings'}) }
]

  build() {
      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.SpaceAround,
        alignItems: ItemAlign.Center
      }) {
        ForEach(this.items, (item: ToolItem) => {
          ItemButton({img: item.img}).onClick(event => {
            if (item.callback) { // 判断回调函数是否存在
              item.callback()
            }
          })
        }, (item: ToolItem) => item.id)
      }
  }
}

@Component
struct ItemButton {
  @Prop img: Resource

  build() {
      Column(){
        Image(this.img)
          .objectFit(ImageFit.Contain)
          .width(28).height(28)
      }
        .alignItems(HorizontalAlign.Center)
        .padding({
          top: 16, bottom: 16, left: 20, right: 20
        }) // 按压后的反馈区域
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
  }
}