window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    const profitAmount = price - tax;
    
    addTaxPrice.innerHTML = tax.toLocaleString();
    profit.innerHTML = profitAmount.toLocaleString();
  });
});