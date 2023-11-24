document.addEventListener("DOMContentLoaded", function () {
  fetch("http://localhost:3000/users/getUsers")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Falha ao buscar dados: " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      const select = document.getElementById("userId");
      data.forEach((item) => {
        const option = document.createElement("option");
        option.value = item.id;
        option.textContent = item.name;
        select.appendChild(option);
      });
    })
    .catch((error) => {
      console.error("Erro ao carregar dados:", error);
    });
});

const token = localStorage.getItem("token");

document
  .getElementById("holerite-form")
  .addEventListener("submit", function (e) {
    e.preventDefault();

    var userId = document.getElementById("userId").value;
    var month = document.getElementById("month").value;
    var token = localStorage.getItem("token"); // Obter o token

    fetch("http://localhost:3000/payroll/generate", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer " + token, // Incluir o token JWT
      },
      body: JSON.stringify({ userId, month }),
    })
      .then((response) => {
        if (!response.ok) {
          if (response.status === 401) {
            throw new Error("Não autenticado");
          }
          if (response.status === 403) {
            throw new Error("Acesso negado");
          }
          throw new Error(`Erro HTTP: ${response.status}`);
        }
        alert("Holerite gerado com sucesso!")
        return response.json();
      })
      .then((data) => {
        console.log("Holerite Gerado:", data);
        // Processar dados...
      })
      .catch((error) => {
        console.error("Erro:", error);
        alert(error.message);
      });
  });
