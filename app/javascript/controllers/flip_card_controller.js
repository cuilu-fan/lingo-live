import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["flip"];

  flipCard(event) {
    const flashcard = event.currentTarget;
    const front = flashcard.querySelector(".flashcard-front");
    const back = flashcard.querySelector(".flashcard-back");

    front.classList.toggle("flip");
    back.classList.toggle("flip");
  }
}
