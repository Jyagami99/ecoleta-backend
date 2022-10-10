import { NextFunction, Request, Response } from "express";
import { errorTypeToStatusCode, isAppError } from "../utils/errorUtils";

export function errorHandlerMiddleware(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  console.log(err);
  if (isAppError(err)) {
    return res.status(errorTypeToStatusCode(err.type)).send(err.message);
  }

  res.sendStatus(500);
}
