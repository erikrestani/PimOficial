const express = require("express");
const router = express.Router();
const UserController = require("../controllers/UserController");
const { verifyManager } = require("../middleware/verifyManager");

// Rota para registrar um novo usuário
router.post("/register", UserController.register);

// Rota para login de usuário
router.post("/login", UserController.login);

router.get("/getUsers", UserController.getAllUsers);

router.get("/me", verifyManager, UserController.getProfile);

router.get("/role", verifyManager, UserController.getRole);

module.exports = router;
