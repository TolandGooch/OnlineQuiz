addEventListener('load', function() {
	console.log('LOADED');
});

var restModule = (function() {
	var module = {};
	module.tableBuilder = function(dataArr, location) {
		var table = document.createElement("table");
		
		table.appendChild(createTableHeader(dataArr[0]));
		table.appendChild(createTableBody(dataArr));

		var containerDiv = document.getElementById(location);
		containerDiv.appendChild(table);
		
		createForm();
	};
	
	var createForm = function(){
		var createBtn = document.createElement('button');
		createBtn.id = "create";
		createBtn.textContent = " Create Quiz ";
		document.body.appendChild(createBtn);
		createBtn.addEventListener('click', function(e){
			// removes button
        	document.body.removeChild(createBtn);
        	// removes table
        	var table = document.getElementById('data-table');
        	table.parentElement.removeChild(table);
        	
        	// changes h1 text
        	var header = document.getElementsByTagName('h1');
        	var newHeader = document.createElement('h1');
        	header.appendChild(document.createTextNode('Greaat'));
        	header[0].parentElement.replaceChild(newHeader,header[0]);
        	document.write('newHeader');
        	
        	var h1 = document.createElement('h1');
            h1.textContent = "Create Quiz";
            document.body.appendChild(h1);
            
        	var hr = document.createElement('hr');
        	document.body.appendChild(hr); 
        		
		});
		return createBtn;
	};
	
	var createBtn = function(dataObj) {
	};

	var createTableHeader = function(dataObj) {
		var thead = document.createElement("thead");
		var headRow = document.createElement("tr");
		console.log(dataObj);
		var th = document.createElement("th");
		th.textContent = " Name ";
		thead.appendChild(th);
		var th2 = document.createElement("th");
		th2.textContent = " View ";
		thead.appendChild(th2);
		var th3 = document.createElement("th");
		th3.textContent = " Take ";
		thead.appendChild(th3);
		var th4 = document.createElement("th");
		th4.textContent = " Edit ";
		thead.appendChild(th4);
		var th5 = document.createElement("th");
		th5.textContent = " Delete ";
		thead.appendChild(th5);
		thead.appendChild(headRow);
		return thead;
	};

	var createTableBody = function(dataArr) {
		var tbody = document.createElement("tbody");
		dataArr.forEach(function(data, index, arr) {
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			td.textContent = data.name;
			tr.appendChild(td);
			tr.appendChild(viewQuiz(data));
			tr.appendChild(takeQuiz(data));
			tr.appendChild(editQuiz(data));
			tr.appendChild(deleteQuiz(data));
			tbody.appendChild(tr);
		});
		return tbody;
	};

	var viewQuiz = function(dataObj) {
		var td = document.createElement("td");
		var viewBtn = document.createElement("button");
		viewBtn.setAttribute("name", dataObj.name);
		viewBtn.textContent = " View ";

		viewBtn.addEventListener('click', function(e) {
			var quiz = e.target.getAttribute("quiz");
			console.log(e.target);
			module.ajax("GET", "http://localhost:8080/Quiz/api/quiz/" + name,
					function() {
						// do something when data comes back
						console.log(e.target);
					})
		});
		td.appendChild(viewBtn);
		return td;
	};

	// stuff needs to be added
	var takeQuiz = function(dataObj) {
		var td = document.createElement("td");
		var takeBtn = document.createElement("button");
		takeBtn.setAttribute("name", dataObj.name);
		takeBtn.textContent = " Take ";

		takeBtn.addEventListener('click', function(e) {
			var quiz = e.target.getAttribute("quiz");
			console.log(name);
			module.ajax("GET", "http://localhost:8080/Quiz/api/quiz/" + name,
					function() {
						// do something when data comes back
						console.log(name);
					})
		});
		td.appendChild(takeBtn);
		return td;
	};
	
	var editQuiz = function(dataObj) {
		var td = document.createElement("td");
		var editBtn = document.createElement("button");
		editBtn.setAttribute("quiz_id", dataObj.id);
		editBtn.textContent = " Edit ";

		editBtn.addEventListener('click', function(e) {
			var quiz_id = e.target.getAttribute("quiz_id");
			console.log(e.target.parentElement.parentElement);
			
//			var obj = {odject};
//			var jsonString = JSON.stringify(obj);
			module.ajax("POST", "http://localhost:8080/Quiz/api/quiz" + quiz_id,
					function(req) {
				if(req.status < 400 && req.readyState === 4) {
						// do something when data comes back
					var quizToEdit = document.getElementById(quiz_id);
					var showTextContent = quizToEdit.textContent;
					
					// Show the content of the quiz to be edited
					var message = '<p>textContent : ' + showTextContent + '</p>';
				
					// new quiz name will be user's input
					quizToEdit.textContent = 'stuff';
//						var quizRow = e.target.parentElement.parentElement;
//						console.log(quizRow);
//						quizRow.parentElement.replaceChild(quizRow);
//				
//						console.log(e.target);
				}
			})
		});
		td.appendChild(editBtn);
		return td;
	};
	
	var deleteQuiz = function(dataObj) {
		var td = document.createElement("td");
		var delBtn = document.createElement("button");
		delBtn.setAttribute("quiz_id", dataObj.id);
		delBtn.textContent = " Delete ";

		delBtn.addEventListener('click', function(e) {
			var quiz_id = e.target.getAttribute("quiz_id");
//			console.log(e.target);
			module.ajax("DELETE", "http://localhost:8080/Quiz/api/quiz/" + quiz_id,
					function(req) {
				if(req.status < 400 && req.readyState === 4) {
						// do something when data comes back
						var quizRow = e.target.parentElement.parentElement;
						console.log(quizRow);
						quizRow.parentElement.removeChild(quizRow);
//						console.log(e.target);
				}
			})
		});
		td.appendChild(delBtn);
		return td;
	};

	module.ajax = function(method, url, callback, requestBody) {
		var xhr = new XMLHttpRequest();
		xhr.open(method, url);

		if (requestBody) {
			xhr.setRequestHeader("Content-type", "application/json");
		} else {
			requestBody = null;
		}

		xhr.onreadystatechange = function() {
			callback(xhr);
		};

		xhr.send(requestBody);
	};

	return module;
})();