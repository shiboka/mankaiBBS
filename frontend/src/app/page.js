import { NavBar } from '@/components/NavBar';
import './style.css';

export default function Home() {
  return (
    <>
      <NavBar/>
      <div className="homeText">
        <h1>mankaiBBS</h1>
      </div>
    </>
  );
}
