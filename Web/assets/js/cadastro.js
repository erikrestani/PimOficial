// cadastro.js

document.getElementById("cadastro-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita o envio padrão do formulário

    // Obter valores dos campos de nome, e-mail e senha
    var nome = document.getElementById("nome").value;
    var email = document.getElementById("email").value;
    var senha = document.getElementById("senha").value;

    // Adicione sua lógica de cadastro aqui
    // Por exemplo, você pode enviar os dados para um servidor ou banco de dados

    // Exemplo de log para verificar os valores
    console.log("Nome: ", nome);
    console.log("E-mail: ", email);
    console.log("Senha: ", senha);

    // Exiba uma mensagem de sucesso de cadastro (você pode personalizar isso)
    alert("Cadastro realizado com sucesso!");

    // Redirecione para a página de login (substitua pela página real)
    window.location.href = "login.html";
});
