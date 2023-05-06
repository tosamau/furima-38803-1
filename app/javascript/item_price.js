window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const taxValue = Math.floor(inputValue * 0.1); 
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = taxValue; 
  const profitValue = Math.floor(inputValue - taxValue)
  const addProfitDom = document.getElementById("profit")
  addProfitDom.innerHTML = profitValue;
})

});


