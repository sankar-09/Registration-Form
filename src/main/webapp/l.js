/* JavaScript for the Code Creaters Login Form */

function togglePassword() {
var passwordInput = document.getElementById("password");
var passwordToggle = document.querySelector(".password-toggle");
if (passwordInput.type === "password") {
passwordInput.type = "text";
passwordToggle.innerHTML = '<i class="far fa-eye-slash"></i>';
} else {
passwordInput.type = "password";
passwordToggle.innerHTML = '<i class="far fa-eye"></i>';
}
}

function previousForm() {
window.history.back();
}

function nextForm() {
window.history.forward();
}

document.addEventListener("DOMContentLoaded", function(event) {
var form = document.querySelector("form");
form.classList.add("animated");
form.classList.add("fadeIn");
});