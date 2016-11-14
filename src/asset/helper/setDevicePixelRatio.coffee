module.exports = ->
  isAndroid = window.navigator.appVersion.match /android/gi
  isIPhone  = window.navigator.appVersion.match /iphone/gi
  dpr = window.devicePixelRatio
  if isIPhone
    switch true
      when dpr >= 3 then dpr = 3
      when dpr is 2 then dpr = 2
      else dpr = 1
  else
    # @REVIEW If set dpr in android ?
    dpr = 1
  document.documentElement.setAttribute 'soil-dpr', dpr