const videoContainer = document.querySelector(".video-container");
const popup = document.querySelector(".popup");

function showPopup() {
  popup.style.display = "block";
}

function hidePopup() {
  popup.style.display = "none";
}

videoContainer.addEventListener("mouseenter", showPopup);
videoContainer.addEventListener("mouseleave", hidePopup);
