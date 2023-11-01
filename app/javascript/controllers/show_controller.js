import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="show"
export default class extends Controller {
  static targets = [
    "showbuttonElement",
    "frontElement",
    "backElement",
    "reviewElement",
    "knownElement",
  ];
  connect() {
    console.log("hello");
    console.log(this.frontElementTarget);
  }

  reveal() {
    // Here: "show" button gone, two review options button shown
    this.frontElementTarget.classList.toggle("d-none");
    this.backElementTarget.classList.toggle("d-none");
    this.showbuttonElementTarget.classList.toggle("d-none");
    this.reviewElementTarget.classList.toggle("d-none");
    this.knownElementTarget.classList.toggle("d-none");
    // Here: two review options button gone, "show" button shown again
  }
}
