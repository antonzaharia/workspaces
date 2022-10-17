import Toastify from 'toastify-js'
import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="toastify"
export default class extends Controller {
  connect() {
    const backgroundColors = {
      alert: '#f44336',
      error: '#fc5c5c',
      notice: '#0d6efd',
    }
    JSON.parse(document.body.dataset.flashMessages).forEach((flashMessage) => {
      const [type, message] = flashMessage
      Toastify({
        text: message,
        duration: 15000,
        close: true,
        gravity: 'bottom',
        position: 'right',
        background: backgroundColors[type],
        stopOnFocus: true,
      }).showToast()
    })
  }
}
