import app from "./app";
import dotenv from "dotenv";

dotenv.config();

const PORT: number = Number(process.env.PORT) || 3333;

app.listen(PORT, () => {
  console.log(`O servidor subiu na porta ${PORT}`);
});
