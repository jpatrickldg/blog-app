// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
Turbo.session.drive = false
import "controllers"
import "trix"
import "@rails/actiontext"

let menuButton = document.querySelector('.mobile-menu-button')
let navbar = document.querySelector('.mobile-navbar')

menuButton.addEventListener('click', () => {
  navbar.classList.toggle('-translate-x-full');
})