
document.addEventListener('DOMContentLoaded', function () {
  const priceInput = document.getElementById('item-price');
  const addTaxPriceElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const taxRate = 0.1; 
      
      
      const taxPrice = Math.floor(inputValue * taxRate);
      addTaxPriceElement.textContent = taxPrice;

      const profit = Math.floor(inputValue - taxPrice);
      profitElement.textContent = profit;
  })
})