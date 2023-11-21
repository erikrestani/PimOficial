document.getElementById("holerite-form").addEventListener("submit", function (e) {
    e.preventDefault(); 

    var nomeFuncionario = document.getElementById("funcionario-nome").value;

    console.log("Nome do Funcionário: ", nomeFuncionario);

    window.location.href = "holeritegerada.html";
});
