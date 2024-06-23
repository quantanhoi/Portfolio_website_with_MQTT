const url = 'http://16.171.21.139:3000/';



document.addEventListener('DOMContentLoaded', (event) => {
    // Fetch the skills from the server
    fetch(`${url}skill`)
        .then(response => response.json())
        .then(skills => {
            // Get the ul element
            const ul = document.getElementById('skills');
            console.log(skills);
            // Populate the ul with the skills
            skills.forEach(skill => {
                const li = document.createElement('li');
                li.textContent = skill.name;
                ul.appendChild(li);
            });
        })
        .catch(error => console.error('Error:', error));
    fetch(`${url}project`)
        .then(response => response.json())
        .then(data => {
            const projectsContainer = document.querySelector('.projects');

            // Loop through the fetched data and create projects
            data.forEach(project => {
                const projectElement = document.createElement('div');
                projectElement.classList.add('project');
                console.log(project);
                const url = new URL(project.url);
                const croppedString = url.pathname.slice(1); // remove the leading slash
                console.log(croppedString); // logs example: quantanhoi/url_alias_store

                //since await can't be used without async function, we need to wrap the code block that uses await and 
                //immediately invoke it
                (async () => {
                    const response = await fetch(`https://api.github.com/repos/${croppedString}`);
                    const data = await response.json();
                    const project_description = data.description;

                    projectElement.innerHTML = `
                        <img src="${project.icon}" alt="${project.name}">
                        <h3>${project.name}</h3>
                        <p>${project_description || 'This is the project description.'}</p>
                    `;
                    projectsContainer.appendChild(projectElement);
                    projectElement.addEventListener('click', function () {
                        window.location.href = project.url;
                    });
                })();
            });
        })
        .catch(error => console.error(error));

    fetch(`${url}contact`)
        .then(response => response.json())
        .then(data => {
            const contactContainer = document.querySelector('.contacts');
            data.forEach(contact => {
                const contactElement = document.createElement('div');
                contactElement.classList.add('contact');

                contactElement.innerHTML = `
                <h3>${contact.name}</h3>
                <p>${contact.detail}</p>
            `;
                contactContainer.appendChild(contactElement);
                if(contact.detail.substring(0,4) == "http") {
                    contactElement.addEventListener('click', function () {
                        window.location.href = contact.detail;
                    });
                }
            });
        })
        .catch(error => console.error(error));

});


