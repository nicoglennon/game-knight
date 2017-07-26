var listenForFavoriteClicks = function() {
  $('.new_favoriting').on('submit', function() {
    event.preventDefault()
    var x = event.clientX;
    var y = event.clientY;
    processFavorite($(this),x,y)
  })
}

var listenForAddClicks = function() {
  $('.new_ownership').on('submit', function() {
    event.preventDefault()
    x = event.clientX
    y = event.clientY
    processOwnership($(this),x,y)
  })
}

var processFavorite = function($form,x,y) {
  game = $form.find('#favoriting_game').val()
  promiseObject = $.post('/favoritings', {game: game} )

  promiseObject.done( function(response){
    console.log(x,y)
  })
  .fail( function (response) {
    alert('You already favorited this game')
  })
}

var  processOwnership = function($form) {
  console.log('ownership')
}
