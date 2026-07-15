import { IsEmail, IsOptional, IsString } from 'class-validator';

export class CreateCandidateDto {
  // eslint-disable-next-line @typescript-eslint/no-unsafe-call
  @IsString()
  firstName!: string;

  @IsString()
  lastName!: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsOptional()
  @IsString()
  phone?: string;

  @IsOptional()
  @IsString()
  country?: string;

  @IsOptional()
  @IsString()
  notes?: string;
}
