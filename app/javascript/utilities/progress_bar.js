document.addEventListener('turbolinks:load', function() {
  const progress_bar = document.querySelector(".progress-bar")

  if (progress_bar) {
    new AmountProgress(progress_bar)
  }
})

class AmountProgress {
  constructor(progress_bar) {
    this.progress_bar = progress_bar
    this.amount()
  }

  amount() {
    const current_question = parseInt(this.progress_bar.dataset.currentQuestion)
    const question_count = parseInt(this.progress_bar.dataset.questionCount)
    const progress = (current_question / question_count) * 100
    this.progress_bar.style.width = progress + '%'
  }
}
