function price() {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('input', () => {
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    const itemValue = itemPrice.value

    addTaxPrice.innerHTML = Math.floor(itemValue * 0.10)
    profit.innerHTML = itemValue - addTaxPrice.innerHTML 
  });
};

window.addEventListener('load', price);