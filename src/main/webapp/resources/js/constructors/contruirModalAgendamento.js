import { abrirModal, coletarDadosAgendamento } from "../criarAgendamento.js";

const modals = [

    { 
      id: 1, 
      type: 'banho', 
      title: 'Banho', 
      text: 'Deixe o seu pet limpo e cheiroso com o nosso serviço de banho profissional.' ,
      preco : 30,
    },

    { 
      id: 2, 
      type: 'tosa', 
      title: 'Tosa', 
      text: 'Cuide da saúde do seu animal de estimação nesse calor com nossa tosa especializada.' ,
      preco : 45,

    },
    { 
      id: 3, 
      type: 'passeios', 
      title: 'Passeios Diários', 
      text: 'Mantenha o seu cão ativo e feliz com os nossos passeios diários pelo parque.' ,
      preco : 25,
    },

    { 
      id: 4, 
      type: 'adocao', 
      title: 'Adoção de Animais', 
      text: 'Encontre um novo amigo para a vida, visite nosso abrigo e adote um animal de estimação.' ,
      preco : 90,
    },

    { 
      id: 5, 
      type: 'treinamento', 
      title: 'Treinamento Comportamental', 
      text: 'Ajude o seu pet a se comportar melhor com nosso treinamento.' ,
      preco : 100,
    },

    { 
      id: 6, 
      type: 'hospedagem', 
      title: 'Hospedagem', 
      text: 'Precisa viajar? Nós tomamos conta de seu pet até em finais de semana.' ,
      preco : 200,
    }
];


function desenharModal(modal) {
  const li = document.createElement('li');
  li.classList.add('modal-card', 'col-lg-2', 'col-md-3', 'mb-4', 'd-flex', 'flex-column', 'justify-content-between');

  li.innerHTML = `
    <h2>${modal.title}</h2>
    <p>${modal.text}</p>
    <p>Preço: R$ ${modal.preco.toFixed(2)}</p>
    <div class="container">
      <button id='agendar-${modal.type}-btn' type="button" class="btn btn-primary" data-toggle="modal-${modal.type}" data-target="#myModal${modal.type}">
        Agendar
      </button>

      <!-- POP UP -->
      <div class="modal fade" id="myModal${modal.type}">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Agendar ${modal.type}</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <div>Serviço de leva e trás por + R$12</div>
              <h3> Preço do Serviço : <span class = "text-main-color">R$ ${modal.preco.toFixed(2)}</span> </h3>
              <input type="checkbox" id="flagCheckbox-${modal.type}" name="flagCheckbox-${modal.type}" value="${modal.id}">
              <div class="flag">
                <input type="text" id="nomeAnimal-agendar-${modal.type}" name="nomeAnimal-agendar-${modal.type}" placeholder="Digite o nome de seu bichinho" required />
                <input type="text" id="endereco-agendar-${modal.type}" name="endereco-agendar-${modal.type}" placeholder="Digite seu endereço" required />
              </div>
              <input type="date" id="diaa_${modal.type}" name="diaa_${modal.type}" />
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary id ="fecharModal-${modal.type}" data-dismiss="modal">Fechar</button>
              <button type="button" class="btn btn-primary" id="confirmAgendamentoBtnPrincipal-${modal.type}">Agendar</button>
            </div>
          </div>
        </div>
      </div>

      <!-- POP UP DE CONFIRMAÇÃO -->
      <div class="modal fade" id="confirmModal${modal.type}">
        <div class="modal-dialog modal-dialog-centered modal-xl">
          <div class="modal-content">

            <div class="modal-body mx-auto">
              <h2 class="fw-light fs-2">Deseja confirmar o agendamento?</h2>
            </div>
            <div class="modal-footer d-flex align-items-center justify-content-center">
              <button type="button" class="btn btn-secondary" id= "cancelarConfirmacao-${modal.type}" data-dismiss="modal">Cancelar</button>
              <button type="button" class="btn btn-primary" id="confirmAgendamentoBtnConfirmar-${modal.type}">Confirmar</button>
            </div>
          </div>
        </div>
      </div>
    </div>`;

  return li;
  
}

function modalGenerator() {
  const ulServicos = document.querySelector('#servicos');

  for (const modal of modals) {
      ulServicos.appendChild(desenharModal(modal));

      const modalSelector = `#myModal${modal.type}`;
      const confirmModalSelector = `#confirmModal${modal.type}`;


      $(`#agendar-${modal.type}-btn`).on('click', () => abrirModal(modal.type, modal.preco));


      $(`#confirmAgendamentoBtnPrincipal-${modal.type}`).on('click', () => {
          $(modalSelector).addClass('modal-opacity');
          $(confirmModalSelector).modal('show');
      });


      $(`#confirmAgendamentoBtnConfirmar-${modal.type}`).on('click', () => {
          coletarDadosAgendamento(modal.type);

        
          $(modalSelector).removeClass('modal-opacity');


          $(modalSelector).modal('hide');
          $(confirmModalSelector).modal('hide');
      });

      $(`#fecharModal-${modal.type}`).on('click', () => {
          $(modalSelector).modal('hide');


          $(modalSelector).removeClass('modal-opacity');
      });

    
      $(`#cancelarConfirmacao-${modal.type}`).on('click', () => {
          $(modalSelector).removeClass('modal-opacity');
      });
  }
}

modalGenerator();