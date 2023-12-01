interface ToolItem {
  id: string,
  img: Resource,
  title: string,
  callback?: Function
}

@Component
export struct TabPanel {

  @Link tabPanel: boolean

  build() {
    Panel(this.tabPanel) {
      Column() {

      }
      Flex({
        justifyContent: FlexAlign.Start,alignItems: ItemAlign.Start
      }) {

      }
    }.type(PanelType.Temporary).dragBar(false)
  }
}