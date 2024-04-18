const jobs = [
    {
        title: "Szobafestés",
        image: "img/icons8-brush-100.png",
        location: "Budapest XVIII.",
        details:
            "Keresek valakit, aki ki tudna festeni egy szobát nekem. Szükség van a festésre, mert a falak már régiek, és frissítést igényelnek. A szoba mérete körülbelül 20 négyzetméter.",
        requirements: "Ha érdekel a munka és tudsz segíteni, kérlek, írj privát üzenetet! Köszönöm!",
        contact: "Elérhetőség: "
    },

    {
        title: "Külső festés",
        profession: "paint",
        image: "img/icons8-brush-100.png",
        location: "Kecskemét",
        details:
            "Keresek valakit, aki ki tudná festeni házam külső falait. Szükség van a festésre, mert az időjárás kicsit megviselte a falakat. A ház körülbelül 100 négyzetméter alapterületű.",
        requirements: "Ha érdekel a munka és tudsz segíteni, kérlek, írj privát üzenetet! Köszönöm!",
        contact: "Elérhetőség: "
    }
];

const jobsHeading = document.querySelector(".jobs-list-container h2");
const jobsContainer = document.querySelector(".jobs-list-container .jobs");
const jobSearch = document.querySelector(".jobs-list-container .job-search");

let searchTerm = "";

jobsHeading.innerHTML = `${jobs.length} festő munka elérhető`;

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