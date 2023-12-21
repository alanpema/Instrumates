import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "pickup", "dropoff" ]

  connect() {
    const dates = this.element.dataset.notavailable.split(' ');
    let tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);

    flatpickr(this.pickupTarget, {
      minDate: "today",
      disable: dates
    }),
    flatpickr(this.dropoffTarget,
      {
        disable: dates,
        minDate: tomorrow,
        maxdate: tomorrow
      })
  }
}
