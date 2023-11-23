document.addEventListener("DOMContentLoaded", function () {
  const token = localStorage.getItem("token");
  if (!token) {
    window.location.href = "login.html"; // Redirecionar para login se não estiver autenticado
    return;
  }

  // Obter informações do usuário logado
  fetch("http://localhost:3000/users/me", {
    headers: {
      Authorization: "Bearer " + token,
    },
  })
    .then((response) => response.json())
    .then((userData) => {
      const userId = userData.userId; // Obter o ID do usuário logado

      // Buscar meses disponíveis
      fetch("http://localhost:3000/payroll/getPayrollMonths", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: "Bearer " + token,
        },
        body: JSON.stringify({ userId }),
      })
        .then((response) => response.json())
        .then((meses) => {
          const selectMonth = document.getElementById("select-month");
          meses.forEach((mes) => {
            let option = document.createElement("option");
            option.value = mes;
            option.textContent = mes;
            selectMonth.appendChild(option);
          });
        })
        .catch((error) => console.error("Erro:", error));
      document
        .getElementById("select-month")
        .addEventListener("change", function () {
          const selectedMonth = this.value;
          if (selectedMonth) {
            fetch("http://localhost:3000/payroll/getPayroll", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Authorization: "Bearer " + token,
              },
              body: JSON.stringify({ userId, month: selectedMonth }),
            })
              .then((response) => response.json())
              .then((payroll) => {
                const detalhes = payroll[0]; // Supondo que você quer o primeiro item

                // Atualize os elementos com os novos valores
                document.getElementById("id").textContent = detalhes.userId;
                document.getElementById("nome").textContent = detalhes.name;
                document.getElementById("cargo").textContent = detalhes.role;
                document.getElementById("mes").textContent = detalhes.month;
                document.getElementById("salario-base").textContent =
                  "R$ " +
                  detalhes.baseSalary.toLocaleString("pt-BR", {
                    style: "currency",
                    currency: "BRL",
                  });

                document.getElementById("salario-total").textContent =
                  "R$ " +
                  detalhes.totalReceived.toLocaleString("pt-BR", {
                    style: "currency",
                    currency: "BRL",
                  });
              })
              .catch((error) => console.error("Erro:", error));
          }
        });
    })
    .catch((error) => {
      console.error("Erro ao obter informações do usuário:", error);
    });
});
