import { Request, Response } from "express";
import prisma from "../database/prisma";

async function index(req: Request, res: Response) {
  const items = await prisma.item.findMany();
  const serializedItems = items.map((item) => {
    return {
      id: item.id,
      title: item.title,
      image_url: `http://localhost:3333/uploads/${item.image}`,
    };
  });

  return res.json(serializedItems);
}

export const itemsController = { index };
