/*
  Warnings:

  - You are about to drop the column `gatewayTransactionId` on the `payment` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[orderId]` on the table `Payment` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `Payment_gatewayTransactionId_key` ON `payment`;

-- AlterTable
ALTER TABLE `payment` DROP COLUMN `gatewayTransactionId`,
    ADD COLUMN `orderId` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Payment_orderId_key` ON `Payment`(`orderId`);
