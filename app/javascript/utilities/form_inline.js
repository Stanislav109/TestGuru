document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for(var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }
  
  const errors = document.querySelector('.resource-errors')

  if (errors) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  if (link == null) return

  const $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  const $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = link.dataset.textCancel
  } else {
  	link.textContent = link.dataset.textEdit
  }
}
