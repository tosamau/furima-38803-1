const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');      //カード番号
  expiryElement.mount('#expiry-form');     //期限
  cvcElement.mount('#card-cvc');           //cvc

  const submit = document.getElementById("button");

submit.addEventListener("click", (e) => {
  e.preventDefault();
  payjp.createToken(numberElement).then(function (response) {
    if (response.error) {
    } else {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
      debugger;
    }
    numberElement.clear();
    expiryElement.clear();
    cvcElement.clear();
    document.getElementById("charge-form").submit();
  });
});
};

window.addEventListener("load", pay);
