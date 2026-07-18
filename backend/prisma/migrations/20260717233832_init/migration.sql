/*
  Warnings:

  - You are about to alter the column `atsScore` on the `ResumeVersion` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - You are about to drop the `Profile` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `company` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jobTitle` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Application` table without a default value. This is not possible if the table is not empty.
  - Made the column `userId` on table `Candidate` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `updatedAt` to the `ResumeVersion` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Candidate" DROP CONSTRAINT "Candidate_userId_fkey";

-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "ResumeVersion" DROP CONSTRAINT "ResumeVersion_profileId_fkey";

-- AlterTable
ALTER TABLE "Application" ADD COLUMN     "company" TEXT NOT NULL,
ADD COLUMN     "jobTitle" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "platform" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Candidate" ADD COLUMN     "isBlocked" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "userId" SET NOT NULL;

-- AlterTable
ALTER TABLE "ResumeVersion" ADD COLUMN     "pdfUrl" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "resumeJson" DROP NOT NULL,
ALTER COLUMN "atsScore" SET DATA TYPE INTEGER;

-- DropTable
DROP TABLE "Profile";

-- CreateTable
CREATE TABLE "ResumeProfile" (
    "id" TEXT NOT NULL,
    "profileName" TEXT NOT NULL,
    "summary" TEXT,
    "skills" JSONB,
    "experience" JSONB,
    "education" JSONB,
    "projects" JSONB,
    "certifications" JSONB,
    "languages" JSONB,
    "candidateId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ResumeProfile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ResumeProfile_candidateId_idx" ON "ResumeProfile"("candidateId");

-- AddForeignKey
ALTER TABLE "Candidate" ADD CONSTRAINT "Candidate_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResumeProfile" ADD CONSTRAINT "ResumeProfile_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResumeVersion" ADD CONSTRAINT "ResumeVersion_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "ResumeProfile"("id") ON DELETE CASCADE ON UPDATE CASCADE;
