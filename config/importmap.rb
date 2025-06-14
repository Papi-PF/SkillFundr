# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "swiper", to: "https://ga.jspm.io/npm:swiper@11.0.5/swiper.esm.js"
pin "swiper/css/bundle", to: "https://ga.jspm.io/npm:swiper@11.0.5/swiper-bundle.min.css"
