CREATE DATABASE IF NOT EXISTS wedding_expo;
USE wedding_expo;

-- 박람회 정보 테이블
CREATE TABLE IF NOT EXISTS expos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    date_start DATE NOT NULL,
    date_end DATE NOT NULL,
    image_url VARCHAR(500),
    status ENUM('active', 'closed') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 초대권 신청자 테이블
CREATE TABLE IF NOT EXISTS applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    expo_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    visit_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (expo_id) REFERENCES expos(id) ON DELETE CASCADE
);

-- 초기 데이터 샘플
INSERT INTO expos (title, description, location, date_start, date_end, image_url, status)
VALUES 
('서울 대형 웨딩페어', '강남 코엑스에서 열리는 프리미엄 웨딩박람회', '서울 강남구 코엑스', '2025-01-10', '2025-01-12', 'https://images.unsplash.com/photo-1519741497674-611481863552', 'active'),
('인천 웨딩박람회', '송도 컨벤시아에서 열리는 인천 최대 규모 박람회', '인천 연수구 송도컨벤시아', '2025-01-18', '2025-01-19', 'https://images.unsplash.com/photo-1511795409834-ef04bbd61622', 'active');
