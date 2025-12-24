import ExpoCard from "@/components/ExpoCard";
import FilterBar from "@/components/FilterBar";
import styles from "./page.module.css";

const DUMMY_EXPOS = [
  {
    id: 1,
    title: "비비드블랑 초대전",
    date: "2025.12.27(토) - 12.28(일)",
    location: "서울 강남구 논현동 111-19 (비비드블랑 청담점)",
    status: "진행중",
    imageUrl: "https://images.unsplash.com/photo-1519741497674-611481863552",
  },
  {
    id: 2,
    title: "웨덱스 코엑스마곡 웨딩박람회",
    date: "2025.12.27(토) - 12.28(일)",
    location: "서울 강서구 마곡중앙5로 161 (코엑스마곡)",
    status: "입장권",
    imageUrl: "https://images.unsplash.com/photo-1511795409834-ef04bbd61622",
  },
  {
    id: 3,
    title: "청량리 롯데백화점 대형 웨딩박람회",
    date: "2025.12.27(토) - 12.28(일)",
    location: "서울 동대문구 왕산로 214 (롯데백화점 청량리점 7층)",
    status: "상담중",
    imageUrl: "https://images.unsplash.com/photo-1519225495810-751783d9cfdd",
  },
  {
    id: 4,
    title: "용산 아이파크몰 대형 웨딩박람회",
    date: "2025.12.27(토) - 12.28(일)",
    location: "서울 용산구 한강대로23길 55 (용산 아이파크몰 4층)",
    status: "상담중",
    imageUrl: "https://images.unsplash.com/photo-1469334031218-e382a71b716b",
  }
];

export default function Home() {
  return (
    <div className={styles.main}>
      {/* Hero Section */}
      <section className={styles.hero}>
        <div className="container animate-fade-in">
          <h1 className={styles.heroTitle}>
            완벽한 결혼 준비의 시작,<br />
            <span>웨딩박람회 가이드</span>와 함께
          </h1>
          <p className={styles.heroSubtitle}>
            전국에서 열리는 가장 핫한 웨딩박람회 소식을 가장 빠르게 전달해 드립니다.
          </p>
          <div className={styles.heroActions}>
            <button className="btn-primary">일정 확인하기</button>
            <button className={styles.btnSecondary}>혜택 더보기</button>
          </div>
        </div>
      </section>

      {/* Filter & List Section */}
      <FilterBar />

      <section className="container">
        <h2 className="section-title">진행 중인 <span>웨딩박람회</span></h2>
        <div className={styles.grid}>
          {DUMMY_EXPOS.map((expo) => (
            <ExpoCard key={expo.id} {...expo} />
          ))}
        </div>
      </section>
    </div>
  );
}
