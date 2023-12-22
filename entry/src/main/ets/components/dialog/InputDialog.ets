@CustomDialog
export  struct InputDialog {
  controller: CustomDialogController
  title: string = ''
  textValue: string = '' // 临时保存
  @Link inputValue: string
  cancel: () => void = () => {}
  confirm: () => void = () => {}

  build() {
    Column() {
      Text(this.title).margin({bottom: 10})
      TextInput({ placeholder: '', text: this.inputValue }).width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('确认')
          .onClick(() => {
            this.inputValue = this.textValue
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }
      .margin({top: 10})
    }.padding({ bottom: 10, top: 20 })
  }
}