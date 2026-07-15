import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { HealthModule } from './modules/health/health.module';
import { CandidatesModule } from './modules/candidates/candidates.module';
import { AuthModule } from './modules/auth/auth.module';

@Module({
  imports: [PrismaModule, HealthModule, CandidatesModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
