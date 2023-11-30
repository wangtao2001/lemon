@CustomDialog
export  struct SelectDialog {
  controller: CustomDialogController
  @Link selectValue: string

  radios = [
    {title: '百度', value: 'baidu', id: '0'},
    {title: 'BING', value: 'bing', id: '1'},
    {title: 'GOOGLE', value: 'google', id: '2'}
  ]

  build() {
    Column() {
      ForEach(this.radios, r => {
        Row() {
          Radio({value: r.value, group: '0'}).checked(r.value == this.selectValue).onChange( isChecked => {
            if (isChecked) {
              this.selectValue = r.value
            }
            this.controller.close()
          })
          Text(r.title)
        }
        .width('50%')
        .justifyContent(FlexAlign.Start)
      })
    }.padding({ bottom: 10, top: 20 })
  }
}