import { $ } from "./utilities";


export async function verificarLoginUsuario() {
    console.log('Chamando verificarLoginUsuario()');

    const url = './php/login.php';

     
    const email = document.getElementById('email-login').value;
    const senha = document.getElementById('senha-login').value;

    try {
        const response = await fetch(url, {
            method: 'POST',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `email-login-usuario=${encodeURIComponent(email)}&senha-login-usuario=${encodeURIComponent(senha)}`,
        });

        console.log('Status HTTP da resposta:', response.status);

        const responseJson = await response.json();
       

        if (responseJson.success) {

            try {
             
                console.log('fez login', responseJson);

              
                    const usuario = {
                        
                        autenticado: true,
                        id: responseJson.id,
                        nome: responseJson.nome,
                        email: responseJson.email,
                        
                    };

                    localStorage.setItem('usuario', JSON.stringify(usuario));

                    if (responseJson.redirect) {
                        window.location.href = responseJson.redirect;
                    }

                    return true;
                    
                

            } catch (jsonError) {
                console.error('Erro ao fazer o parse do JSON:', jsonError);
                return false;
            }

        } 

    } catch (error) {
        console.error('Erro ao verificar o login:', error);
    }
}

async function coletarFormulario() {
    document.addEventListener('DOMContentLoaded', function() {
        const formLogin = $('#form-login');
        if (formLogin) {
            formLogin.addEventListener('submit', async function(event) {
                event.preventDefault();
                const loginVerificado = await verificarLoginUsuario();
                console.log('Login Verificado:', loginVerificado);
                verificarSeJaExisteUsuario('usuario');
            });
        }

    });
}


// não estou usando ${} pois o JSON não aceita conversões em string
export async function verificarSeJaExisteUsuario(key) {
    const usuarioString = localStorage.getItem(key);

    if (usuarioString !== null) {
        const usuario = JSON.parse(usuarioString);

        if (usuario && usuario.autenticado) {
            console.log('Usuário já está autenticado:', usuario);
            return true;
        } else {
            console.log('Usuário não autenticado e inexistente:',usuario);
            return false;
        }
    } else {
        console.log('Chave de usuário não encontrada no localStorage');
        return false;
    }
}





coletarFormulario();








