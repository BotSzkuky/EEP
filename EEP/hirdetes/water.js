const jobs = [
    {
        title: "Csővezeték karbantartás",
        image: "img/icons8-water-100.png",
        location: "Debrecen",
        details:
            "Keresek megbízható és tapasztalt szakembert a csővezetékeim karbantartásához. A hétköznapi lakásban található mosdó, konyha és fürdőszoba csövek tisztítását, ellenőrzését és szükség esetén javítását szeretném kérni.",
        requirements: "Ha érdekel a munka, kérem vegye fel velem a kapcsolatot. Köszönöm!",
        contact: "Telefonszám: "
    },

    {
        title: "Kazán kiépítés",
        image: "img/icons8-water-100.png",
        location: "Budapest II.",
        details:
            "Lakásomba szeretnék egy új kazánt kiépíteni, és keresek egy megbízható, tapasztalt szakembert, aki segíthet ebben a projektben. Az új kazán az otthon fűtését és melegvíz ellátását fogja biztosítani.",
        requirements: "Ajánlatokat és árajánlatokat kérnék a munka elvégzésére, valamint egy rövid bemutatkozó levéllel és referenciával várom a jelentkezéseket. Köszönöm!",
        contact: "Telefonszám: "
    },

    {
        title: "Csaptelep kiépítés",
        image: "img/icons8-water-100.png",
        location: "Siófok",
        details:
            "Házamban szeretnék néhány új csaptelepet kiépíteni a konyhában és a fürdőszobában. Keresek egy megbízható és tapasztalt szakembert, aki segíthet ebben a projekten. Az új csaptelepek a mindennapi használat során kényelmes és hosszú élettartamúak legyenek.",
        requirements: "Ha érdekel a munka és tudsz segíteni, kérlek, írj privát üzenetet! Köszönöm!",
        contact: "Telefonszám: "
    }
];

const jobsHeading = document.querySelector(".jobs-list-container h2");
const jobsContainer = document.querySelector(".jobs-list-container .jobs");
const jobSearch = document.querySelector(".jobs-list-container .job-search");

let searchTerm = "";

jobsHeading.innerHTML = `${jobs.length} vízszerelő munka elérhető`;

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