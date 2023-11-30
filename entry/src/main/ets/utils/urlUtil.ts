export const isUrlString = str => {
  var pattern = /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\{0}'\*\+,;=.]+$/
  return pattern.test(str)
}

export const  searchAPI = (engine: string, keyword: string) => {
  switch (engine) {
    case 'bing':
      return `https://bing.com/search?q=${keyword}`
    case 'baidu':
      return `https://www.baidu.com/s?wd=${keyword}`
    case 'google':
      return `https://www.google.com/search?q=${keyword}`
    case 'sogou':
      return `https://www.sogou.com/web?query=${keyword}`
  }
}