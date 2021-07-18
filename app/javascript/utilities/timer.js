export class Timer {

  constructor(element, second) {
  	this.element = element
  	this.second = second
  	this.setup()
  }

  setup() {
  	this.id = setInterval(() => this.editTime(), 1000)
  }

  editTime() {
  	if (this.second <= 0){
  	  clearInterval(this.id)
  	  document.forms.test_passage.submit()
  	} else {
  	  this.element.innerHTML = Math.floor(this.second / 60) + ":" + Math.floor(this.second % 60)
  	  this.second--
  	}
  }
}
