@CustomDialog
export  struct SelectDialog {
  controller: CustomDialogController
  @Link selectValue: string

  radios = [
    {title: '百度', value: 'baidu', id: '0', checked: false},
    {title: 'BING', value: 'bing', id: '1', checked: true},
    {title: 'GOOGLE', value: 'google', id: '2', checked: false}
  ]

  build() {
    Column() {
      ForEach(this.radios, r => {
        Row() {
          Text(r.title)
          Radio({value: r.value, group: '0'}).checked(r.checked).onChange( isChecked => {
            if (isChecked) {
              this.selectValue = r.value
            }
            this.controller.close()
          })
        }
        .width('50%')
        .justifyContent(FlexAlign.SpaceBetween)
      })
    }.padding({ bottom: 10, top: 20 })
  }
}