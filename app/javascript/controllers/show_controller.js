import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["buttonElement", "frontElement", "backElement", "reviewElement", "review2Element"]
  connect() {
    console.log("hello")
    console.log(this.frontElementTarget)
  }

  change() {
    // Here: "show" button gone, two review options button shown
    this.backElementTarget.classList.toggle("d-none")
    this.buttonElementTarget.classList.add("d-none")
    this.reviewElementTarget.classList.remove("d-none")
    this.review2ElementTarget.classList.remove("d-none")
    // Here: two review options button gone, "show" button shown again

  }

  next(){
     // Here: two review options button gone, "show" button shown again
    this.reviewElementTarget.classList.toggle("d-none")
    this.review2ElementTarget.classList.toggle("d-none")
    this.backElementTarget.classList.toggle("d-none")
    this.buttonElementTarget.classList.toggle("d-none")
  }

  increment() {
    console.log(this.frontElementTarget)
  }
}
