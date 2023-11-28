
export function fazerLogoutUsuario(key) {
    const usuario = JSON.parse(localStorage.getItem(key));

    if (usuario) {

        exibirModalConfirmacao(usuario);
    }
}

function exibirModalConfirmacao(usuario) {
  
    $('#confirmarLogoutModal').modal('show');

    $('.cancelarLogoutBtn').on('click', () => {
        $('#confirmarLogoutModal').modal('hide');
    });
   
    $('#confirmarLogoutBtn').on('click', () => {
       
        excluirUsuario(usuario.id);

    });
}

function excluirUsuario(userID) {
   
    const url = './php/excluir_usuario.php';
    const data = { userID };

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
         
            localStorage.removeItem('usuario');
   
            window.location.href = './index.html';
        } else {
            console.error('Erro ao excluir usuário do banco de dados:', data.error);
        }
    })
    .catch(error => {
        console.error('Erro ao excluir usuário:', error);
    });
}

const logoutBtn = document.querySelector('#logout-btn');

logoutBtn.addEventListener('click', () => fazerLogoutUsuario('usuario'));