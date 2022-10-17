import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="profile-pic"
export default class extends Controller {
  connect() {
    function showImage(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader()

        reader.onload = function (e) {
          $('#pic-preview').attr('src', e.target.result).width(200).height(200)
        }
        reader.readAsDataURL(input.files[0])
      }
    }
    $('#uploaded-pic').on('change', function () {
      showImage(this)
    })
  }
}
