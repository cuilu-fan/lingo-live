import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashcard-categories"
export default class extends Controller {
  static targets = [ "searchBox", "suggestions",  ];
  static values = { category: Array };

  showSuggestions() {
    this.categories = this.categoryValue;
    const input = this.searchBoxTarget.value.toLowerCase();
    this.suggestionsTarget.innerHTML = '';
    if (input.length === 0) {
      this.suggestionsTarget.style.display = 'none';
      return;
    }
    const filteredItems = this.categories.filter(item => item.toLowerCase().includes(input));
    if (filteredItems.length > 0) {
      filteredItems.forEach(item => {
        const listItem = document.createElement('li');
        listItem.textContent = item;
        listItem.addEventListener('click', () => {
          this.searchBoxTarget.value = item;
          this.suggestionsTarget.style.display = 'none';
        });
        this.suggestionsTarget.appendChild(listItem);
      });
      this.suggestionsTarget.style.display = 'block';
    } else {
      this.suggestionsTarget.style.display = 'none';
    }
  }

  hideSuggestions(e) {
    if (e.target !== this.searchBoxTarget) {
      this.suggestionsTarget.style.display = 'none';
    }
  }
}
