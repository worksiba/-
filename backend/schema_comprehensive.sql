/* 종합 웨딩박람회 시스템 데이터베이스 스키마 (최종본) */

CREATE DATABASE IF NOT EXISTS wedding_platform;
USE wedding_platform;

-- 1. 회원관리 테이블
CREATE TABLE IF NOT EXISTS 회원 (
    회원번호 INT AUTO_INCREMENT PRIMARY KEY,
    아이디 VARCHAR(50) UNIQUE NOT NULL,
    비밀번호 VARCHAR(255) NOT NULL,
    성함 VARCHAR(100) NOT NULL,
    연락처 VARCHAR(20) NOT NULL,
    이메일 VARCHAR(100),
    가입일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    마지막접속일 DATETIME,
    상태 ENUM('정상', '정지', '탈퇴') DEFAULT '정상'
);

-- 2. 박람회 카테고리 (서울, 경기, 지방, 허니문, 스드메 등)
CREATE TABLE IF NOT EXISTS 카테고리 (
    카테고리번호 INT AUTO_INCREMENT PRIMARY KEY,
    명칭 VARCHAR(100) NOT NULL COMMENT '서울, 경기, 지방, 허니문, 스드메 등',
    부모카테고리번호 INT DEFAULT NULL COMMENT '대분류 아래 소분류(예: 지방 하위 부산)',
    정렬순서 INT DEFAULT 0
);

-- 3. 박람회 및 이벤트 정보 (게시판 성격 포함)
CREATE TABLE IF NOT EXISTS 박람회게시판 (
    글번호 INT AUTO_INCREMENT PRIMARY KEY,
    카테고리번호 INT NOT NULL,
    제목 VARCHAR(255) NOT NULL,
    내용 TEXT,
    장소 VARCHAR(255) NOT NULL,
    상세주소 TEXT,
    시작일 DATE NOT NULL,
    종료일 DATE NOT NULL,
    이미지경로 VARCHAR(500),
    상태배지 VARCHAR(50) DEFAULT '모집중',
    조회수 INT DEFAULT 0,
    노출여부 BOOLEAN DEFAULT TRUE,
    등록자번호 INT,
    등록일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (카테고리번호) REFERENCES 카테고리(카테고리번호),
    FOREIGN KEY (등록자번호) REFERENCES 회원(회원번호)
);

-- 4. 결혼웨딩정보 (일반 텍스트 게시판)
CREATE TABLE IF NOT EXISTS 웨딩정보게시판 (
    글번호 INT AUTO_INCREMENT PRIMARY KEY,
    제목 VARCHAR(255) NOT NULL,
    내용 TEXT NOT NULL,
    조회수 INT DEFAULT 0,
    등록자번호 INT,
    등록일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (등록자번호) REFERENCES 회원(회원번호)
);

-- 5. 무료초대권 신청 내역
CREATE TABLE IF NOT EXISTS 신청내역 (
    신청번호 INT AUTO_INCREMENT PRIMARY KEY,
    박람회글번호 INT NOT NULL,
    회원번호 INT COMMENT '비회원 신청 가능하므로 NULL 허용',
    신청자성함 VARCHAR(100) NOT NULL,
    신청자연락처 VARCHAR(20) NOT NULL,
    방문예정일 DATE,
    신청일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    상태 ENUM('대기', '확인', '취소') DEFAULT '대기',
    FOREIGN KEY (박람회글번호) REFERENCES 박람회게시판(글번호),
    FOREIGN KEY (회원번호) REFERENCES 회원(회원번호)
);

-- 관리용 초기 카테고리 데이터
INSERT INTO 카테고리 (명칭) VALUES ('서울웨딩박람회'), ('경기웨딩박람회'), ('지방웨딩박람회'), ('허니문비교견적'), ('스드메예물'), ('웨딩박람회달력'), ('결혼웨딩정보');

-- 지방 하위 소분류 (이미지 기준 15개 지역)
INSERT INTO 카테고리 (명칭, 부모카테고리번호) 
VALUES 
('부산', 3), ('대구', 3), ('인천', 3), ('광주', 3), ('대전', 3), 
('울산', 3), ('세종', 3), ('강원', 3), ('충북', 3), ('충남', 3), 
('전북', 3), ('전남', 3), ('경북', 3), ('경남', 3), ('제주', 3);
