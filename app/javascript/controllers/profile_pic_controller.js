import { Controller } from '@hotwired/stimulus'
import $ from 'jquery'

// Connects to data-controller="profile-pic"
export default class extends Controller {
  connect() {
    const saveButton = document.getElementById('save-button')
    function showImage(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader()

        reader.onload = function (e) {
          $('#pic-preview').attr('src', e.target.result).width(200).height(200)
        }
        reader.readAsDataURL(input.files[0])

        if (saveButton.classList.contains('hidden')) {
          saveButton.classList.remove('hidden')
        }
      }
    }
    $('#Icon_uploaded-pic').on('change', function (e) {
      showImage(this)
      const button = document.getElementById('save-button')

      button.disabled = false
      if (button.classList.contains('hidden')) {
        button.classList.remove('hidden')
      }
    })
  }
}
