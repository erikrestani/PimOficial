document.getElementById("login-form").addEventListener("submit", function (e) {
  e.preventDefault(); // Evita o envio padrão do formulário

  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;

  fetch("http://localhost:3000/users/login", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ email, password }),
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.token) {
        localStorage.setItem("token", data.token); // Armazenar o token no localStorage
        // Ou, para sessionStorage: sessionStorage.setItem('token', data.token);
        window.location.href = "inicio.html";
      } else {
        throw new Error("Token não recebido");
      }
    })
    .catch((error) => {
      console.error("Erro:", error);
    });
});
