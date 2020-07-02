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
        const pill = document.getElementById(`changestatus-${target.dataset.reportId}`);
        const openedCont = document.getElementById(`opened`);
        const solvedCont = document.getElementById(`solved`);
        const openReports = document.getElementById('open-reports');
        const solvedReports = document.getElementById('solved-reports');
        let cardNotif
        if (data.status === 'resolved'){
          cardNotif = document.getElementById(`card-notification-open`);
          // button.className = 'fas fa-check-square';
          cardNotif.innerHTML = ""
          cardNotif.style.opacity = 1
          cardNotif.className = "pill-category"
          openedCont.removeChild(card);
          solvedCont.insertAdjacentElement(`afterbegin`, card)
          button.innerHTML = "Mark as open"
          pill.className = "pill-status-solved"
          pill.innerHTML = "solved"
          cardNotif.innerHTML = "Moved to Solved"
        } else {
          // button.className = 'far fa-check-square';
          cardNotif = document.getElementById(`card-notification-solved`);
          cardNotif.innerHTML = ""
          cardNotif.style.opacity = 1
          cardNotif.className = "pill-category"
          solvedCont.removeChild(card);
          openedCont.insertAdjacentElement(`afterbegin`, card)
          button.innerHTML = "Mark as solved"
          pill.className = "pill-status-open"
          pill.innerHTML = "pending"
          cardNotif.innerHTML = "Moved to Open"
        }

        openReports.innerHTML = data.user_open_reports
        solvedReports.innerHTML = data.user_solved_reports

        setTimeout(() => {
          cardNotif.style.opacity = 0
        }, 4000)
        // setTimeout(() => {
        // }, 5000)
      });
  }

}
