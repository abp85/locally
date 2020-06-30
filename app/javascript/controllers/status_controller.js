import { Controller } from "stimulus";

export default class extends Controller {
  // static targets = [ 'count' ];

  resolve(event) {
    const target = event.target
    fetch(`/reports/${target.dataset.reportId}/resolve`, { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {
        const button = document.getElementById(`resolve-${target.dataset.reportId}`);
        if (data.status === 'resolved'){
          button.className = 'fas fa-check-square';
        } else {
          button.className = 'far fa-check-square';
        }
        console.log(button)
        console.log(data)
      });
  }

}
