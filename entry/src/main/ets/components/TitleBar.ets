@Component
export struct TitleBar {
  @Prop url: string

  build() {
    Column() {
      TextInput({
          text: this.url
      })
        .height(50)
        .borderRadius(0)
    }
  }
}