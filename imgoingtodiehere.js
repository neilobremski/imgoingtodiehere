
function loadCss(href) {
  const link = document.createElement('link')
  link.rel = 'stylesheet'
  link.href = href
  document.head.appendChild(link)
}

// configure onload event
window.onload = function() {
  const div = document.createElement("div")
  div.innerText = "DOM is fully loaded"
  document.documentElement.appendChild(div)
  loadCss('/imgoingtodiehere.css')
}
