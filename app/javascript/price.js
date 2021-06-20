function price() {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    addTaxPrice.innerHTML = Math.floor(itemPrice.value * 0.10)
    profit.innerHTML = itemPrice.value - addTaxPrice.innerHTML 
  });
};

window.addEventListener('load', price);