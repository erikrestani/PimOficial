const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const userRoutes = require("./src/routes/userRoutes");
const payrollRoutes = require("./src/routes/payrollRoutes");
const db = require("./src/db");
require("dotenv").config();

const app = express();

app.use(cors({
  origin:"*"
}));

app.use(bodyParser.json());
app.use("/users", userRoutes);
app.use("/payroll", payrollRoutes);

db.sync()
  .then(() => console.log("Banco de dados sincronizado"))
  .catch((err) => console.error("Erro ao sincronizar o banco de dados", err));

/* db.sync({ force: true })
  .then(() => console.log("Banco de dados sincronizado e tabelas recriadas"))
  .catch((err) => console.error("Erro ao sincronizar o banco de dados", err)); */

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
