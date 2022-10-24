fetch("https://catfact.ninja/fact")
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("NETWORK RESPONSE ERROR");
    }
  })
  .then(data => {
    console.log(data);
  })
  .catch((error) => console.error("FETCH ERROR:", error));

