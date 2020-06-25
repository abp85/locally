const initGeocode = () => {
  const button = document.querySelector(".geocode")
  if (button) {
    button.addEventListener("click", (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition((position) => {
        window.location.href = `/reports?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`
      });
    })
  }
}


export { initGeocode }
