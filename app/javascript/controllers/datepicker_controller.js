import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";


export default class extends Controller {
static targets = [ 'startDateInput', 'endDateInput', 'days', 'price' ]
connect() {
  flatpickr(this.startDateInputTarget, {
    "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
  })}
  display_price() {
    const start_date = new Date(this.startDateInputTarget.value);
    const end_date = new Date(this.endDateInputTarget.value);
    const total_day = (end_date - start_date) / (1000 * 3600 * 24);
    if (total_day >= 1) {
      console.log(total_day);
      const price = this.priceTarget.innerText;
      const total_price = price*total_day;
      this.daysTarget.innerHTML = `You are booking <strong>${total_day}</strong> days for <strong>${total_price}</strong> €`;

    }
  }
}
