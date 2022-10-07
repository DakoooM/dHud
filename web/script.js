window.addEventListener("load", () => {
    const Job = document.getElementById("job_name");
    const Orga = document.getElementById("org_name");
    const container = document.querySelector(".container");

    console.log("(rghr(thythjytjhy");

    window.addEventListener("message", (e) => {
        let event = e.data;

        console.log("couocou", event);

        if (event.type === "setData") {
            Job.innerText = (event.Job ? event.Job : Job.innerText);
            Orga.innerText = (event.Orga ? event.Orga : Orga.innerText);
        } else if (event.type === "show"){
            console.log("dcocucou")
            if (event.show === true){
                container.classList.remove("hide");
            } else if (event.show === false) {
                container.classList.add("hide");
            }
        }
    })
})