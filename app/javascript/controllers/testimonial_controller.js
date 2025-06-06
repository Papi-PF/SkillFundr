import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper'
import 'swiper/css/bundle'

// Connects to data-controller="testimonial"
export default class extends Controller {
  connect() {
    this.swiper = new Swiper(this.element, {
      // Core parameters
      loop: true,
      slidesPerView: 1,
      spaceBetween: 30,
      centeredSlides: true,
      autoHeight: true,

      // Autoplay
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },

      // Pagination
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        dynamicBullets: true,
      },

      // Navigation
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // Responsive breakpoints
      breakpoints: {
        768: { slidesPerView: 2, centeredSlides: false },
        1200: { slidesPerView: 3, centeredSlides: false }
      }
    })
  }

  disconnect() {
    this.swiper.destroy()
  }
}
