import { Controller } from '@hotwired/stimulus'
import * as bootstrap from 'bootstrap'

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element)
  }

  open() {
    if (!this.modal.isOpened) {
      this.modal.show()
    }
  }

  close(event) {
    if (event.detail.success) {
      this.modal.hide()
    }
  }
}