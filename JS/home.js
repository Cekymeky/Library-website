import { bookMap } from "./AvailableBooks.js";

document.addEventListener("DOMContentLoaded", function () {
  let recommended = document.getElementById("recommended-section");
  bookMap.forEach((value, key) => {
    let Book = `
<div class="book">
    <img src=${value.cover} alt="${key}" />
    <h5 class="name">${value.tittle}</h5>
    <button class="previewButton" book-id="${key}">Details</button>
</div>
`;
    recommended.innerHTML += Book;
  });

  // event listner to ensure that the books added
  const BooksAdded = new Event("BooksAdded");
  document.dispatchEvent(BooksAdded);
});
