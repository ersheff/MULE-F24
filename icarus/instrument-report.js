var instruments = "";
var instrument2 = "";
var instrument3 = "";

function setInstrument1() {
  var a = arrayfromargs(arguments);
  instrument1 = a[0];
}

function setInstrument2() {
  var a = arrayfromargs(arguments);
  instrument2 = a[0];
}

function setInstrument3() {
  var a = arrayfromargs(arguments);
  instrument3 = a[0];
}

function list() {
  var connections = "";
  var a = arrayfromargs(arguments);
  if (a[0] && instrument1) {
    connections += instrument1;
  }
  if (a[1] && instrument2) {
    if (connections) {
      connections += ", ";
    }
    connections += instrument2;
  }
  if (a[2] && instrument3) {
    if (connections) {
      connections += ", ";
    }
    connections += instrument3;
  }
  if (!connections) {
    connections = "unassigned"
  }
  outlet(0,connections);
}
