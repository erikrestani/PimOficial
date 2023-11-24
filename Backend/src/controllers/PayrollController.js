const User = require("../models/user");
const Payroll = require("../models/payroll");
const { Sequelize } = require("sequelize");

const PayrollController = {
  async generatePayroll(req, res) {
    try {
      const { userId, month } = req.body;

      const requester = await User.findByPk(userId);
      if (!requester) {
        console.log("Erro: Usuário não encontrado");
        return res.status(404).json({ message: "Usuário não encontrado" });
      }

      const baseSalary = { estoquista: 1500, caixa: 1700, gerente: 3500 }[
        requester.role
      ];
      const totalReceived = baseSalary;

      const payroll = await Payroll.create({
        userId: requester.id,
        name: requester.name,
        role: requester.role,
        month,
        baseSalary,
        totalReceived,
      });

      return res.status(201).json(payroll);
    } catch (error) {
      console.log("Erro ao gerar: ", error);
      return res.status(500).json({ error: error.message });
    }
  },

  async getPayroll(req, res) {
    try {
      const { userId, month } = req.body;
      if (!userId || !month) {
        return res
          .status(400)
          .json({ message: "UserId e month são necessários" });
      }

      const payrolls = await Payroll.findAll({
        where: {
          userId: userId,
          month: month,
        },
      });
      console.log(payrolls);
      return res.status(200).json(payrolls);
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },

  async getPayrollMonths(req, res) {
    try {
      const { userId } = req.body;

      if (!userId) {
        return res.status(400).json({ message: "UserId é necessário" });
      }

      // Buscar todos os meses distintos onde um holerite foi gerado para o usuário
      const months = await Payroll.findAll({
        attributes: [
          [Sequelize.fn("DISTINCT", Sequelize.col("month")), "month"],
        ],
        where: { userId },
        order: [["month", "ASC"]],
      });

      // Extrair apenas os meses dos resultados
      const uniqueMonths = months.map((m) => m.month);
      console.log(uniqueMonths);

      return res.status(200).json(uniqueMonths);
    } catch (error) {
      console.log(error);
      return res.status(500).json({ error: error.message });
    }
  },
};

module.exports = PayrollController;