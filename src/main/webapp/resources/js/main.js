import { construirAgendamentosUsuario } from "./constructors/contruirAgendamentos";
import { openNav } from "./openNav";
import { redirecionarUsuario } from "./redirecionarUsuario";
import { $ } from "./utilities";
import { verificarDadosJaCadastrados } from "./verificarDadosJaCadastrados";
import { verificarSeJaExisteUsuario } from "./verificarLogin";



$(".open__nav__btn").addEventListener("click", openNav);

async function inicializarPagina() {
  await new Promise((resolve) => setTimeout(resolve, 1000));
  await verificarSeJaExisteUsuario("usuario");
}

inicializarPagina();

redirecionarUsuario();

construirAgendamentosUsuario();

verificarDadosJaCadastrados();
