import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'
import { Browser } from '../components/Browser'
import { TabPanel, Controller } from '../components/TabPanel'

import web_webview from '@ohos.web.webview'

PersistentStorage.PersistProp('defaultEngine', 'bing');
PersistentStorage.PersistProp('defaultHomePage', 'https://bing.com')

@Entry
@Component
struct Index {
  @State url: string = AppStorage.Get('defaultHomePage') // 这里是页面打开的时候读取的默认值
  @State @Watch('controllerChange') browserIdx: number = 0
  @State @Watch('controllerChange') controllerArr: Array<Controller> = [
    {controller: new web_webview.WebviewController(), id: 0},
    {controller: new web_webview.WebviewController(), id: 1}
  ]
  @State tabPanel: boolean = false
  @State currentController: web_webview.WebviewController = this.controllerArr[this.browserIdx].controller

  controllerChange() {
    this.currentController = this.controllerArr[this.browserIdx].controller
    this.tabPanel = false
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      TitleBar({
        url: this.url, webviewController: this.currentController
      })
      Stack() {
        Column() {
        ForEach(this.controllerArr, (c: Controller) => {
            if (c.id == this.browserIdx) {
              Browser({
                url: this.url, webviewController: c.controller
              }).height(100)
            } else {
              Browser({
                url: this.url, webviewController: c.controller
              }).height(100) // 只展示一个browser
            }
        }, (c: Controller) => c.id.toString())}
        TabPanel({tabPanel: this.tabPanel, controllerArr: this.controllerArr, browserIdx: this.browserIdx})
      }
      ToolBar({
        tabPanel: this.tabPanel, webviewController: this.currentController
      })
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Pop, duration: 0 })
      .slide(SlideEffect.Left)

    PageTransitionExit({ type: RouteType.Push, duration: 1000000, curve: Curve.Ease  })
      .slide(SlideEffect.Left)
  }
}
