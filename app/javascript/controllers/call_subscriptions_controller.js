import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="call-subscriptions"
export default class extends Controller {
  static values = { callId: Number, userId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CallChannel", id: this.callIdValue, user_id: this.userIdValue },
    )
  }
}
