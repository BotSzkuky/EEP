const jobs = [
    {
        title: "Vezeték",
        image: "img/icons8-lightning-90.png",
        location: "Miskolc",
        details:
            "Lakásomba szeretnék új villanyvezetékeket kiépíteni. Keresek egy megbízható és tapasztalt szakembert. Fontos számomra a biztonság, a minőségi munkavégzés és a szakértői tanácsadás az egész folyamat során.",
        requirements: "Várom az önök ajánlatait és ötleteit a projekt sikeressé tételéhez! Köszönöm!",
        contact: "Telefonszám: "
    },

    {
        title: "Villanykapcsoló",
        image: "img/icons8-lightning-90.png",
        location: "Salgótarján",
        details:
            "Lakásomban tervezek új villanykapcsolókat kiépíteni és néhány meglévőt cserélni. Keresek egy megbízható és tapasztalt villanyszerelőt.",
        requirements: "Kérem a jelentkezők vegyék fel velem a kapcsolatot. Köszönöm!",
        contact: "Telefonszám: "
    },

    {
        title: "Lámpa bekötés",
        image: "img/icons8-lightning-90.png",
        location: "Szolnok",
        details:
            "Házamba szeretnék új lámpát bekötni. Keresek egy megbízható és tapasztalt villanyszerelőt a munka elvégzéséhez.",
        requirements: "Akinek felkeltettem az érdeklődését az alábbi eléhetőségeken tud keresni. Köszönöm!",
        contact: "Telefonszám: "
    },

    {
        title: "Biztosíték doboz",
        image: "img/icons8-lightning-90.png",
        location: "Eger",
        details:
            "Otthonom biztonságáért keresek tapasztalt szakembereket biztosíték doboz beépítésére. ",
        requirements: "Árajánlattal vegyék fel velem a kapcsolatot. Köszönöm!",
        contact: "Telefonszám: "
    }
];

const jobsHeading = document.querySelector(".jobs-list-container h2");
const jobsContainer = document.querySelector(".jobs-list-container .jobs");
const jobSearch = document.querySelector(".jobs-list-container .job-search");

let searchTerm = "";

jobsHeading.innerHTML = `${jobs.length} villanyszerelő munka elérhető`;

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

            let deleteButton = document.createElement("button");
            deleteButton.innerText = "Törlés";
            deleteButton.classList.add("deleteButton");

            jobCard.appendChild(image);
            jobCard.appendChild(title);
            jobCard.appendChild(location);
            jobCard.appendChild(details);
            jobCard.appendChild(requirements);
            jobCard.appendChild(contact);
            jobCard.appendChild(deleteButton);

            jobsContainer.appendChild(jobCard);
        }
    });
};

createJobListingCards();

jobSearch.addEventListener("input", (e) => {
    searchTerm = e.target.value;

    createJobListingCards();
});