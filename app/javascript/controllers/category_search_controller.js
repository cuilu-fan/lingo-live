import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-search"
export default class extends Controller {
  static targets = [ "searchBox", "suggestions" ];
  categories = ["Household", "Animals", "Food", "Furniture",];

  showSuggestions() {
    const input = this.inputTarget.value.toLowerCase();
    this.suggestionsTarget.innerHTML = '';
    if (input.length === 0) {
      this.suggestionsTarget.style.display = 'none';
      return;
  }
  const filteredItems = this.items.filter(item => item.toLowerCase().includes(input));
        if (filteredItems.length > 0) {
            filteredItems.forEach(item => {
                const listItem = document.createElement('li');
                listItem.textContent = item;
                listItem.addEventListener('click', () => {
                    this.inputTarget.value = item;
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
      if (e.target !== this.inputTarget) {
          this.suggestionsTarget.style.display = 'none';
      }
  }

}
