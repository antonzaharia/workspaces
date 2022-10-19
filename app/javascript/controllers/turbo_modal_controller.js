import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ['modal']
  connect() {
    document.addEventListener('turbo:before-stream-render', function (event) {
      // Add a class to an element we are about to add to the page
      // as defined by its "data-stream-enter-class"
      if (event.target.firstElementChild instanceof HTMLTemplateElement) {
        var enterAnimationClass = event.target.templateContent.firstElementChild.dataset.streamEnterClass
        if (enterAnimationClass) {
          event.target.templateElement.content.firstElementChild.classList.add(enterAnimationClass)
        }
      }

      // Add a class to an element we are about to remove from the page
      // as defined by its "data-stream-exit-class"
      var elementToRemove = document.getElementById(event.target.target)
      if (elementToRemove) {
        var streamExitClass = elementToRemove.dataset.streamExitClass
        if (streamExitClass) {
          // Intercept the removal of the element
          event.preventDefault()
          elementToRemove.classList.add(streamExitClass)
          // Wait for its animation to end before removing the element
          elementToRemove.addEventListener('animationend', function () {
            event.target.performAction()
          })
        }
      }
    })
  }

  closeModal(e) {
    e.preventDefault()
    if (e.target.id !== 'schema-form') {
      document.getElementById('modal').classList.remove('show')
      document.getElementById('modal').style.display = 'none'
    }
  }
  modalTargetConnected(element) {
    document.getElementById('modal').style.display = 'block'
    document.getElementById('modal').classList.add('show')
  }
  modalTargetDisconnected(element) {
    element.innerHTML = ''
  }
}
