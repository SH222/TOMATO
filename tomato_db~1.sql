------------------------------------��ǰ ���̺�-----------------------------
��ǰ��ȣ
ȸ����ȣ
��ǰ�̸�
��ǰ����ī�װ�
��ǰ����ī�װ�
��ǰ����
��ǰ�������?
��ǰ����
��ȸ��
��ǰ����
��ǰ����
��ۺ񿩺�?
�ŷ�����
����������̸�?
��������ϰ��
��ǰ�ŷ�����




CREATE TABLE ITEM(
    ITEM_NO             NUMBER          PRIMARY KEY,
    MEMBER_NO           NUMBER,
    ITEM_NAME           VARCHAR2(100)   NOT NULL,
    ITEM_MAIN_CATEGORY  VARCHAR2(100)   NOT NULL,
    ITEM_SUB_CATEGORY   VARCHAR2(100),
    ITEM_PRICE          NUMBER          NOT NULL,
    ITEM_ENROLL_DATE    DATE            DEFAULT SYSDATE,
    ITEM_STATE          VARCHAR2(30)    NOT NULL,
    READCOUNT           NUMBER          DEFAULT 0,
    ITEM_CONTENT        VARCHAR2(1000),
    ITEM_AMOUNT         NUMBER          NOT NULL,
    ITEM_DELIVERY_NY    NUMBER          NOT NULL,
    ITEM_DEAL_REGION    VARCHAR2(50)    NOT NULL,
    ITEM_THUM_FILENAME  VARCHAR2(100),
    ITEM_THUM_FILEPATH  VARCHAR2(100),
    ITEM_DEAL_STATE     VARCHAR2(30)    NOT NULL,
    CONSTRAINT FK_ITEM_MEMBER_NO FOREIGN KEY (MEMBER_NO)REFERENCES 
    MEMBER(MEMBER_NO) ON DELETE SET NULL
);


CREATE SEQUENCE ITEM_NO_SEQ;
DROP TABLE ITEM;
commit;
SELECT * FROM ITEM;


---------------------------------------1:1���� ���̺�-----------------------
���� ��ȣ
�ۼ��� ȸ����ȣ
�ۼ���
���ǳ���
�ۼ���
�����̸�
���ϰ��?
��з�?
�Һз�
�亯���� 
�亯����
�亯 �ۼ���

create table MTOM_INQUIRY(
MTOM_INQUIRY_NO NUMBER PRIMARY KEY,
MEMBER_NO NUMBER,
MTOM_INQUIRY_WRITER VARCHAR2(40) NOT NULL,
MTOM_INQUIRY_CONTENT VARCHAR2(1000) NOT NULL,
MTOM_INQUIRY_DATE DATE DEFAULT SYSDATE,
FILE_NAME VARCHAR2(100),
FILE_PATH VARCHAR2(100),
MTOM_INQUIRY_MAIN_CATEGORY VARCHAR2(40) NOT NULL,
MTOM_INQUIRY_SUB_CATEGORY VARCHAR2(40) NOT NULL,
MTOM_INQUIRY_ANSWER_STATE NUMBER NOT NULL,
MTOM_INQUIRY_ANSWER_CONTENT VARCHAR2(1000),
MTOM_INQUIRY_ANSWER_DATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_MTOM_INQUIRY_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES 
MEMBER(MEMBER_NO) ON DELETE CASCADE
);
CREATE SEQUENCE MTOM_INQUIRY_NO_SEQ;

DROP TABLE MTOM_INQUIRY;
SELECT * FROM MTOM_INQUIRY;
COMMIT;


------------------------------- �������� ���̺�------------------------------
�������� ��ȣ
����
����
�ۼ���
�ۼ��� 
��ȸ��
�����̸�
���ϰ��?

CREATE TABLE NOTICE(
NOTICE_NO NUMBER PRIMARY KEY,
NOTICE_TITLE VARCHAR2(40) NOT NULL,
NOTICE_CONTENT VARCHAR2(1000) NOT NULL,
NOTICE_WRITER VARCHAR(40) NOT NULL,
NOTICE_DATE DATE DEFAULT SYSDATE,
READCOUNT NUMBER,
FILE_NAME VARCHAR2(100),
FILE_PATH VARCHAR2(100),
CONSTRAINT FK_NOTICE_WRITER FOREIGN KEY (NOTICE_WRITER)REFERENCES 
MEMBER(SHOP_NAME) ON DELETE SET NULL
);

CREATE SEQUENCE NOTICE_NO_SEQ;

DROP TABLE NOTICE;
SELECT * FROM NOTICE;
COMMIT;

-------------------------------ȸ�����̺�  = ����----------------------

ȸ����ȣ
�̸���
��й��?
�̸�
��������
����ó
���ּ�
������?
����
�����̸�
���� �Ұ���
���� �湮��
�����̸�
���� ���?


