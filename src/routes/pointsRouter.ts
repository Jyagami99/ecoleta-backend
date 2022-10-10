import { Router } from "express";
import multer from "multer";
import multerConfig from "../config/multer";
import { pointsController } from "../controllers/pointsController";
import validateSchemaMiddleware from "../middlewares/validateSchema";
import { objectSchema } from "../schema/objectSchema";

const router = Router();
const upload = multer(multerConfig);

router.get("/points", pointsController.index);
router.get("/points/:id");
router.post(
  "/points",
  validateSchemaMiddleware(objectSchema),
  upload.single("image"),
  pointsController.create
);

export default router;
