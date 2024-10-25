#Lakshay Baijal #SSD
#2024202006 Lab 9
##README.md

# Features

1. User Login Form Validation
   - Username Validation: Ensures that the username contains only alphanumeric characters. Provides immediate feedback if invalid characters are entered.
   - Password Validation: Requires the password to include at least one uppercase letter, one lowercase letter, and one number. Offers real-time validation to guide users in creating strong passwords.

2. Interactive Video Panel
   - Popup Review on Hover: Displays a concise movie review popup when the user hovers over the movie trailer video, providing additional information without navigating away from the page.
   - Resizable Video Panel: Allows users to adjust the size of the video panel using drag-and-drop functionality, offering a customizable viewing experience tailored to individual preferences.

3. Responsive Design
   - Ensures optimal viewing and interaction across various devices and screen sizes, maintaining functionality and aesthetics on desktops, tablets, and mobile devices.
   
   
   
## Questions Description

### Q1/Q2. Form Validation

#### a. Username Validation

- Purpose: Validates that the username input consists solely of alphanumeric characters.
- Logic: Utilizes a regular expression to test the input. If the input contains non-alphanumeric characters, an error message is displayed, and the input field is visually marked 
as invalid. Once the input meets the criteria, the error message is removed, and the input field is marked as valid.

#### b. Password Validation

- **Purpose:** Ensures that the password includes at least one uppercase letter, one lowercase letter, and one number.
- **Logic:** Employs a regular expression to verify the presence of the required character types. If the password does not meet the criteria, an error message is shown, and the input field is highlighted as invalid. When the password satisfies all conditions, the error message is cleared, and the input field is marked as valid.

#### c. Form Submission Handling

- **Purpose:** Manages the form submission process by ensuring all validations pass before allowing the form to be submitted.
- **Logic:** On form submission, the script checks the validity of both the username and password fields. If any validation fails, the form submission is prevented, and the respective error messages remain visible. If all validations pass, a success message is displayed, and the form can proceed to perform the desired actions, such as authenticating the user or redirecting to another page.

### Q3/Q4

- showPopup()

Purpose: Displays the popup containing the movie review.
Logic: This function sets the popup element's display property to make it visible and adjusts its opacity for a smooth fade-in effect.

### - hidePopup()

Purpose: Hides the popup when the user is no longer hovering over the video.
Logic: This function resets the popup element's opacity and hides it by changing its display property, ensuring a smooth fade-out transition.
Event Handling:

### - Mouse Events:
mouseenter: Triggers the showPopup() function when the user's cursor enters the video area.
mouseleave: Triggers the hidePopup() function when the user's cursor leaves the video area.


### - resize(event)

Purpose: Adjusts the width and height of the video container based on the user's mouse movement.
Logic: Calculates the new dimensions by determining the difference between the current mouse position and the initial position when the drag started. It ensures the new size stays within defined minimum and maximum limits to prevent the video from becoming too small or exceeding the viewport.

### - stopResize()

Purpose: Ends the resizing process when the user releases the mouse button.
Logic: Removes the event listeners for mousemove and mouseup, effectively stopping the resize operation. It also removes any visual indicators (like a resizing class) to signify the end of the resizing action.
Event Handling:

### - mousedown on Resizer Handle:
Initiates the resizing process by capturing the initial size of the video container and the mouse position. It adds event listeners for mousemove and mouseup to handle the resizing action and its termination.

### - mousemove:
Continuously calls the resize() function to adjust the video container's size as the user drags the resizer handle.

### - mouseup:
Calls the stopResize() function to finalize the new size and remove unnecessary event listeners.


