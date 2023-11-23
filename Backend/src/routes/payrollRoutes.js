const express = require("express");
const router = express.Router();
const PayrollController = require("../controllers/PayrollController");
const { verifyManager } = require("../middleware/verifyManager");

// Rota para gerar uma nova folha de pagamento
// Esta rota deve ser protegida para ser acessada apenas por gerentes
router.post("/generate", verifyManager, PayrollController.generatePayroll);

// Rota para um usuário visualizar sua folha de pagamento
// Esta rota deve ser protegida e verificar se o usuário tem permissão para visualizar a folha
router.post("/getPayroll", PayrollController.getPayroll);

router.post("/getPayrollMonths", PayrollController.getPayrollMonths);

module.exports = router;
