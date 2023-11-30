@Component
export struct SettingItem {

  content: string = ''
  callback: ()=>void = () => {}

  build() {
    Row() {
      Text(this.content)
      Image($r('app.media.ic_public_arrow_right'))
        .width('18').height('18')
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height(40)
    .borderRadius(40)
    .padding({left: 10, right: 10})
    .stateStyles({
      pressed: {
        .backgroundColor('#e5e5e5')
      },
      normal: {
        .backgroundColor(Color.White)
      }
    })
    .animation({duration: 220})
    .onClick( () => this.callback())
  }
}