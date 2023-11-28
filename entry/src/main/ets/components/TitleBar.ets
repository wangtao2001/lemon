@Component
export struct TitleBar {
  @Prop url: string

  build() {
    Flex({
      direction: FlexDirection.Row,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Column() {
        Image($r('app.media.ic_public_search_filled')).objectFit(ImageFit.Contain)
      }
        .padding(10)
        .width(44)
        .height('100%')
        .backgroundColor(Color.Red)
        .alignItems(HorizontalAlign.Center)
      TextInput({
          text: this.url
      })
        .borderRadius(0)
        .height('100%')
        .flexBasis('auto')
      Text('搜索')
        .padding(10)
        .backgroundColor('#F1F3F5')
        .fontColor('#64BB5C')
        .height('100%')
    }
    .height(52)
  }
}