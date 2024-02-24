/**
 * 
 */
function validatePassword(event) {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords and confirm password must be same");
            event.preventDefault(); 
        }
    }

    function goToRegisterPage() {
        window.location.href = "registration.jsp"; // Redirect to register.jsp
    }