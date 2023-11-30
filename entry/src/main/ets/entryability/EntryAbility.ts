import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
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
