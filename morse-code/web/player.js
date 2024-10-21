const ws = new WebSocket("ws://127.0.0.1:3000?role=player");

// const interval = 200;
// const sensitivity = 4;
// let lastClockTime = Date.now();
// let localClockTime = lastClockTime;

const synth = new Tone.Synth().toDestination();

// function clockCorrection() {
//   const now = Date.now();
//   const drift = now - localClockTime;
//   if (Math.abs(drift) > interval / sensitivity) {
//     localClockTime = now;
//     document.querySelector("#drift-correction-display").textContent = drift;
//   }
// }

// function updateClock() {
//   localClockTime += interval;
//   synth.triggerAttackRelease("C5", "32n");
// }

function startTone() {
  // Tone.start().then(() => {
  //   setInterval(() => {
  //     updateClock();
  //   }, interval);
  // });
  Tone.start();
  ws.onmessage = (event) => {
    const data = JSON.parse(event.data);
    if (data.type === "clock") {
      // clockCorrection();
      synth.triggerAttackRelease("C5", "32n");
    }
  };
}

document.querySelector("#tone-start").addEventListener("click", startTone);

//

const buttons = document.querySelectorAll(".sonar");

buttons.forEach((b, index) => {
  b.addEventListener("click", () => {
    const message = {
      player: index,
      type: "dot"
    };
    ws.send(JSON.stringify(message));
  });
});
