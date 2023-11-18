// Import necessary modules
import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // Initialize Flatpickr for start_date and end_date inputs
    this.initFlatpickr("start_date");
    this.initFlatpickr("end_date");
  }

  initFlatpickr(target) {
    const input = this.targets.find(target);

    flatpickr(input, {
      minDate: "today",
      altInput: true,
      altFormat: "M j, Y",
      dateFormat: "Y-m-d",
    });
  }
}
