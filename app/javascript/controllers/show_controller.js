import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show"
export default class extends Controller {
  static targets = [
    "showbuttonElement",
    "frontElement",
    "backElement",
    "reviewElement",
    "knownElement",
    "flashcard",
  ];
  connect() {
    console.log("hello");
    console.log(this.frontElementTarget);
  }

  reveal() {
    // Here: "show" button gone, two review options button shown
    // const card = this.flashcardTarget;
    // const front = card.querySelector("primary-side");
    // const back = card.querySelector("translated-side");
    // front.classList.toggle("flashcard")
    this.frontElementTarget.classList.toggle("d-none");
    this.backElementTarget.classList.toggle("d-none");
    this.showbuttonElementTarget.classList.toggle("d-none");
    this.reviewElementTarget.classList.toggle("d-none");
    this.knownElementTarget.classList.toggle("d-none");
    // Here: two review options button gone, "show" button shown again
  }
}
