document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("gerar-holerite-btn").addEventListener("click", function () {
        window.location.href = "holerite.html"; // Substitua "holerite.html" pela página real da holerite
    });
});

// Função de exemplo para o botão 'Atualizar Lista de Funcionários'
document.querySelector('button:nth-of-type(2)').addEventListener('click', function () {
    alert('Lista de funcionários atualizada com sucesso!');
});

// Função de exemplo para o botão 'Gerar Relatório Mensal'
document.querySelector('button:nth-of-type(3)').addEventListener('click', function () {
    alert('Relatório mensal gerado com sucesso!');
});
