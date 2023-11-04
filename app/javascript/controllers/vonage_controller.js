import { Controller } from "@hotwired/stimulus"
import { OT } from '@opentok/client';

// Connects to data-controller="vonage"
export default class extends Controller {
  connect() {
    this.apiKey = this.data.get("apiKey")
    // debugger
    this.sessionId = this.data.get("sessionId")
    this.token = this.data.get("token")
    this.initializeSession()
  }

  desconect() {
    if (this.session) {
      this.session.disconnect();
    }
  }

  initializeSession() {
    console.log('OT:', OT); // Check if OT is defined
    console.log('apiKey:', this.apiKey); // Check if apiKey is defined
    console.log('sessionId:', this.sessionId);
    
    this.session = OT.initSession(this.apiKey, this.sessionId);
    this.session.on("streamCreated", this.streamCreated.bind(this));
    this.publisher = OT.initPublisher(this.element, {
      insertMode: "append",
      width: "100%",
      height: "100%",
      name: this.data.get("name")
    }, this.handleError.bind(this));
    this.session.connect(this.token,this.streamConnected.bind(this));
  }

  streamConnected(error) {
    if (error) {
      this.handleError(error);
    } else {
      this.session.publish(this.publisher, this.handleError.bind(this));
    }
  }

  streamCreated(event) {
    this.session.subscribe(event.stream, this.element, {
      insertMode: "append",
      width: "100%",
      height: "100%"
    }, this.handleError.bind(this));
  }
  handleError(error) {
    if (error) {
      console.error(error.message);
    }
  }
}
