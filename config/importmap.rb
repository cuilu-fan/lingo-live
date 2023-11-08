# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@rails/actioncable", to: "https://cdn.jsdelivr.net/npm/@rails/actioncable@7.1.1/app/assets/javascripts/actioncable.esm.js"
# pin "@vonage", to: "https://static.opentok.com/v2/js/opentok.min.js", preload: true
pin "@opentok/client", to: "https://ga.jspm.io/npm:@opentok/client@2.26.3/dist/js/opentok.js"
pin "countup.js", to: "https://ga.jspm.io/npm:countup.js@2.8.0/dist/countUp.min.js"
