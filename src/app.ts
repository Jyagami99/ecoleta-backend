import express, { json } from "express";
import "express-async-errors";
import cors from "cors";
import router from "./routes";
import { errorHandlerMiddleware } from "./middlewares/errorHandlerMiddleware";
import path from "path";

const app = express();

app.use(cors());
app.use(json());

app.use(router);

app.use(errorHandlerMiddleware);
app.use("/uploads", express.static(path.resolve(__dirname, "..", "uploads")));

export default app;
