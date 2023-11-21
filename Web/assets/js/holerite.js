document.getElementById("holerite-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita o envio padrão do formulário

    // Obter valores dos campos de id, nome e cargo do funcionário
    var idFuncionario = document.getElementById("funcionario-id").value;
    var nomeFuncionario = document.getElementById("funcionario-nome").value;
    var cargoFuncionario = document.getElementById("funcionario-cargo").value;

    // Adicione sua lógica para gerar o holerite aqui

    // Exemplo de log para verificar os valores
    console.log("ID do Funcionário: ", idFuncionario);
    console.log("Nome do Funcionário: ", nomeFuncionario);
    console.log("Cargo do Funcionário: ", cargoFuncionario);

    window.location.href = "holeritegerada.html";
});
