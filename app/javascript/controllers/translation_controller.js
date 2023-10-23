import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="translation"
export default class extends Controller {
  static targets = [ "input", "translatedword" ];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  translate() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const input = this.inputTarget.value;
    const url = "translate";
    fetch(url, {method: "POST", headers: { "X-CSRF-Token": csrfToken ,"Accept" : "text/plain", body: {translation: input}}})
      .then(response => response.text())
      .then((data) => {
        this.translatedwordTarget.innerHTML = data;
      });
  }

}
