import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


// let this_month_back_sum = gon.this_month_back_sum
// $('#this_month_back_sum').html(this_month_back_sum);


