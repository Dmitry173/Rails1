document.addEventListener('turbolinks:load', function () {
  var controls = document.querySelectorAll('.form-inline-link')
  
   if (controls.length) {
     for (var i=0; i < controls.length; i++) {
       controls[i].addEventListener('click', formInlineLinkHandler)
     }
   }

  var errors = document.querySelector('.record-errors')

  if (errors) {
    var recordId = errors.dataset.recordId
    formInlineHandler(recordId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId

  formInlineHandler(testId)
  
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  if ($formInline.length) {

    $testTitle.toggle()
    $formInline.toggle()

    if ($formInline.is(':visible')) {
      link.textContent = 'Cancel'
    } else {
      link.textContent = 'Edit'
    }
  }
}
