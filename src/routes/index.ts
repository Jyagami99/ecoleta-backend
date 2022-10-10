import { Router } from "express";
import itemsRouter from "./itemsRouter";
import pointsRouter from "./pointsRouter";

const router = Router();

router.use(itemsRouter);
router.use(pointsRouter);

export default router;
