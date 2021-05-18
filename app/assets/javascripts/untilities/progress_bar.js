document.addEventListener('turbolinks:load', () =>{
  const progress = document.getElementById('progress-line')
  if (progress) {
    let questionNumber = progress.dataset.questionNumber
    let questionAmount = progress.dataset.questionsAmount
    let valueForOneQuestion = 100/questionAmount

    progress.style.width = ((questionNumber - 1) * valueForOneQuestion) + '%'
  }
})