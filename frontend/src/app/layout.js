import "./globals.css";

export const metadata = {
  title: "mankaiBBS",
  description: "mankaiBBS frontend",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
