let nextDom = document.getElementById("next");
let prevDom = document.getElementById("prev");

let tarjetas_desplegablesDom = document.querySelector(".tarjetas_desplegables");
let SliderDom = tarjetas_desplegablesDom.querySelector(
  ".tarjetas_desplegables .list"
);
let miniaturaBorderDom = document.querySelector(
  ".tarjetas_desplegables .miniatura"
);
let miniaturaItemsDom = miniaturaBorderDom.querySelectorAll(".item");
let timeDom = document.querySelector(".tarjetas_desplegables .time");

miniaturaBorderDom.appendChild(miniaturaItemsDom[0]);
let timeRunning = 3000;
let timeAutoNext = 7000;

nextDom.onclick = function () {
  showSlider("next");
};

prevDom.onclick = function () {
  showSlider("prev");
};
let runTimeOut;
let runNextAuto = setTimeout(() => {
  next.click();
}, timeAutoNext);
function showSlider(type) {
  let SliderItemsDom = SliderDom.querySelectorAll(
    ".tarjetas_desplegables .list .item"
  );
  let miniaturaItemsDom = document.querySelectorAll(
    ".tarjetas_desplegables .miniatura .item"
  );

  if (type === "next") {
    SliderDom.appendChild(SliderItemsDom[0]);
    miniaturaBorderDom.appendChild(miniaturaItemsDom[0]);
    tarjetas_desplegablesDom.classList.add("next");
  } else {
    SliderDom.prepend(SliderItemsDom[SliderItemsDom.length - 1]);
    miniaturaBorderDom.prepend(miniaturaItemsDom[miniaturaItemsDom.length - 1]);
    tarjetas_desplegablesDom.classList.add("prev");
  }
  clearTimeout(runTimeOut);
  runTimeOut = setTimeout(() => {
    tarjetas_desplegablesDom.classList.remove("next");
    tarjetas_desplegablesDom.classList.remove("prev");
  }, timeRunning);

  clearTimeout(runNextAuto);
  runNextAuto = setTimeout(() => {
    next.click();
  }, timeAutoNext);
}


