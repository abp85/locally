import { Controller } from "stimulus";

export default class extends Controller {
  // static targets = [ 'count' ];

  resolve(event) {
    const target = event.target
    console.log(target)
    fetch(`/reports/${target.dataset.reportId}/resolve`, { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
        const button = document.getElementById(`resolve-${target.dataset.reportId}`);
        const card = document.getElementById(`report-${target.dataset.reportId}`);
        const openedCont = document.getElementById(`opened`);
        const solvedCont = document.getElementById(`solved`);

        console.log(card)
        if (data.status === 'resolved'){
          // button.className = 'fas fa-check-square';
          openedCont.removeChild(card);
          solvedCont.insertAdjacentElement(`afterbegin`, card)
          button.innerHTML = "Mark as open"
        } else {
          // button.className = 'far fa-check-square';
          solvedCont.removeChild(card);
          openedCont.insertAdjacentElement(`afterbegin`, card)
          button.innerHTML = "Mark as solved"
        }
      });
  }

}
