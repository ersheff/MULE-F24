var row1, row2, row3;

function setRow1() {
  row1 = arrayfromargs(arguments);
}

function setRow2() {
  row2 = arrayfromargs(arguments);
}

function setRow3() {
  row3 = arrayfromargs(arguments);
}

function reportRows() {
  var message = [];
  var rows = [row1, row2, row3];

  for (var i = 0; i < rows.length; i++) {
    if (rows[i]) {
      message = message.concat(rows[i]);
    }
  }

  if (message.length) {
    outlet(0, message);
    row1 = null;
    row2 = null;
    row3 = null;
  }
}
