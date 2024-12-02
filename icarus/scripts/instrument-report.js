var connections = {
  row1: [],
  row2: [],
  row3: []
};

var instruments = {
  instrument1: "",
  instrument2: "",
  instrument3: ""
};

function setInstrument(instrumentKey) {
  return function () {
    var a = arrayfromargs(arguments);
    var newInstrument = a[0] != "-" ? a[0] : "";
    updateInstrument(instrumentKey, instruments[instrumentKey], newInstrument);
    instruments[instrumentKey] = newInstrument;
  };
}

var setInstrument1 = setInstrument("instrument1");
var setInstrument2 = setInstrument("instrument2");
var setInstrument3 = setInstrument("instrument3");

function updateInstrument(instrumentKey, oldInstrument, newInstrument) {
  var rows = [connections.row1, connections.row2, connections.row3];
  for (var i = 0; i < rows.length; i++) {
    var row = rows[i];
    for (var j = 0; j < row.length; j++) {
      if (row[j].key === instrumentKey) {
        row[j].name = newInstrument;
        // Remove placeholder "ready" if it exists
        row = row.filter(function (item) {
          return item.name !== "ready";
        });
        outputRow(i + 1, row);
      }
    }
  }
}

function set() {
  var a = arrayfromargs(arguments);
  var input = a[0];
  var output = a[1];
  var state = a[2];

  var instrumentKey = getInstrumentKeyByOutput(output);
  var instrumentName =
    instruments[instrumentKey] ||
    (output === 0 || output === 2 || output === 4 ? "ready" : "");
  if (instrumentName) {
    var row = getRowByInput(input);
    if (row) {
      var changed = false;
      if (state === 1) {
        // New connection
        if (
          !row.some(function (item) {
            return item.key === instrumentKey;
          })
        ) {
          row.push({ key: instrumentKey, name: instrumentName });
          changed = true;
        }
      } else if (state === 0) {
        // Disconnect
        for (var i = 0; i < row.length; i++) {
          if (row[i].key === instrumentKey) {
            row.splice(i, 1);
            changed = true;
            break;
          }
        }
      }
      if (changed) {
        outputRow(getRowNumberByInput(input), row);
      }
    }
  }
}

function getInstrumentKeyByOutput(output) {
  if (output === 0) return "instrument1";
  if (output === 2) return "instrument2";
  if (output === 4) return "instrument3";
  return null;
}

function getRowByInput(input) {
  if (input >= 0 && input <= 3) return connections.row1;
  if (input >= 4 && input <= 7) return connections.row2;
  if (input >= 8 && input <= 11) return connections.row3;
  return null;
}

function getRowNumberByInput(input) {
  if (input >= 0 && input <= 3) return 1;
  if (input >= 4 && input <= 7) return 2;
  if (input >= 8 && input <= 11) return 3;
  return "";
}

function outputRow(rowNumber, row) {
  var rowNames = row.map(function (item) {
    return item.name;
  });
  outlet(0, rowNumber, rowNames);
}
