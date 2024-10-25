// script.js

// Select the resizer and video container elements
const resizer = document.getElementById("resizer");
const videoContainer = document.getElementById("videoContainer");
const popup = document.getElementById("videoPopup");
const logoutButton = document.getElementById("logoutButton");

// Variables to store initial positions and sizes
let original_width = 0;
let original_height = 0;
let original_mouse_x = 0;
let original_mouse_y = 0;

// Function to show the popup on hover
function showPopup() {
  popup.style.display = "block";
  setTimeout(() => {
    popup.style.opacity = "1";
  }, 10); // Slight delay to allow transition
}

// Function to hide the popup when not hovering
function hidePopup() {
  popup.style.opacity = "0";
  setTimeout(() => {
    popup.style.display = "none";
  }, 300); // Match the CSS transition duration
}

// Event listeners for showing and hiding the popup
videoContainer.addEventListener("mouseenter", showPopup);
videoContainer.addEventListener("mouseleave", hidePopup);

// Function to handle mousedown on the resizer
resizer.addEventListener("mousedown", function (e) {
  e.preventDefault();
  // Store the current sizes and mouse positions
  original_width = parseFloat(
    getComputedStyle(videoContainer, null)
      .getPropertyValue("width")
      .replace("px", "")
  );
  original_height = parseFloat(
    getComputedStyle(videoContainer, null)
      .getPropertyValue("height")
      .replace("px", "")
  );
  original_mouse_x = e.pageX;
  original_mouse_y = e.pageY;

  // Add event listeners for mousemove and mouseup on the document
  document.addEventListener("mousemove", resize);
  document.addEventListener("mouseup", stopResize);

  // Optionally, add a class to indicate resizing
  videoContainer.classList.add("resizing");
});

// Function to handle mousemove and resize the video container
function resize(e) {
  const width = original_width + (e.pageX - original_mouse_x);
  const height = original_height + (e.pageY - original_mouse_y);

  // Set minimum and maximum sizes
  const minWidth = 300;
  const minHeight = 200;
  const maxWidth =
    window.innerWidth - videoContainer.getBoundingClientRect().left - 20; // 20px padding from window
  const maxHeight =
    window.innerHeight - videoContainer.getBoundingClientRect().top - 20;

  // Apply constraints
  if (width > minWidth && width < maxWidth) {
    videoContainer.style.width = width + "px";
  }
  if (height > minHeight && height < maxHeight) {
    videoContainer.style.height = height + "px";
  }
}

// Function to handle mouseup and stop resizing
function stopResize() {
  document.removeEventListener("mousemove", resize);
  document.removeEventListener("mouseup", stopResize);

  // Remove the resizing class
  videoContainer.classList.remove("resizing");
}

// Optional: Logout confirmation
logoutButton.addEventListener("click", function (e) {
  const confirmLogout = confirm("Are you sure you want to logout?");
  if (confirmLogout) {
    // Redirect to the login page or perform logout actions
    window.location.href = "index.html";
  }
});
