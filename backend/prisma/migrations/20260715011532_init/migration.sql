/*
  Warnings:

  - You are about to drop the `Application` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Candidate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ResumeVersion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Application" DROP CONSTRAINT "Application_resumeVersionId_fkey";

-- DropForeignKey
ALTER TABLE "Candidate" DROP CONSTRAINT "Candidate_userId_fkey";

-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_candidateId_fkey";

-- DropForeignKey
ALTER TABLE "ResumeVersion" DROP CONSTRAINT "ResumeVersion_profileId_fkey";

-- DropTable
DROP TABLE "Application";

-- DropTable
DROP TABLE "Candidate";

-- DropTable
DROP TABLE "Profile";

-- DropTable
DROP TABLE "ResumeVersion";

-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "ApplicationStatus";
