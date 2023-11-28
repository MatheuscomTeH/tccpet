import { $ } from "../utilities";

export function construirAgendamentosUsuario () {
    const agendamentos = JSON.parse(localStorage.getItem('agendamentos')) ?? {};
    const tbodyAgendamentos = $('#tbody-agendamento');

    console.log('tbodyAgendamentos:', tbodyAgendamentos); 



    if (tbodyAgendamentos) {

        tbodyAgendamentos.innerHTML = '';

        if (agendamentos.length > 0) {
            for (const agendamento of agendamentos) {
                if (agendamento) {
                    const tr = document.createElement('tr');
                    const dataFormatada = formatarData(agendamento.data);
                    tr.innerHTML = `

                        <td>${agendamento.servico}</td>
                        <td>${agendamento.endereco}</td>
                        <td>${agendamento.nomeAnimal}</td>
                        <td>R$ ${agendamento.preco}</td>
                        <td>${dataFormatada}</td>
             

                    `;
                    tbodyAgendamentos.append(tr);
                }
            }
        } else {
            const tr = document.createElement('tr');
            const tdMensagem = document.createElement('td');
            tdMensagem.colSpan = 5;
            tdMensagem.innerHTML = `
                <div class="text-center">
                    <h2>Você ainda não possui nenhum serviço</h2>
                    <h4> Que tal agendar um? </h4>
                    <a href="agendamento.html" class="btn bg-main-color">Serviços</a>
                </div>`;
            tr.appendChild(tdMensagem);
            tbodyAgendamentos.append(tr);
        }
    }
}

function formatarData(dataString) {

  
    const data = dataString instanceof Date ? dataString : new Date(dataString);

    if (isNaN(data.getTime())) {
        console.error(`Data inválida: ${dataString}`);
        return 'Data Inválida';
    }

    const dia = data.getDate().toString().padStart(2, '0');
    const mes = (data.getMonth() + 1).toString().padStart(2, '0');
    const ano = data.getFullYear();
    return `${dia}/${mes}/${ano}`;

}
