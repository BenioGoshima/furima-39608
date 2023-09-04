window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const profitDom = document.getElementById("profit")

    const taxRate = 0.1;
    const taxAmount = inputValue * taxRate;
    const  profit = inputValue - taxAmount

    addTaxDom.innerHTML = Math.floor(taxAmount);
    profitDom.innerHTML = Math.ceil(profit);
  })
});