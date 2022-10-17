import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['dropdown']
  connect() {}
  toggleDropdown() {
    if (this.dropdownTarget.classList.contains('show')) {
      this.dropdownTarget.classList.remove('show')
    } else {
      this.dropdownTarget.classList.add('show')
    }
  }
}
