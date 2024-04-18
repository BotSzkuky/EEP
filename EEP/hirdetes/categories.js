const jobs = [
    {
        title: "Festés",
        image: "img/icons8-brush-100.png",
        details:
            "Felületek bevonása festékkel vagy más bevonatokkal a dekoráció, védelem vagy más funkcionális célok érdekében.",
        openPositions: "2",
        link: "paint.php",
    },

    {
        title: "Vízszerelés",
        image: "img/icons8-water-100.png",
        details:
            "Vízvezeték-rendszer kiépítése és karbantartása a házakban vagy épületekben.",
        openPositions: "3",
        link: "water.php",
    },

    {
        title: "Gázszerelés",
        image: "img/icons8-gas-100.png",
        details:
            "Épületekben vagy más létesítményekben a gázellátás biztosítására szolgáló rendszerek telepítése, karbantartása és javítása.",
        openPositions: "1",
        link: "gas.php",
    },

    {
        title: "Villanyszerelés",
        image: "img/icons8-lightning-90.png",
        details:
            "Elektromos rendszerek telepítése, karbantartása és javítása.",
        openPositions: "4",
        link: "lightning.php",
    }
];

const jobsHeading = document.querySelector(".jobs-list-container h2");
const jobsContainer = document.querySelector(".jobs-list-container .jobs");
const jobSearch = document.querySelector(".jobs-list-container .job-search");

let searchTerm = "";

jobsHeading.innerHTML = `${jobs.length} kategória elérhető`;

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

            let details = document.createElement("div");
            details.innerHTML = job.details;
            details.classList.add("details");

            let detailsBtn = document.createElement("a");
            detailsBtn.href = job.link;
            detailsBtn.innerHTML = "Ajánlatok";
            detailsBtn.classList.add("details-btn");

            let openPositions = document.createElement("span");
            openPositions.classList.add("open-positions");

            if (job.openPositions == 1) {
                openPositions.innerHTML = `${job.openPositions} Munka`;
            } else {
                openPositions.innerHTML = `${job.openPositions} Munkák`;
            }

            jobCard.appendChild(image);
            jobCard.appendChild(title);
            jobCard.appendChild(details);
            jobCard.appendChild(detailsBtn);
            jobCard.appendChild(openPositions);

            jobsContainer.appendChild(jobCard);
        }
    });
};

createJobListingCards();

jobSearch.addEventListener("input", (e) => {
    searchTerm = e.target.value;

    createJobListingCards();
});