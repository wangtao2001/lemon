@CustomDialog
export  struct SelectDialog {
  controller: CustomDialogController
  @Link selectValue: string

  radios = [
    {title: '百度', value: 'baidu', id: '0'},
    {title: 'Bing', value: 'bing', id: '1'},
    {title: 'Google', value: 'google', id: '2'},
    {title: '搜狗', value: 'sogou', id: '3'}
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
            .margin({right: 20})
          Text(r.title)
        }
        .width('80%')
        .margin({top: 10, bottom: 10})
        .justifyContent(FlexAlign.Start)
      })
    }.padding({ bottom: 10, top: 20 })
  }
}