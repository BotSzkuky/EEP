const jobs = [
    {
        title: "Gázvezeték kiépítés",
        image: "img/icons8-gas-100.png",
        location: "Esztergom",
        details:
            "Lakásomba szeretnék gázvezetéket kiépíteni a konyhában és a fűtési rendszerhez. Fontos számomra a biztonság, a minőségi munkavégzés és a szakértői tanácsadás az egész folyamat során.",
        requirements: "Várom az önök ajánlatait és ötleteit a projekt sikeressé tételéhez! Köszönöm!",
        contact: "Elérhetőség: "
    }
];

const jobsHeading = document.querySelector(".jobs-list-container h2");
const jobsContainer = document.querySelector(".jobs-list-container .jobs");
const jobSearch = document.querySelector(".jobs-list-container .job-search");

let searchTerm = "";

jobsHeading.innerHTML = `${jobs.length} gázszerelő munka elérhető`;

const createJobListingCards = () => {
    jobsContainer.innerHTML = "";

    jobs.forEach((job) => {
        if (job.title.toLowerCase().includes(searchTerm.toLowerCase())) {
            let jobCard = document.createElement("div");
            jobCard.classList.add("job");

            let image = document.createElement("img");
            image.src = job.image;

            let title = document.createElement("h3");
            title.innerHTML = job.title;
            title.classList.add("job-title");

            let location = document.createElement("div");
            location.innerHTML = job.location;
            location.classList.add("location");

            let details = document.createElement("div");
            details.innerHTML = job.details;
            details.classList.add("details");

            let requirements = document.createElement("div");
            requirements.innerHTML = job.requirements;
            requirements.classList.add("requirements");

            let contact = document.createElement("div");
            contact.innerHTML = job.contact;
            contact.classList.add("contact");

            jobCard.appendChild(image);
            jobCard.appendChild(title);
            jobCard.appendChild(location);
            jobCard.appendChild(details);
            jobCard.appendChild(requirements);
            jobCard.appendChild(contact);

            jobsContainer.appendChild(jobCard);
        }
    });
};

createJobListingCards();

jobSearch.addEventListener("input", (e) => {
    searchTerm = e.target.value;

    createJobListingCards();
});