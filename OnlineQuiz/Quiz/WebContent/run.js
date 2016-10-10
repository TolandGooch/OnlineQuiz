window.addEventListener('load', function() {
  restModule.ajax("GET", "http://localhost:8080/Quiz/api/quiz/", function(request) {
    if (request.readyState === 4 && request.status < 400) {
      var data = JSON.parse(request.responseText);
      restModule.tableBuilder(data,"data-table");
    }
  });
});