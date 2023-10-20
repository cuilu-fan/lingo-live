import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-hover"
export default class extends Controller {
  static targets = ["hover", "popupContainer", "wordInput", "boxSearch"];

  changeColor() {
    this.hoverTarget.classList.remove("home-btn");
    this.hoverTarget.classList.add("home-btn2");

    this.togglePopup();

    setTimeout(() => {
      this.resetStyle();
    }, 1000);
  }

  togglePopup() {
    this.popupContainerTarget.style.display = "block";
  }

  resetStyle() {
    this.hoverTarget.classList.remove("home-btn2");
    this.hoverTarget.classList.add("home-btn");
  }

  continue() {
    this.popupContainerTarget.style.display = "none";
  }

  resetInputs() {
    this.wordInputTarget.value = "";
    this.boxSearchTarget.value = "";
  }
}
