

   CREATE SEQUENCE  "QUICK"."APPLY_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."BOARDREPLY_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."BOARD_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

   CREATE SEQUENCE  "QUICK"."GROUPBOARD_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."GROUPREPLY_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."GROUP_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."MEMBER_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;

   CREATE SEQUENCE  "QUICK"."MESSAGE_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


   CREATE SEQUENCE  "QUICK"."REPORT_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

  CREATE TABLE "QUICK"."APPLY" 
   (	"APPLY_NUM" NUMBER, 
	"APPLY_HOST" NUMBER, 
	"APPLY_SECTION" VARCHAR2(100 BYTE), 
	"APPLY_FILENAME" VARCHAR2(100 BYTE), 
	"APPLY_FILEPATH" VARCHAR2(500 BYTE), 
	"APPLY_FILESIZE" VARCHAR2(30 BYTE), 
	"APPLY_CONTENT" VARCHAR2(2000 BYTE), 
	"APPLY_LOCATION" VARCHAR2(100 BYTE), 
	"APPLY_SUBJECT" VARCHAR2(50 BYTE), 
	"APPLY_SUBTITLE" VARCHAR2(50 BYTE), 
	"APPLY_CREATEDATE" DATE, 
	"APPLY_MODIFYDATE" DATE, 
	"APPLY_CLOSEDATE" DATE, 
	"APPLY_RECOMMEND" NUMBER, 
	"APPLY_READCOUNT" NUMBER, 
	"APPLY_CATEGORY" VARCHAR2(50 BYTE), 
	"APPLY_INOUT" VARCHAR2(50 BYTE), 
	"APPLY_COST" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."BOARD" 
   (	"BOARD_NUM" NUMBER, 
	"BOARD_WRITER" NUMBER, 
	"BOARD_SUBJECT" VARCHAR2(500 BYTE), 
	"BOARD_CONTENT" VARCHAR2(2000 BYTE), 
	"BOARD_CREATEDATE" DATE, 
	"BOARD_MODIFYDATE" DATE, 
	"BOARD_FILENAME" VARCHAR2(500 BYTE), 
	"BOARD_FILEPATH" VARCHAR2(500 BYTE), 
	"BOARD_FILESIZE" VARCHAR2(100 BYTE), 
	"BOARD_VISIBLE" NUMBER, 
	"BOARD_RECOMMAND" NUMBER, 
	"BOARD_READCOUNT" NUMBER, 
	"BOARD_SECTION" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."BOARDREPLY" 
   (	"BOARDREPLY_NUM" NUMBER, 
	"BOARDREPLY_WRITER" NUMBER, 
	"BOARDREPLY_BOARDNUM" NUMBER, 
	"BOARDREPLY_CONTENT" VARCHAR2(500 BYTE), 
	"BOARDREPLY_CREATEDATE" DATE, 
	"BOARDREPLY_MODIFYDATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

 

  CREATE TABLE "QUICK"."GGROUP" 
   (	"GROUP_NUM" NUMBER, 
	"GROUP_CATEGORY" VARCHAR2(50 BYTE), 
	"GROUP_INOUT" VARCHAR2(50 BYTE), 
	"GROUP_HOST" NUMBER, 
	"GROUP_SUBJECT" VARCHAR2(50 BYTE), 
	"GROUP_SUBTITLE" VARCHAR2(50 BYTE), 
	"GROUP_LOCATION" VARCHAR2(500 BYTE), 
	"GROUP_DATE" DATE, 
	"GROUP_COST" NUMBER, 
	"GROUP_APPLYNUM" NUMBER, 
	"GROUP_FILENAME" VARCHAR2(100 BYTE), 
	"GROUP_FILEPATH" VARCHAR2(500 BYTE), 
	"GROUP_FILESIZE" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;


  CREATE TABLE "QUICK"."GROUPBOARD" 
   (	"GROUPBOARD_NUM" NUMBER, 
	"GROUPBOARD_GROUPNUM" NUMBER, 
	"GROUPBOARD_WRITER" NUMBER, 
	"GROUPBOARD_SUBJECT" VARCHAR2(50 BYTE), 
	"GROUPBOARD_CONTENT" VARCHAR2(2000 BYTE), 
	"GROUPBOARD_CREATEDATE" DATE, 
	"GROUPBOARD_MODIFYDATE" DATE, 
	"GROUPBOARD_FILENAME" VARCHAR2(100 BYTE), 
	"GROUPBOARD_FILEPATH" VARCHAR2(500 BYTE), 
	"GROUPBOARD_FILESIZE" VARCHAR2(30 BYTE), 
	"GROUPBOARD_VISIBLE" NUMBER, 
	"GROUPBOARD_READCOUNT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."GROUPREPLY" 
   (	"GROUPREPLY_NUM" NUMBER, 
	"GROUPREPLY_WRITER" NUMBER, 
	"GROUPREPLY_BOARDNUM" NUMBER, 
	"GROUPREPLY_CONTENT" VARCHAR2(500 BYTE), 
	"GROUPREPLY_CREATEDATE" DATE, 
	"GROUPREPLY_MODIFYDATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "QUICK"."JOIN" 
   (	"JOIN_GROUPNUM" NUMBER, 
	"JOIN_MEMBERNUM" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."MEMBER" 
   (	"MEMBER_NUM" NUMBER, 
	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"MEMBER_PASSWORD" VARCHAR2(20 BYTE), 
	"MEMBER_NICKNAME" VARCHAR2(20 BYTE), 
	"MEMBER_LEVEL" VARCHAR2(10 BYTE), 
	"MEMBER_SNS" VARCHAR2(50 BYTE), 
	"MEMBER_REPORT" NUMBER, 
	"MEMBER_FILENAME" VARCHAR2(100 BYTE), 
	"MEMBER_FILEPATH" VARCHAR2(500 BYTE), 
	"MEMBER_FILESIZE" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."MESSAGE" 
   (	"MESSAGE_NUM" NUMBER, 
	"MESSAGE_SENDER" NUMBER, 
	"MESSAGE_RECEIVER" NUMBER, 
	"MESSAGE_CONTENT" VARCHAR2(500 BYTE), 
	"MESSAGE_DATE" DATE, 
	"MESSAGE_READ" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."RECOMMEND" 
   (	"RECOMMEND_MEMBERNUM" NUMBER, 
	"RECOMMEND_BOARDNUM" NUMBER, 
	"RECOMMEND_TYPE" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE TABLE "QUICK"."REPORT" 
   (	"REPORT_NUM" NUMBER, 
	"REPORT_SENDER" NUMBER, 
	"REPORT_RECEIVER" NUMBER, 
	"REPORT_CONTENT" VARCHAR2(500 BYTE), 
	"REPORT_BOARDNUM" NUMBER, 
	"REPORT_BOARDTYPE" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;


  CREATE UNIQUE INDEX "QUICK"."SYS_C004235" ON "QUICK"."REPORT" ("REPORT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004250" ON "QUICK"."GROUPREPLY" ("GROUPREPLY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004257" ON "QUICK"."BOARDREPLY" ("BOARDREPLY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004278" ON "QUICK"."MEMBER" ("MEMBER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004346" ON "QUICK"."APPLY" ("APPLY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004367" ON "QUICK"."GGROUP" ("GROUP_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004381" ON "QUICK"."MESSAGE" ("MESSAGE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004415" ON "QUICK"."GROUPBOARD" ("GROUPBOARD_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  CREATE UNIQUE INDEX "QUICK"."SYS_C004425" ON "QUICK"."BOARD" ("BOARD_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;

  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_HOST" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_SECTION" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_LOCATION" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_SUBTITLE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_MODIFYDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_CLOSEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_RECOMMEND" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_READCOUNT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_CATEGORY" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_INOUT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" MODIFY ("APPLY_COST" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."APPLY" ADD PRIMARY KEY ("APPLY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_WRITER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_MODIFYDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_VISIBLE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_RECOMMAND" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" MODIFY ("BOARD_READCOUNT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARD" ADD PRIMARY KEY ("BOARD_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_WRITER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_BOARDNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" MODIFY ("BOARDREPLY_MODIFYDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."BOARDREPLY" ADD PRIMARY KEY ("BOARDREPLY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;


  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_CATEGORY" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_INOUT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_HOST" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_SUBTITLE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_LOCATION" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_COST" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" MODIFY ("GROUP_APPLYNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GGROUP" ADD PRIMARY KEY ("GROUP_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_GROUPNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_WRITER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_SUBJECT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_MODIFYDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_VISIBLE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" MODIFY ("GROUPBOARD_READCOUNT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPBOARD" ADD PRIMARY KEY ("GROUPBOARD_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_WRITER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_BOARDNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_CREATEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" MODIFY ("GROUPREPLY_MODIFYDATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."GROUPREPLY" ADD PRIMARY KEY ("GROUPREPLY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."JOIN" MODIFY ("JOIN_GROUPNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."JOIN" MODIFY ("JOIN_MEMBERNUM" NOT NULL ENABLE);

  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_NICKNAME" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_LEVEL" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" MODIFY ("MEMBER_REPORT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MEMBER" ADD PRIMARY KEY ("MEMBER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_SENDER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_RECEIVER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" MODIFY ("MESSAGE_READ" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."MESSAGE" ADD PRIMARY KEY ("MESSAGE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

  ALTER TABLE "QUICK"."RECOMMEND" MODIFY ("RECOMMEND_MEMBERNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."RECOMMEND" MODIFY ("RECOMMEND_BOARDNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."RECOMMEND" MODIFY ("RECOMMEND_TYPE" NOT NULL ENABLE);

  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_SENDER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_RECEIVER" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_BOARDNUM" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" MODIFY ("REPORT_BOARDTYPE" NOT NULL ENABLE);
 
  ALTER TABLE "QUICK"."REPORT" ADD PRIMARY KEY ("REPORT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
