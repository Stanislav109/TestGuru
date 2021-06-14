document.addEventListener('turbolinks:load', function() {
  const progress_bar = document.querySelector(".progress-bar")

  if (progress_bar) {
    const current_question = progress_bar.dataset.current_question
  	const question_count = progress_bar.dataset.question_count
  	const progress = (current_question / question_count) * 100
  	progress_bar.style.width = progress + '%'
  	progress_bar.textContent = Math.round(progress) + '%'
  }
})
