document
  .getElementById("cadastro-form")
  .addEventListener("submit", function (e) {
    e.preventDefault();

    var nome = document.getElementsByName("name")[0].value;
    var email = document.getElementsByName("email")[0].value;
    var senha = document.getElementsByName("password")[0].value;
    var phone = document.getElementsByName("phone")[0].value;
    var cpf_cnpj = document.getElementsByName("cpf_cnpj")[0].value;
    var role = document.getElementsByName("role")[0].value;

    var data = {
      name: nome,
      email: email,
      password: senha,
      phone: phone,
      cpf_cnpj: cpf_cnpj,
      role: role,
    };

    console.log("Enviando dados:", data);

    fetch("http://localhost:3000/users/register", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    })
      .then((response) => {
        console.log("Resposta recebida:", response);
        if (!response.ok) {
          throw new Error(`Erro HTTP: ${response.status}`);
        }
        return response.json();
      })
      .then((responseData) => {
        console.log("Sucesso:", responseData);
      })
      .catch((error) => {
        console.error("Erro:", error);
      });
  });
