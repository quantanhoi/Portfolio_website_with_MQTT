
document.addEventListener('DOMContentLoaded', (event) => {
    // Fetch the skills from the server
    fetch('http://127.0.0.1:3000/skill')
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
