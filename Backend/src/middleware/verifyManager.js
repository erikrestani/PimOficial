const jwt = require("jsonwebtoken");

function verifyManager(req, res, next) {
  try {
    const token = req.headers.authorization.split(" ")[1]; // Assume Bearer token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    console.log("token", token);

    req.userId = decoded; // Adiciona os dados do usuário à requisição
    next();
  } catch (error) {
    console.log("Não autenticado", error);
    return res.status(401).json({ message: "Não autenticado" });
  }
}

module.exports = { verifyManager };
