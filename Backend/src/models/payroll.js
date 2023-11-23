const Sequelize = require("sequelize");
const db = require("../db");

const Payroll = db.define("payroll", {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  userId: Sequelize.INTEGER,
  name: Sequelize.STRING,
  role: Sequelize.STRING,
  month: Sequelize.STRING,
  baseSalary: Sequelize.FLOAT,
  totalReceived: Sequelize.FLOAT,
});

module.exports = Payroll;
