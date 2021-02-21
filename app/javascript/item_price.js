function check() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input',function(){
    const inputValue = priceInput.value;

    const add_tax_price = document.getElementById('add-tax-price')
    add_tax_price.innerHTML = Math.floor(inputValue * 0.1)

    const profit = document.getElementById('profit')
    profit.innerHTML = Math.floor(inputValue * 0.9)
    })
}


window.addEventListener("load", check);
