import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  static targets = ['modal']
  connect() {}
  hide(e) {
    if (e.target.classList.contains('modal')) {
      this.modalTarget.classList.remove('modal-open')
    }
  }
  cancel() {
    this.modalTarget.classList.remove('modal-open')
  }
  modalTargetConnected(element) {
    this.modalTarget.classList.add('modal-open')
  }
  modalTargetDisconnected(element) {
  }
}