CREATE TABLE MEMBER(
MEMBER_NO NUMBER PRIMARY KEY,
EMAIL VARCHAR2(100) NOT NULL UNIQUE,
MEMBER_PW VARCHAR2(40) NOT NULL,
MEMBER_NAME VARCHAR2(40) NOT NULL,
ENROLL_DATE DATE DEFAULT SYSDATE,
PHONE VARCHAR2(40),
ADDRESS VARCHAR2(100),
ZIP_CODE VARCHAR2(50),
MEMBER_BANK VARCHAR2(50),
MEMBER_ACCOUNT VARCHAR2(50),
SHOP_NAME VARCHAR2(40) UNIQUE,
SHOP_CONTENT VARCHAR2(500),
SHOP_READCOUNT NUMBER DEFAULT 0,
FILE_NAME VARCHAR2(100),
FILE_PATH VARCHAR2(100)
);

CREATE SEQUENCE MEMBER_NO_SEQ;
update member set email = 'asfasdf1@naver.com' where  member_no=1;
DROP TABLE MEMBER;
SELECT * FROM MEMBER;
COMMIT;
------------------------------ �˸� ���̺� -----------------------------
�˸���ȣ 
�Ǹ��� ȸ����ȣ
������ �����̸�
�˸�����
��ǰ��
��۳���?
�ı⳻�� 
�˸� ���? �ð�

CREATE TABLE ALARM(
ALARM_NO NUMBER PRIMARY KEY,
ALARM_SELLER_NO NUMBER,
ALARM_BUYER_SHOP_NAME VARCHAR2(40),
ALARM_TYPE VARCHAR2(100) NOT NULL,
ALARM_ITEM_NAME VARCHAR2(100),
ALARM_ITEM_INQUIRY_COMMENT VARCHAR2(1000),
ALARM_MEMBER_REVIEW_COMMENT VARCHAR2(500),
ALARM_DATE DATE DEFAULT SYSDATE,
CONSTRAINT FK_ARARM_SELLER_NO FOREIGN KEY (ALARM_SELLER_NO)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE SET NULL,
CONSTRAINT FK_ARARM_BUYER_SHOP_NAME FOREIGN KEY (ALARM_BUYER_SHOP_NAME)REFERENCES 
MEMBER(SHOP_NAME) ON DELETE SET NULL
);

CREATE SEQUENCE ALARM_NO_SEQ;
DROP TABLE ALARM;
SELECT * FROM ALARM;
COMMIT;

------------------------------- �� ���̺� -------------------------------
�� 
������ȣ(��ǰ�� ���� ����)
��ǰ��ȣ

CREATE TABLE FAVORITE(
SHOP_NO NUMBER NOT NULL,
ITEM_NO NUMBER NOT NULL,
CONSTRAINT FK_SHOP_NO FOREIGN KEY (SHOP_NO)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE CASCADE,
CONSTRAINT FK_ITEM_NO FOREIGN KEY (ITEM_NO)REFERENCES
ITEM(ITEM_NO) ON DELETE CASCADE
);

DROP TABLE FAVORITE;
SELECT * FROM FAVORITE;
COMMIT;

-------------------------------�˻��� ���̺� ------------------------------
�˻�����
�˻�����
�˻� ȸ��

CREATE TABLE SEARCH(
SEARCH_CONTENT VARCHAR2(100) PRIMARY KEY,
SEARCH_DATE DATE DEFAULT SYSDATE,
SEARCH_COUNT NUMBER
);

DROP TABLE SEARCH;
SELECT * FROM SEARCH;
COMMIT;
------------------------------��ȣ�ϴ� ����(3����) ���̺�-------------------
ȸ����ȣ
�ּҼ���

CREATE TABLE MEMBER_ADDRESS(
EMAIL VARCHAR2(100),
ADDR_CHOICE VARCHAR2(100),
CONSTRAINT FK_MEMBER_ADDRS_EMAIL FOREIGN KEY (EMAIL)REFERENCES 
MEMBER(EMAIL) ON DELETE CASCADE
);

DROP TABLE MEMBER_ADDRESS;
SELECT * FROM MEMBER_ADDRESS;
COMMIT;
-----------------------------���� �ı� ���̺� ---------------------------------

�ı���?
������ȣ
�ۼ��� ���� �̸�
�ı� �ۼ���
�ı⳻��
����

CREATE TABLE REVIEW(
REVIEW_NO NUMBER PRIMARY KEY,
SHOP_NO NUMBER,
REVIEW_WRITER VARCHAR2(40),
REVIEW_DATE DATE DEFAULT SYSDATE,
REVIEW_CONTENT VARCHAR2(500) NOT NULL,
REVIEW_SCORE NUMBER,
CONSTRAINT FK_REVIEW_SHOP_NO FOREIGN KEY (SHOP_NO)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE CASCADE,
CONSTRAINT FK_REVIEW_WRITER FOREIGN KEY (REVIEW_WRITER)REFERENCES 
MEMBER(SHOP_NAME) ON DELETE SET NULL
);

