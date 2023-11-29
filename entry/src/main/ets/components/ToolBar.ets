interface ToolItem {
  id: string,
  img: Resource,
  callback?: Function
}

@Component
export  struct ToolBar {

  items: Array<ToolItem> = [
  { id: '1', img: $r('app.media.ic_public_arrow_left') },
  { id: '2', img: $r('app.media.ic_public_arrow_right') },
  { id: '3', img: $r('app.media.ic_public_home'), callback: () => AlertDialog.show({
    message: '返回主页'
  })},
  { id: '4', img: $r('app.media.ic_public_view_list') },
  { id: '5', img: $r('app.media.ic_public_settings') }
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
          top: 12, bottom: 12, left: 15, right: 15
        }) // 按压后的反馈区域
        .borderRadius(10)
        .stateStyles({
          pressed: {
            .backgroundColor('#e5e5e5')
          },
          normal: {
            .backgroundColor(Color.White)
          }
        })
  }
}