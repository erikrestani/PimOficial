// login.js

document.getElementById("login-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita o envio padrão do formulário

    // Obter valores dos campos de usuário e senha
    var usuario = document.getElementById("usuario").value;
    var senha = document.getElementById("senha").value;

    // Adicione sua lógica de autenticação aqui
    // Por exemplo, você pode comparar as credenciais com um banco de dados

    // Simulando um login bem-sucedido para redirecionar para a página inicial
    if (usuario === "admin" && senha === "senha123") {
        // Redirecione para a página de início (substitua pela página real)
        window.location.href = "inicio.html";
    } else {
        // Exiba uma mensagem de erro se o login falhar (você pode personalizar isso)
        alert("Credenciais de login incorretas. Tente novamente.");
    }
});
