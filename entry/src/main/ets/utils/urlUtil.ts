export  const isUrlString = str => {
  var pattern = /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\{0}'\*\+,;=.]+$/
  return pattern.test(str)
}