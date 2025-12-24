import React from 'react';
import styles from './ExpoCard.module.css';

interface ExpoCardProps {
    id: number;
    title: string;
    date: string;
    location: string;
    imageUrl: string;
    status?: string;
}

const ExpoCard: React.FC<ExpoCardProps> = ({ title, date, location, imageUrl, status = "상담중" }) => {
    return (
        <div className={styles.card}>
            <div className={styles.imageWrapper}>
                <img src={imageUrl} alt={title} className={styles.image} />
            </div>
            <div className={styles.content}>
                <div className={styles.row}>
                    <span className={styles.dateInfo}>📅 {date}</span>
                    <span className={styles.badge}>{status}</span>
                </div>
                <h3 className={styles.title}>{title}</h3>
                <p className={styles.location}>
                    <span className={styles.icon}>📍</span> {location}
                </p>
                <button className="btn-primary" style={{ width: '100%', marginTop: '1.2rem', borderRadius: '4px' }}>
                    무료초대권 신청하기
                </button>
            </div>
        </div>
    );
};

export default ExpoCard;
