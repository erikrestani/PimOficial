document.addEventListener("DOMContentLoaded", async () => {
  try {
    const token = localStorage.getItem("token");
    const response = await fetch("http://localhost:3000/users/role", {
      headers: {
        Authorization: "Bearer " + token,
      },
    });

    const data = await response.json();
    console.log(data);
    // Verificar se o usuário é um gerente
    if (data.role === "gerente") {
      // Exibir botões específicos para gerentes
      document.getElementById("gerar-holerite-btn").style.display = "block";
      document.getElementById("atualizar-lista-btn").style.display = "block";
      document.getElementById("gerar-relatorio-btn").style.display = "block";
    }
    // O botão "Visualizar Holerite" é sempre exibido
    document.getElementById("visualizar-holerite-btn").style.display = "block";
  } catch (error) {
    console.error("Erro ao obter role do usuário:", error);
  }
});
