# Pin npm packages by running ./bin/importmap

pin "application"
# pin "@hotwired/turbo-rails", to: "turbo.min.js"
# pin "@hotwired/stimulus", to: "stimulus.min.js"
# pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "app", to: "app.js"
pin "bootstrap", to: "@bootstrap.js" # @5.1.3
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "simplebar" # @6.2.7
pin "lodash-es" # @4.17.21
pin "feather-icons" # @4.29.2
pin "flatpickr" # @4.6.13
