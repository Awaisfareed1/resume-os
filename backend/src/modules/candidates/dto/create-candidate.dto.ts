import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsEmail, IsOptional, IsString } from 'class-validator';

export class CreateCandidateDto {
  @ApiProperty({
    example: 'Muhammad',
    description: 'Candidate first name',
  })
  @IsString()
  firstName: string;

  @ApiProperty({
    example: 'Awais',
    description: 'Candidate last name',
  })
  @IsString()
  lastName: string;

  @ApiPropertyOptional({
    example: 'awais@example.com',
  })
  @IsOptional()
  @IsEmail()
  email?: string;

  @ApiPropertyOptional({
    example: '+923001234567',
  })
  @IsOptional()
  @IsString()
  phone?: string;

  @ApiPropertyOptional({
    example: 'Pakistan',
  })
  @IsOptional()
  @IsString()
  country?: string;

  @ApiPropertyOptional({
    example: 'Senior Backend Developer',
  })
  @IsOptional()
  @IsString()
  notes?: string;
}
