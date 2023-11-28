import { $ } from "./utilities";




export async function verificarDadosJaCadastrados() {
    const formCadastro = $('#form-cadastro-usuario');

    if (formCadastro) {
        formCadastro.addEventListener('submit', async (e) => {
            e.preventDefault();

            const emailInput = $('#email_cadastro_user').value;
            const telefoneInput = $('#telefone_cadastro_user').value;

            const dadosDoBanco = await coletarDadosDoBanco();

            console.log('Dados do banco:', dadosDoBanco);

         
            const emailJaCadastrado = dadosDoBanco.some(item => item.email === emailInput);
            const telefoneJaCadastrado = dadosDoBanco.some(item => item.telefone === telefoneInput);

            if (emailJaCadastrado) {
                alert('E-mail já cadastrado');
            }

            if (telefoneJaCadastrado) {
                alert('Telefone já cadastrado');
            }

          
            if (!emailJaCadastrado && !telefoneJaCadastrado) {
                formCadastro.submit();
            }
        });
    }
}


async function coletarDadosDoBanco() {
    const url = './php/pegar_dados.php';

    try {

    const response = await fetch(url);
    const result = await response.json();


      const dadosSimplificados = result.map(item => ({
            email: item.email,
            telefone: item.Telefone
        }));

        return dadosSimplificados;
    } catch (e) {
        console.log(`Erro ao obter dados do banco: ${e}`);
        return [];
    }
}
