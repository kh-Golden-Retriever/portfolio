$(function () {
  let height = $("#header").height();
  let vh = window.innerHeight * 0.01;
  $("#sidebar").css({ height: vh * 100 - height });
});
