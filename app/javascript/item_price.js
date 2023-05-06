window.addEventListener('load', () => {
  //console.log("Hello");

  
//const priceInput = document.getElementById("item-price");
//priceInput.addEventListener("input", () => {
  //const inputValue = priceInput.value;
  //console.log(inputValue);
  //})

//const addTaxDom = document.getElementById("add-tax-price");
  //addTaxDom.innerHTML = Math.floor(inputvalue);

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const taxValue = Math.floor(inputValue * 0.1); // inputValueの10%を計算する
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = taxValue; // 結果を表示する
  const profitValue = Math.floor(inputValue - taxValue)
  const addProfitDom = document.getElementById("profit")
  addProfitDom.innerHTML = profitValue;
})

//const priceInput = document.getElementById("item-price");
//priceInput.addEventListener("input", () => {
//  const inputValue = priceInput.value;
//  const profitValue = Math.floor(inputValue + taxValue);
//  const addProfitDom  = document.getElementById("profit");
//  addProfitDom.innerHTML = profitValue; // 結果を表示する
//})


});


