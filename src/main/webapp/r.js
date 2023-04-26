function togglePasswordVisibility() {
  var passwordInput = document.getElementById("password");
  var passwordToggleBtn = document.querySelector(".password-toggle-btn");
  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    passwordToggleBtn.innerHTML = '<span class="icon">&#x1f441;</span>';
  } else {
    passwordInput.type = "password";
    passwordToggleBtn.innerHTML = '<span class="icon">&#x1f576;</span>';
  }
}

function clearForm() {
  document.getElementById("name").value = "";
  document.getElementById("email").value = "";
  document.getElementById("password").value = "";
  document.getElementById("phone").value = "";
  document.getElementById("course").selectedIndex = 0;
  document.getElementById("batch").value = "";
}
/**
 * 
 */