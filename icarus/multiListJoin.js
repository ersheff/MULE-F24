var fullList = [];

function a() {
	var args = arrayfromargs(arguments);
	fullList = fullList.concat("a", args);
}

function b() {
	var args = arrayfromargs(arguments);
	fullList = fullList.concat("b", args);
}

function c() {
	var args = arrayfromargs(arguments);
	fullList = fullList.concat("c", args);
}

function goList() {
  if (fullList.length) {
    outlet(0, fullList);
    fullList = [];
  }
}