CREATE SEQUENCE REVIEW_NO_SEQ;

DROP TABLE REVIEW;
SELECT * FROM REVIEW;
COMMIT;
-------------------------------  ���� ���̺�---------------------------------
��ǰ��ȣ
ȸ����ȣ
������ ����ID
�����ݾ� 
���� ����
������
ī�� ���ι�ȣ
���� ������
���� �ŷ�ID
ȯ�� ����

CREATE TABLE PAYMENT(
ITEM_NO NUMBER,
MEMBER_NO NUMBER,
IMP_UID VARCHAR2(40) ,
PAYMENT_PAY NUMBER NOT NULL,
PAYMENT_STATE VARCHAR2(40) NOT NULL,
PAYMENT_DATE DATE DEFAULT SYSDATE,
PAYMENT_APPLY_NUM VARCHAR2(40) NOT NULL,
PAYMENT_COMMISSION NUMBER,
MERCHANT_UID VARCHAR2(40) NOT NULL,
PAYMENT_NY VARCHAR2(40) NOT NULL,
CONSTRAINT FK_PAYMENT_ITEM_NO FOREIGN KEY (ITEM_NO)REFERENCES 
ITEM(ITEM_NO) ON DELETE SET NULL,
CONSTRAINT FK_PAYMENT_MEMBER_NO FOREIGN KEY (MEMBER_NO)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE SET NULL
);

DROP TABLE PAYMENT;
SELECT * FROM PAYMENT;
COMMIT;

-------------------------- �ŷ� ���̺� ----------------------------------------
�ŷ� ��ȣ 
������
�Ǹ���
��ǰ��ȣ
�ŷ�����

CREATE TABLE DEAL(
DEAL_NO NUMBER PRIMARY KEY ,
BUYER NUMBER ,
SALER NUMBER ,
ITEM_NO NUMBER ,
DEAL_STATE VARCHAR2(20),
DEAL_END_DATE DATE,
CONSTRAINT FK_BUYER FOREIGN KEY (BUYER)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE SET NULL,
CONSTRAINT FK_SALER FOREIGN KEY (SALER)REFERENCES 
MEMBER(MEMBER_NO) ON DELETE SET NULL,
CONSTRAINT FK_DEAL_ITEM_NO FOREIGN KEY (ITEM_NO)REFERENCES 
ITEM(ITEM_NO) ON DELETE SET NULL
);

CREATE SEQUENCE DEAL_NO_SEQ;
DROP TABLE DEAL;
SELECT * FROM DEAL;
COMMIT;

------------------------------ ��ǰ ���� ���̺� --------------------------
���? ��ȣ
�ۼ��� �г���
��۴޸�? ��ǰ��ȣ
���? ����
���? �ۼ���
���? �ܰ�
��۴޸�? ��۹��?

CREATE TABLE ITEM_INQUIRY(
ITEM_INQUIRY_NO NUMBER PRIMARY KEY,
ITEM_INQUIRY_WRITER VARCHAR2(40),
ITEM_REF NUMBER,
ITEM_INQUIRY_COMMENT VARCHAR2(1000) NOT NULL,
ITEM_INQUIRY_DATE DATE DEFAULT SYSDATE,
ITEM_INQUIRY_LEVEL NUMBER NOT NULL,
ITEM_INQUIRY_REF NUMBER ,
CONSTRAINT FK_ITEM_REF FOREIGN KEY (ITEM_REF)REFERENCES 
ITEM(ITEM_NO) ON DELETE SET NULL,
CONSTRAINT FK_ITEM_INQUIRY_REF FOREIGN KEY (ITEM_INQUIRY_REF)REFERENCES 
ITEM_INQUIRY(ITEM_INQUIRY_NO) ON DELETE SET NULL
);

INSERT INTO ITEM_INQUIRY VALUES(1,'A',1,'ASFASDF',SYSDATE,1,1);

CREATE SEQUENCE ITEM_INQUIRY_NO_SEQ;

DROP TABLE ITEM_INQUIRY;
SELECT * FROM ITEM_INQUIRY;
COMMIT;


------------------------------��ǰ �̹��� ���̺�-------------------------
��ǰ ��ȣ
�����̸�
���� ���?
�����? ���� ����

CREATE TABLE ITEM_IMAGE(
ITEM_NO NUMBER NOT NULL,
FILE_NAME VARCHAR2(100) NOT NULL,
FILE_PATH VARCHAR2(100) NOT NULL,
THUM_NY NUMBER NOT NULL,
CONSTRAINT FK_ITEM_IMAGE_ITEM_NO FOREIGN KEY (ITEM_NO)REFERENCES 
ITEM(ITEM_NO) ON DELETE SET NULL
);

DROP TABLE ITEM_IMAGE;
SELECT * FROM ITEM_IMAGE;
COMMIT;










