import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["buttonElement", "backElement"]
  connect() {
    console.log("hello")
  }

  change() {
    this.backElementTarget.classList.toggle("d-none")
    console.log(this.buttonElementTarget)
  }
}
