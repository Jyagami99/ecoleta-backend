/*
  Warnings:

  - You are about to drop the `PointItem` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "PointItem" DROP CONSTRAINT "PointItem_itemId_fkey";

-- DropForeignKey
ALTER TABLE "PointItem" DROP CONSTRAINT "PointItem_pointId_fkey";

-- DropTable
DROP TABLE "PointItem";

-- CreateTable
CREATE TABLE "pointsItems" (
    "id" SERIAL NOT NULL,
    "pointId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,

    CONSTRAINT "pointsItems_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "pointsItems" ADD CONSTRAINT "pointsItems_pointId_fkey" FOREIGN KEY ("pointId") REFERENCES "points"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pointsItems" ADD CONSTRAINT "pointsItems_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
