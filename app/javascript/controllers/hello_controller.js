// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['output'];

  connect() {
    this.outputTarget.textContent = 'Hello, Stimulus!';
  }
  calculateSnowball(event) {
    event.preventDefault();
    const {
      valueAsNumber: amount
    } = event.target.previousSibling.previousSibling;
    fetch(`/snowball/${amount}`)
      .then(response => response.json())
      // .then(response => console.log(response))
      .then(accounts => this.displayNewPayOff(accounts))
      .catch(error => console.log(error));
  }

  displayNewPayOff(accounts) {
    const formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 2
    });

    accounts.forEach((account, index) => {
      const el = document.querySelector(`#payoff_date-${account.id}`);
      el.innerText = account.payoff_date;
      if (index === 0) {
        document.querySelector(
          `#snowball-${account.id}`
        ).innerText = formatter.format(account.snowball);
        document.querySelector(
          `#total_payment-${account.id}`
        ).innerText = formatter.format(account.snowball + account.min_payment);
      } else {
        document.querySelector(
          `#snowball-${account.id}`
        ).innerText = formatter.format(0);
        document.querySelector(
          `#total_payment-${account.id}`
        ).innerText = formatter.format(account.min_payment);
      }
    });
  }
}
