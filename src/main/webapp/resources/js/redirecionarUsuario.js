import { $ } from "./utilities";
import { verificarSeJaExisteUsuario } from "./verificarLogin";

export function redirecionarUsuario () {



        const btnEntrar = $("#entrar-btn");
        const btnCadastrar = $("#cadastrar-btn");
    
    
        if(btnCadastrar) {
    
            btnCadastrar.addEventListener("click", async function () {
        
                const loginVerificado = await verificarSeJaExisteUsuario("usuario");
            
                if (loginVerificado) {
                    
                  alert('Usuário ja foi cadastrado');
            
                  window.location.href = "usuario.html";
            
                } else {
            
                    window.location.href = "contact.html";
                }
            
              });
        
        }
        
        if (btnEntrar) {
        
          btnEntrar.addEventListener("click", async function () {
        
            const loginVerificado = await verificarSeJaExisteUsuario("usuario");
        
            if (loginVerificado) {
        
        
              window.location.href = "usuario.html";
        
            } else {
        
                window.location.href = "login.html";
            }
        
          });
        
        }
        
    



}