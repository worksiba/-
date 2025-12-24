import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Header, Footer } from "@/components/LayoutComponents";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "웨딩박람회 가이드 - 한눈에 보는 결혼 준비 정보",
  description: "전국 웨딩박람회 일정, 장소 정보를 확인하고 무료초대권을 실시간으로 신청하세요.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko">
      <body className={inter.className}>
        <Header />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  );
}
