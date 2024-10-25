const usernameInput = document.getElementById("username");
const usernameError = document.getElementById("usernameError");
const loginForm = document.getElementById("loginForm");

// Function to validate alphanumeric characters
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

// Add event listener for real-time validation
usernameInput.addEventListener("input", validateUsername);

// Handle form submission
loginForm.addEventListener("submit", function (event) {
  if (!validateUsername()) {
    event.preventDefault(); // Prevent form submission if invalid
  } else {
    alert("Login successful!");
    // Optional: Handle login logic or redirect
  }
});
