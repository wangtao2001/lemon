import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import UIAbility from '@ohos.app.ability.UIAbility'
import Want from '@ohos.app.ability.Want'
import window from '@ohos.window'
import web_webview from '@ohos.web.webview'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    web_webview.WebviewController.initializeWebEngine()
  }

  onDestroy() {
  }

  onWindowStageCreate(windowStage: window.WindowStage) {

    let windowClass: window.Window = null
    windowStage.getMainWindow((err, data) => {
      if (err.code) {
        return
      }
      windowClass = data
    })

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        return
      }
    })
  }

  onWindowStageDestroy() {
  }

  onForeground() {
  }

  onBackground() {
  }
}
