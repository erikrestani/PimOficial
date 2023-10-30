// holerite.js

document.getElementById("holerite-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita o envio padrão do formulário

    // Obter valores dos campos de id, nome e cargo do funcionário
    var idFuncionario = document.getElementById("id-funcionario").value;
    var nomeFuncionario = document.getElementById("nome-funcionario").value;
    var cargoFuncionario = document.getElementById("cargo-funcionario").value;

    // Adicione sua lógica para gerar o holerite aqui

    // Exemplo de log para verificar os valores
    console.log("ID do Funcionário: ", idFuncionario);
    console.log("Nome do Funcionário: ", nomeFuncionario);
    console.log("Cargo do Funcionário: ", cargoFuncionario);

    // Exiba uma mensagem de sucesso de geração de holerite (você pode personalizar isso)
    alert("Holerite gerado com sucesso!");
});
