import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="ordertime"
export default class extends Controller {
  static targets = ["timeBtn", "timeInput"];

  clickTime(e) {
    e.preventDefault();
    const btnContent = e.target.value;
    this.timeInputTarget.value = btnContent;
  }
}
