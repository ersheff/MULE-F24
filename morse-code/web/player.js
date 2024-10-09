const ws = new WebSocket("ws://localhost:3000?role=player");
const buttons = document.querySelectorAll("button");

let clockCount = 0;

buttons.forEach((b, index) => {
  b.addEventListener("click", () => {
    const message = {
      player: index,
      type: "dot"
    };
    ws.send(JSON.stringify(message));
  });
});

ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  if (data.type === "clock") {
    updateClock();
  }
};

function updateClock() {
  clockCount++;
  document.querySelector("span").innerText = clockCount;
}
