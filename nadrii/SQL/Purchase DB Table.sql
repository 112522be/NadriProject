DROP TABLE purchase;

CREATE TABLE purchase(
 POST_NO			 NUMERIC NOT NULL PRIMARY KEY,
 TICKET_TITLE        VARCHAR2(100),
 TICKET_IMAGE        VARCHAR2(200),
 BOOKING_DATE        VARCHAR2(20),
 CANCEL_DATE		 VARCHAR2(20),
 TICKET_PRICEALL     VARCHAR2(250),
 CONTENT_ID          NUMERIC  ,
 CONTENT_TYPEID      NUMERIC ,
 FLAG_BP			 VARCHAR2(20),
 REG_DATE            DATE
);

CREATE SEQUENCE SEQ_PURCHASE_POST_NO START WITH 50000 INCREMENT BY 1;

COMMIT;




/// 추후 수정 / 추가 할 것들
1. 예매정보입력 (addBooking)
  - 이름 / 연락처 / 이메일
  