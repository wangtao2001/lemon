import router from '@ohos.router'

@Entry
@Component
struct settings {
  build() {
    Column() {
      Row() {
        Flex({
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Image($r('app.media.ic_public_back'))
            .width(24).height(24)

        }
        .width(40)
        .height('60%')
        .margin({left: 5, right: 5})
        .borderRadius(30)
        .stateStyles({
          pressed: {
            .backgroundColor('#e5e5e5')
          },
          normal: {
            .backgroundColor(Color.White)
          }
        })
        .onClick( event => router.back())
        Text('设置')
          .fontSize(20)

      }
      .height(54)
      .justifyContent(FlexAlign.Start)
      .width('100%')
      List() {
        
      }
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 80 })
      .slide(SlideEffect.Right)

    PageTransitionExit({ type: RouteType.None, duration: 80 })
      .slide(SlideEffect.Right)
  }
}