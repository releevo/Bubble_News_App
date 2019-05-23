console.log ('show')

var viewOriginal = document.querySelectorAll('.pick-side')[0]
var viewPerspective = document.querySelectorAll('.pick-side')[1]
var articleOriginal = document.querySelector('.original')
var articlePerspective = document.querySelector('.perspective')

var handleViewOriginal = event => {
  articleOriginal.classList.remove('hide')
  articlePerspective.classList.add('hide')
}

var handleViewPerspective = event => {
  articleOriginal.classList.add('hide')
  articlePerspective.classList.remove('hide')
}

viewOriginal.addEventListener('click', handleViewOriginal)
viewPerspective.addEventListener('click', handleViewPerspective)
