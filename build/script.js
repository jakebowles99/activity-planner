fetch("http://20.108.235.195/api/data")
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error("NETWORK RESPONSE ERROR");
    }
  })
  .then(data => {
    console.log(data);
    displayuser(data)
  })
  .catch((error) => console.error("FETCH ERROR:", error));
  