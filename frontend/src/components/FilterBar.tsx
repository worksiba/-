import React from 'react';
import styles from './FilterBar.module.css';

const FilterBar = () => {
    return (
        <div className={styles.wrapper}>
            <div className={styles.container}>
                <div className={styles.filterGroup}>
                    <button className={`${styles.filterBtn} ${styles.active}`}>전체</button>
                    <button className={styles.filterBtn}>서울</button>
                    <button className={styles.filterBtn}>경기/인천</button>
                    <button className={styles.filterBtn}>부산/경상</button>
                    <button className={styles.filterBtn}>기타</button>
                </div>
                <div className={styles.sortGroup}>
                    <select className={styles.select}>
                        <option>최신순</option>
                        <option>종료임박순</option>
                    </select>
                </div>
            </div>
        </div>
    );
};

export default FilterBar;
