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

// function displayuser(data) {

// const user = data.drinks[0];
// const userDiv = document.getElementById("userDetails");
// const userName = user.strDrink;
// const heading = document.createElement("h1");
// heading.innerHTML = userName;
// userDiv.appendChild(heading); 
// const userImg = document.createElement("img");
// userImg.src = user.strDrinkThumb;
// userDiv.appendChild(userImg);
// document.body.style.backgroundImage = "url('" + user.strDrinkThumb + "')";
// const userIngredients = document.createElement("ul");
// userDiv.appendChild(userIngredients);  

// const getIngredients = Object.keys(user)
//   .filter(function (ingredient) {
//     return ingredient.indexOf("strIngredient") == 0;
//   })
//   .reduce(function (ingredients, ingredient) {
//     if (user[ingredient] != null) {
//       ingredients[ingredient] = user[ingredient];
//     }
//     return ingredients;
//   }, {});

// for (let key in getIngredients) {
//   let value = getIngredients[key];
//   listItem = document.createElement("li");
//   listItem.innerHTML = value;
//   userIngredients.appendChild(listItem);
// }
// }   