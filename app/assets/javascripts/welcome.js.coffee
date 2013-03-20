window.onload = ->
  return false if $('#welcome').size() == 0 # run this script only if this is the top page

  welcome = new Image()
  welcome.src = 'assets/welcome.jpg'
  welcome.onload = ->
    $('#campus').css { background: 'url("assets/welcome.jpg")', backgroundRepeat: 'no-repeat', backgroundPosition: '0 0' }
    if $.cookie('skip_animation') == 'true'
      skip_animation()
    else
      welcome_animation()
      $.cookie('skip_animation', 'true')

welcome_animation = ->
  $('#loading').animate { opacity: 'toggle' }, 500, ->
    $('#campus').show 0, ->
      interval = 100
      width = 640

      $('#campus').delay(interval * 5).queue -> $(@).css('background-position', '-' +  1 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  0 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 4).queue -> $(@).css('background-position', '-' +  1 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  0 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 2).queue -> $(@).css('background-position', '-' +  1 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  0 * width + 'px 0').dequeue()

      interval = 200

      $('#campus').delay(interval * 5).queue -> $(@).css('background-position', '-' +  2 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  3 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  4 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  5 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  6 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  7 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  8 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' +  9 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' + 10 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' + 11 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' + 12 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' + 13 * width + 'px 0').dequeue()
      $('#campus').delay(interval * 1).queue -> $(@).css('background-position', '-' + 14 * width + 'px 0').dequeue()

      $('#campus').delay(interval * 2).queue -> $(@).next('#campus-nav').animate { opacity: 'toggle' }, 500

skip_animation = ->
  $('#loading').animate { opacity: 'toggle' }, 500, ->
    $('#campus').css('background-position', '-' + 14 * 640 + 'px 0')
    $('#campus').animate { opacity: 'toggle' }, 500, ->
      $('#campus-nav').animate { opacity: 'toggle'}, 500
