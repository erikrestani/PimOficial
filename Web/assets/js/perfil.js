// perfil.js

window.addEventListener("DOMContentLoaded", (event) => {
  const token = localStorage.getItem("token");
  if (!token) {
    window.location.href = "login.html"; // Redireciona para o login se não estiver autenticado
    return;
  }

  fetch("http://localhost:3000/users/me", {
    headers: {
      Authorization: "Bearer " + token,
    },
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Erro ao buscar dados do perfil");
      }
      return response.json();
    })
    .then((perfil) => {
      // Atualizar o DOM com os dados do perfil
      document.querySelector(".perfil-foto img").src =
        perfil.foto || "../images/foto_perfil.png";
      document.getElementById("cpf-cnpj").textContent = perfil.cpfCnpj;
      document.getElementById("nome").textContent = perfil.nome;
      document.getElementById("setor").textContent = perfil.setor;
      document.getElementById("telefone").textContent = perfil.telefone;
      document.getElementById("email").textContent = perfil.email;
    })
    .catch((error) => {
      console.error("Erro:", error);
    });
});
