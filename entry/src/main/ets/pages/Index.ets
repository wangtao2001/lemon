import { TitleBar } from '../components/TitleBar'
import { ToolBar } from '../components/ToolBar'
import { Browser } from '../components/Browser'

@Entry
@Component
struct Index {
  @State url: string = 'https://bing.com'

  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      TitleBar({
        url: this.url
      })
      Browser({
        url: this.url
      })
      ToolBar()
    }
  }
}
