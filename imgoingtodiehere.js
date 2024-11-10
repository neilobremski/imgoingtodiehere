
function loadCss(href) {
  const link = document.createElement('link')
  link.rel = 'stylesheet'
  link.href = href
  document.head.appendChild(link)
}

function loadJavascript(href) {
  const script = document.createElement('script')
  script.src = href
  document.head.appendChild(script)
}

// create a `tag` element with `contents` assigned properties and append `children`
function make(tag, contents, children, attributes) {
  const element = document.createElement(tag)
  Object.assign(element, contents)
  for (const child of (children || [])) {
    element.appendChild(child)
  }
  for (const attribute of Object.keys(attributes || {})) {
    element.setAttribute(attribute, attributes[attribute])
  }
  return element
}

window.onload = function() {
  const body = document.querySelector("body")

  const footerHtml = `
  <hr>
  <copyright><a href="https://imgoingtodiehere.com">imgoingtodiehere.com</a> &copy; 2024++ by Greg Havener and Neil C. Obremski</copyright>
  `

  const mainContainer = make("main", {className: "container"}, [
    ...Array.from(body.children),
    make("footer", {innerHTML: footerHtml})
  ])

  body.appendChild(mainContainer)

  loadCss("https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css")
  loadCss("/imgoingtodiehere.css")

  loadJavascript("https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js")

  setTimeout(() => {body.classList.add("loaded")}, 100)
}
