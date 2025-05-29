import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="skills-list"
export default class extends Controller {
 static targets = ["skill"]

  highlight(event) {
    this.skillTargets.forEach((skill) => {
      skill.classList.remove("active")
    });
    event.currentTarget.classList.add("active");
  }
}
