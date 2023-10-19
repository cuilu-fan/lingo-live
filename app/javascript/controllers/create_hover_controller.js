import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-hover"
export default class extends Controller {
  static targets = ["hover"];

  changeColor() {
    this.hoverTarget.classList.remove("home-btn");
    this.hoverTarget.classList.add("home-btn2");
  }
}
