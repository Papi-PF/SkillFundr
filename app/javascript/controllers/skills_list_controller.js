import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["skill"]

  highlight(event) {
    // Remove all active classes first
    document.querySelectorAll('.skill-link').forEach(link => {
      link.classList.remove('active-highlight');
    });

    // Add to clicked element only
    event.currentTarget.classList.add('active-highlight');
  }
}
