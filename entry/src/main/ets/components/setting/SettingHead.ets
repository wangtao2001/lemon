import router from '@ohos.router'

@Component
export struct SettingHead {

  title: string = ''


  build() {
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
      .borderRadius(40)
      .stateStyles({
        pressed: {
          .backgroundColor('#e5e5e5')
        },
        normal: {
          .backgroundColor(Color.White)
        }
      })
      .onClick( event => router.back())
      Text(this.title)
        .fontSize(20)

    }
    .height(54)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .width('100%')
  }
}