import { SettingHead } from '../components/setting/SettingHead'
import { SettingItem } from '../components/setting/SettingItem'

@Entry
@Component
struct About {
  build() {
    Column() {
      Column() {
        Column() {
          SettingHead({title: '关于'})
          Column() {
            Image($r('app.media.icon')).height(80).width(80).borderRadius(50)
            Text('lemon 浏览器').margin({top: 20, bottom: 5}).fontWeight(700).fontSize(22)
            Text('0.0.1').fontSize(14).fontColor('#66000000')
          }
          .width('100%')
          .height(300)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        }
        Column() {
          SettingItem({content: '开源地址'})
          SettingItem({content: '联系作者'})
        }
        .padding(10)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      Row() {
        Text('Powered by ').fontSize(14).fontColor('#66000000')
        Image($r('app.media.HarmonyOS_logo')).height(18).objectFit(ImageFit.Contain)
      }.margin(20)
    }.justifyContent(FlexAlign.SpaceBetween).height('100%').backgroundColor(Color.White)

  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.Push, duration: 250, curve: Curve.Ease })
      .slide(SlideEffect.Right)

    PageTransitionExit({ type: RouteType.Pop, duration: 250, curve: Curve.Ease })
      .slide(SlideEffect.Right)
  }
}