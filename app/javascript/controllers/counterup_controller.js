import { Controller } from "@hotwired/stimulus";
import { CountUp } from "countup.js";

// Connects to data-controller="counterup"
export default class extends Controller {
  static targets = ["practice"];

  connect() {
    console.log(this.element);
    this.options = { duration: 10 };
    this.countup = new CountUp(this.practiceTarget, 66, this.options);
    this.count2 = this.countup.start();
  }
}
