// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .

const handelRequest = e => {
  const answerId = e.target.parentElement.id;

  let count = document.querySelector(`#vote-${answerId}`).innerHTML;
  count = e.target.id == "up" ? parseInt(count) + 1 : parseInt(count) - 1;

  const url = `/answers/${answerId}/vote`;

  fetch(url, {
    method: "PUT",
    body: JSON.stringify({ answer: { vote: count } }),
    headers: {
      "Content-Type": "application/json"
    }
  })
    .then(
      res => (document.querySelector(`#vote-${answerId}`).innerHTML = count)
    )
    .catch(error => console.error("Error:", error));
};

const votes = document.querySelectorAll(".vote");

votes.forEach(vote => {
  vote.addEventListener("click", handelRequest);
});
