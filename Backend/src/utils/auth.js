const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const SECRET_KEY = "your-secret-key"; // Você deve colocar isso em uma variável de ambiente

const hashPassword = async (password) => {
  return await bcrypt.hash(password, 10);
};

const comparePassword = async (password, hashedPassword) => {
  return await bcrypt.compare(password, hashedPassword);
};

const generateToken = (user) => {
  const payload = {
    userId: user.id,
    role: user.role,
  };

  return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: "1h" });
};

const verifyToken = (token) => {
  return jwt.verify(token, SECRET_KEY);
};

module.exports = {
  hashPassword,
  comparePassword,
  generateToken,
  verifyToken,
};
