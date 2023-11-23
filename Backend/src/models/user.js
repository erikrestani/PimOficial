const Sequelize = require("sequelize");
const db = require("../db");

const User = db.define("user", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  name: Sequelize.STRING,
  email: Sequelize.STRING,
  phone: Sequelize.STRING,
  cpf_cnpj: Sequelize.STRING,
  role: Sequelize.STRING,
  password: Sequelize.STRING,
});

module.exports = User;
