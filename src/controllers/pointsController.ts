import { PointItem } from "@prisma/client";
import { Request, Response } from "express";
import prisma from "../database/prisma";

export interface TypedRequestBody<T> extends Express.Request {
  body: T;
}

async function index(req: Request, res: Response) {
  const { city, uf } = req.body;

  const points = await prisma.point.findMany({
    where: {
      city: city,
      uf: uf,
    },
  });

  if (!points) {
    return res
      .status(400)
      .json({ message: "This city doesn't have any point." });
  }

  const serializedPoints = points.map((point) => {
    return {
      ...point,
      image_url: `http://192.168.0.105:3333/uploads/${point.image}`,
    };
  });

  return res.json(serializedPoints);
}

async function create(
  req: TypedRequestBody<{
    image: string;
    name: string;
    email: string;
    whatsapp: string;
    latitude: string;
    longitude: string;
    city: string;
    uf: string;
    items: string;
  }>,
  res: Response
) {
  if (req.file?.filename) {
    let { name, email, whatsapp, latitude, longitude, city, uf, items } =
      req.body;

    const pointItems: Omit<PointItem, "pointId" | "id">[] = items
      .split(",")
      .map((item: string) => Number(item.trim()))
      .map((itemId: number) => {
        return {
          itemId,
        };
      });

    const createPoint = prisma.point.create({
      data: {
        image: req.file?.filename,
        name,
        email,
        whatsapp,
        latitude,
        longitude,
        city,
        uf,
        PointItem: {
          createMany: {
            data: [...pointItems],
          },
        },
      },
    });

    return res.json({
      ...(await createPoint),
    });
  }
}

export const pointsController = { index, create };
