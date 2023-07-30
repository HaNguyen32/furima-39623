document.addEventListener('DOMContentLoaded', function () {
    const priceInput = document.getElementById('item-price');
    const addTaxPriceElement = document.getElementById('add-tax-price');
    const profitElement = document.getElementById('profit');
  
    priceInput.addEventListener('input', function () {
      const price = parseInt(priceInput.value, 10);
      const taxRate = 0.1;
  
      const addTaxPrice = price * taxRate;
      const profit = price - addTaxPrice;
  
      addTaxPriceElement.textContent = addTaxPrice.toFixed(0);
      profitElement.textContent = profit.toFixed(0);
    });
});
  