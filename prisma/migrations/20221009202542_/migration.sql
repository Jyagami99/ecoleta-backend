/*
  Warnings:

  - You are about to alter the column `uf` on the `points` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(2)`.
  - You are about to drop the `pointsItems` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `points` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "pointsItems" DROP CONSTRAINT "pointsItems_itemId_fkey";

-- DropForeignKey
ALTER TABLE "pointsItems" DROP CONSTRAINT "pointsItems_pointId_fkey";

-- AlterTable
ALTER TABLE "points" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "latitude" SET DATA TYPE DECIMAL(65,30),
ALTER COLUMN "longitude" SET DATA TYPE DECIMAL(65,30),
ALTER COLUMN "uf" SET DATA TYPE VARCHAR(2);

-- DropTable
DROP TABLE "pointsItems";

-- CreateTable
CREATE TABLE "pointItems" (
    "id" SERIAL NOT NULL,
    "pointId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,

    CONSTRAINT "pointItems_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "points_email_key" ON "points"("email");

-- AddForeignKey
ALTER TABLE "pointItems" ADD CONSTRAINT "pointItems_pointId_fkey" FOREIGN KEY ("pointId") REFERENCES "points"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pointItems" ADD CONSTRAINT "pointItems_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
