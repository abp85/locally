import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  upVote(event) {
    const target = event.target

    fetch(`/reports/${target.dataset.reportId}/upvote`, { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {

        const counter = document.getElementById(`vote-${target.dataset.reportId}`);
        counter.innerHTML = data.count;

        // const button = document.getElementById(`usrvote-${target.dataset.reportId}`)
        if ( data.vote === "up" ) {
          target.classList.remove('thumbs-inactive')
        } else {
          target.classList.add('thumbs-inactive')
        }
      });
  }

  downVote(event) {
    const target = event.target

    fetch(`/reports/${target.dataset.reportId}/downvote`, { headers: { accept: "application/json" } })
        .then(response => response.json())
        .then((data) => {

        const counter = document.getElementById(`vote-${target.dataset.reportId}`);
        counter.innerHTML = data.count;
        console.log(data)
        // const button = document.getElementById(`usrvote-${target.dataset.reportId}`)
        if ( data.vote === "down" ) {
          target.classList.remove('thumbs-inactive')
        } else {
          target.classList.add('thumbs-inactive')
        }
      });
  }
}
