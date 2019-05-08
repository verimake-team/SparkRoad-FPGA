#include <stdio.h>
#include <stdint.h>

int main(int argc, char* argv[])
{
	FILE *fp, *fp1, *fp2, *fp3, *fp4;
	if(argc != 6)
	{
		printf("Usage %s: <input-binary> <24~32bit MIF file> <16~24 bit MIF file> <8~16 bit MIF file> <1~8 bit MIF file>\n", argv[0]);
		printf("Copyright Zhiyuan Wan 2017\n");
		return -1;
	}
	fp =  fopen(argv[1], "rb");
	fp1 = fopen(argv[2], "w+");
	fp2 = fopen(argv[3], "w+");
	fp3 = fopen(argv[4], "w+");
	fp4 = fopen(argv[5], "w+");
	if(!fp)
	{
		printf("File doesn't exist!\n");
		return -1;
	}
	fseek(fp, 0, SEEK_END);
	int size = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	printf("Binary length: %d bytes\n", size);
	printf("MIF files %s %s %s %s\r\n", argv[2], argv[3], argv[4], argv[5]);
	uint8_t dat[4];
	int i = 0;
	fprintf(fp1, "DEPTH = 1024;\nWIDTH = 8;\n"
				 "ADDRESS_RADIX = HEX;\n"
				 "DATA_RADIX = HEX;\n"
				 "CONTENT "
				 "BEGIN\n \n");
	fprintf(fp2, "DEPTH = 1024;\nWIDTH = 8;\n"
				 "ADDRESS_RADIX = HEX;\n"
				 "DATA_RADIX = HEX;\n"
				 "CONTENT "
				 "BEGIN\n \n");
	fprintf(fp3, "DEPTH = 1024;\nWIDTH = 8;\n"
				 "ADDRESS_RADIX = HEX;\n"
				 "DATA_RADIX = HEX;\n"
				 "CONTENT "
				 "BEGIN\n \n");
	fprintf(fp4, "DEPTH = 1024;\nWIDTH = 8;\n"
				 "ADDRESS_RADIX = HEX;\n"
				 "DATA_RADIX = HEX;\n"
				 "CONTENT "
				 "BEGIN\n \n");
	while(!feof(fp))
	{
		fread(&dat, 1, 4, fp);
		fprintf(fp1, "%04X : %02X;\n", i, dat[3]);
		fprintf(fp2, "%04X : %02X;\n", i, dat[2]);
		fprintf(fp3, "%04X : %02X;\n", i, dat[1]);
		fprintf(fp4, "%04X : %02X;\n", i, dat[0]);
		i++;
	}
	fprintf(fp1, "\nEND;\n");
	fprintf(fp2, "\nEND;\n");
	fprintf(fp3, "\nEND;\n");
	fprintf(fp4, "\nEND;\n");
	fclose(fp);
	fclose(fp1);
	fclose(fp2);
	fclose(fp3);
	fclose(fp4);
	printf("Done\n");
}
