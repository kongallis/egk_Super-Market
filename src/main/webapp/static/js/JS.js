const firstname = document.getElementById("firstName")
const lastname = document.getElementById("lastName")
const form = document.getElementById("form")
const errorElement = document.getElementById("error")

form.addEventListener("submit", (e) => {
    let messages = []
    var letters = /^[a-zA-Z]+$/;
    if ((!firstName.value.match(letters)) && ((firstName.value !== null) && (firstName.value !== ''))
            || (!lastName.value.match(letters)) && ((lastName.value !== null) && (lastName.value !== ''))) {
        e.preventDefault();
        messages.push("Invalid characters for fields First Name or Last Name ")
        errorElement.innerText = messages
    }
})
      Ï