-- CreateTable
CREATE TABLE "points" (
    "id" SERIAL NOT NULL,
    "image" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "whatsapp" TEXT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "uf" TEXT NOT NULL,

    CONSTRAINT "points_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "items" (
    "id" SERIAL NOT NULL,
    "image" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PointItem" (
    "id" SERIAL NOT NULL,
    "pointId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,

    CONSTRAINT "PointItem_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PointItem" ADD CONSTRAINT "PointItem_pointId_fkey" FOREIGN KEY ("pointId") REFERENCES "points"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PointItem" ADD CONSTRAINT "PointItem_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
