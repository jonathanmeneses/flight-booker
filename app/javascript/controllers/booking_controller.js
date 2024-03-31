import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["passenger"]

    addPassenger(event) {
        event.preventDefault();


        //Count number of passengers
        let passengerCount = this.passengerTargets.length


        //Clone first passenger fields
        let newPassenger = this.passengerTarget.cloneNode(true);

        //clear input fields on clonded passenger
        newPassenger.querySelectorAll('input').forEach(input => input.value = '');


        // Update name attribute to include new index
        newPassenger.querySelectorAll('input').forEach(input => {
            input.name = input.name.replace('[0]', `[${passengerCount}]`);
            input.id = input.id.replace('_0_', `_${passengerCount}_`);
        })
        newPassenger.querySelectorAll('label').forEach(label => {
            label.htmlFor = label.htmlFor.replace('_0_', `_${passengerCount}_`);
        })


        // Update title header to count the passenger correctly
        newPassenger.querySelector('h1').innerHTML = `Passenger ${passengerCount + 1}`

        // Apend cloned passenger to form
        this.passengerTarget.parentNode.appendChild(newPassenger)
    }

    removePassenger(event) {
        event.preventDefault();

        // Get passenger fields 
        let passengers = this.passengerTargets;

        // remove passenger if there's more than one
        if (passengers.length > 1) {
            event.target.closest('.passenger-fields').remove();
        }
    }
}
