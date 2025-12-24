/* 한글 식별자를 사용한 데이터베이스 스키마 설계 */

CREATE DATABASE IF NOT EXISTS wedding_expo;
USE wedding_expo;

-- 1. 박람회정보 테이블
CREATE TABLE IF NOT EXISTS 박람회 (
    번호 INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 번호',
    제목 VARCHAR(255) NOT NULL COMMENT '박람회 타이틀',
    지역 VARCHAR(50) NOT NULL COMMENT '카테고리 (서울, 경기 등)',
    시작일 DATE NOT NULL COMMENT '행사 시작 날짜',
    종료일 DATE NOT NULL COMMENT '행사 종료 날짜',
    장소 VARCHAR(255) NOT NULL COMMENT '주요 장소 (예: 코엑스)',
    상세주소 TEXT COMMENT '전체 주소 정보',
    이미지경로 VARCHAR(500) COMMENT '배너 이미지 URL',
    상태텍스트 VARCHAR(50) DEFAULT '상담중' COMMENT '배지 텍스트 (상담중, 마감 등)',
    노출여부 BOOLEAN DEFAULT TRUE COMMENT '사이트 노출 여부',
    등록일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 신청자정보 테이블
CREATE TABLE IF NOT EXISTS 신청자 (
    번호 INT AUTO_INCREMENT PRIMARY KEY COMMENT '신청 고유 번호',
    박람회번호 INT NOT NULL COMMENT '신청한 박람회 ID',
    성함 VARCHAR(100) NOT NULL COMMENT '신청자 이름',
    연락처 VARCHAR(20) NOT NULL COMMENT '신청자 전화번호',
    이메일 VARCHAR(100) COMMENT '신청자 이메일',
    방문예정일 DATE COMMENT '선택한 방문 날짜',
    신청일 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (박람회번호) REFERENCES 박람회(번호) ON DELETE CASCADE
);

-- 3. 가이드콘텐츠 테이블 (SEO 및 정보 제공용)
CREATE TABLE IF NOT EXISTS 가이드콘텐츠 (
    번호 INT AUTO_INCREMENT PRIMARY KEY,
    구분 VARCHAR(50) NOT NULL COMMENT '구분 (특징, 혜택, 주의사항 등)',
    제목 VARCHAR(255) NOT NULL,
    내용 TEXT NOT NULL,
    아이콘 VARCHAR(100) COMMENT '이모지 또는 아이콘 클래스명',
    정렬순서 INT DEFAULT 0
);

-- 가이드 샘플 데이터 입력
INSERT INTO 가이드콘텐츠 (구분, 제목, 내용, 아이콘)
VALUES 
('특징', '다양한 업체 비교', '50개 이상의 웨딩 관련 업체를 한 자리에서 만나볼 수 있습니다.', '✨'),
('혜택', '웨딩홀 혜택', '대관료 10-30% 할인, 식대 할인, 무료 시식제공', '🏰'),
('주의사항', '사전 준비 필수', '예산, 선호 스타일, 궁금한 점을 미리 정리해 가세요.', '⚠️');

-- 초기 샘플 데이터 입력 (박람회)
VALUES 
('비비드블랑 초대전', '서울', '2025-12-27', '2025-12-28', '비비드블랑 청담점', '서울 강남구 논현동 111-19', 'https://images.unsplash.com/photo-1519741497674-611481863552', '진행중'),
('코엑스마곡 웨딩박람회', '서울', '2025-12-27', '2025-12-28', '코엑스마곡', '서울 강서구 공항대로 163', 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622', '입장권'),
('용산 아이파크몰 박람회', '서울', '2025-12-27', '2025-12-28', '아이파크몰', '서울 용산구 한강대로23길 55', 'https://images.unsplash.com/photo-1519225495810-751783d9cfdd', '상담중');
