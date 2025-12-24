import React from 'react';
import styles from './LayoutComponents.module.css';

export const Header = () => {
    return (
        <header className={styles.header}>
            <div className={styles.container}>
                <div className={styles.logo}>🌸 웨딩박람회 가이드</div>
                <nav className={styles.nav}>
                    <a href="#">박람회 일정</a>
                    <a href="#">박람회 혜택</a>
                    <a href="#">커뮤니티</a>
                </nav>
                <button className="btn-primary">로그인</button>
            </div>
        </header>
    );
};

export const Footer = () => {
    return (
        <footer className={styles.footer}>
            <div className={styles.container}>
                <div className={styles.footerBrand}>
                    <h3>웨딩박람회 가이드</h3>
                    <p>내 손안의 똑똑한 결혼 준비 파트너</p>
                </div>
                <div className={styles.footerLinks}>
                    <div>
                        <h4>서비스</h4>
                        <a href="#">개인정보 처리방침</a>
                        <a href="#">이용약관</a>
                    </div>
                    <div>
                        <h4>고객지원</h4>
                        <a href="#">문의하기</a>
                        <a href="#">공지사항</a>
                    </div>
                </div>
            </div>
            <div className={styles.copyright}>
                © 2025 Wedding Expo Guide. All rights reserved.
            </div>
        </footer>
    );
};
