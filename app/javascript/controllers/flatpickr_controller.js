import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(".basic", {
      dateFormat: "Y-m-d",
    });
  }
}
