import { Router } from "express";
import { itemsController } from "../controllers/itemsController";

const router = Router();

router.get("/items", itemsController.index);

export default router;
