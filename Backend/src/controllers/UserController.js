const User = require("../models/user");

const {
  hashPassword,
  comparePassword,
  generateToken,
} = require("../utils/auth");

const UserController = {
  async register(req, res) {
    try {
      const { name, email, phone, cpf_cnpj, role, password } = req.body;
      const hashedPassword = await hashPassword(password);

      const newUser = await User.create({
        name,
        email,
        phone,
        cpf_cnpj,
        role,
        password: hashedPassword,
      });
      console.log("Cadastro efetuado");

      return res.status(201).json(newUser);
    } catch (error) {
      console.log("Erro ao cadastrar");
      return res.status(500).json({ error: error.message });
    }
  },

  async login(req, res) {
    try {
      const { email, password } = req.body;
      const user = await User.findOne({ where: { email } });

      if (!user || !(await comparePassword(password, user.password))) {
        return res.status(401).json({ message: "Email ou senha inválidos" });
      }

      const token = generateToken(user);
      return res.status(200).json({ token });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },

  async getAllUsers(req, res) {
    try {
      const users = await User.findAll();
      return res.status(200).json(users);
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },

  // UserController.js

  async getProfile(req, res) {
    try {
      const userId = req.userId.userId; // 'req.user' é definido pelo middleware de autenticação
      const user = await User.findByPk(userId);

      if (!user) {
        return res.status(404).json({ message: "Usuário não encontrado" });
      }

      // Envie as informações relevantes do usuário
      return res.status(200).json({
        userId: user.id,
        cpfCnpj: user.cpf_cnpj,
        nome: user.name,
        setor: user.role, // Ajuste conforme a estrutura do seu modelo
        telefone: user.phone,
        email: user.email,
      });
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  },

  async getRole(req, res) {
    try {
      const userId = req.userId.userId; // Obter ID do usuário do token
      const user = await User.findByPk(userId);

      if (!user) {
        return res.status(404).json({ message: "Usuário não encontrado" });
      }

      res.json({ role: user.role });
    } catch (error) {
      res
        .status(500)
        .json({ message: "Erro ao buscar informações do usuário" });
    }
  },
};

module.exports = UserController;
