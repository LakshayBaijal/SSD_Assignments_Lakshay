// Select DOM elements
const usernameInput = document.getElementById("username");
const usernameError = document.getElementById("usernameError");
const passwordInput = document.getElementById("password");
const passwordError = document.getElementById("passwordError");
const loginForm = document.getElementById("loginForm");

// Function to validate alphanumeric username
function validateUsername() {
  const value = usernameInput.value;
  const isValid = /^[a-zA-Z0-9]*$/.test(value);
  if (!isValid) {
    usernameError.textContent = "Only alphanumeric characters are allowed.";
    return false;
  } else {
    usernameError.textContent = "";
    return true;
  }
}

// Function to validate password
function validatePassword() {
  const value = passwordInput.value;
  // Regex to check at least one lowercase, one uppercase, and one number
  const isValid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/.test(value);
  if (!isValid) {
    passwordError.textContent =
      "Password must include at least one uppercase letter, one lowercase letter, and one number.";
    return false;
  } else {
    passwordError.textContent = "";
    return true;
  }
}

// Add event listeners for real-time validation
usernameInput.addEventListener("input", validateUsername);
passwordInput.addEventListener("input", validatePassword);

// Handle form submission
loginForm.addEventListener("submit", function (event) {
  const isUsernameValid = validateUsername();
  const isPasswordValid = validatePassword();

  if (!isUsernameValid || !isPasswordValid) {
    event.preventDefault(); // Prevent form submission if invalid
  } else {
    alert("Login successful!");
    // Optionally, handle login logic or redirect
    // window.location.href = 'dashboard.html';
  }
});
