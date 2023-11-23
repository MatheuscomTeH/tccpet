


document.getElementById('cadastro-form').addEventListener('submit', function (event) {
    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
  
    if (!nome || !email) {
      alert('Por favor, preencha todos os campos obrigatórios.');
      event.preventDefault(); // Impede o envio do formulário
    }
  }); 
  function Display() {
    let elemento = document.getElementById('divend');
    if (elemento.style.display === "none") {
        elemento.style.display = "block"; 
        elemento.style.backgroundColor = 'rgba(200, 100, 200, 0.6)';
        elemento.style.border = '1px solid red';
        elemento.style.borderRadius = '25px';
        elemento.style.padding = '1%';
    } else {
        elemento.style.display = "none";
    }
}