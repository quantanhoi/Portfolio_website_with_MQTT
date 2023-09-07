const url = 'http://127.0.0.1:3000/';
class mqttMessage {
    constructor(sender, recipient, message) {
        this.sender = sender;
        this.recipient = recipient;
        this.message = message;
    }
}
document.addEventListener('DOMContentLoaded', (event) => {
    // Fetch the skills from the server
    fetch(`${url}skill`)
        .then(response => response.json())
        .then(skills => {
            // Get the ul element
            const ul = document.getElementById('skills');

            // Populate the ul with the skills
            skills.forEach(skill => {
                const li = document.createElement('li');
                li.textContent = skill.name;
                ul.appendChild(li);
            });
        })
        .catch(error => console.error('Error:', error));
});


