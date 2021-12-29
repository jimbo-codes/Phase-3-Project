import '../App.css';
import React,{useState,useEffect} from "react";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import NavBar from './NavBar';
import About from './About';
import ProductHome from './ProductHome';
import User from './User';
import CryptoPage from './CryptoPage';
import Global from './Global';

function App() {
const [auth, setAuth] = useState(false);
const [name, setName] = useState('');
const [email, setEmail] = useState('');
const [home, setHome] = useState(true);
const [about, setAbout] = useState(false);
const [table, setTable] = useState([]);
const [global, setGlobal] = useState({name:'loading'});
const [trend, setTrend] = useState(['loading']);

useEffect(() => {
  fetch('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
  .then(r=>r.json())
  .then(data=> {setTable(data);console.log(data)})
  .catch(error=> {
    console.log(error)})
},[])
useEffect(() => {
  fetch('https://api.coingecko.com/api/v3/global')
  .then(r=>r.json())
  .then(data=> {setGlobal(data)})
  .catch(error=> {
    console.log(error)})
},[])
useEffect(() => {
  fetch('https://api.coingecko.com/api/v3/search/trending')
  .then(r=>r.json())
  .then(data=> {setTrend(data)})
  .catch(error=> {
    console.log(error)})
},[])

return (
 <Router>
   <div className='sticky top-0 z-50'>
      <NavBar auth={auth} name={name} email={email} setAbout={setAbout} about={about} home={home} setHome={setHome}/>
      {auth?<Global global={global}/>:null}
  </div>
    <Routes>  
      {/* Bottom level application with all core functionality */}
      <Route path="app/*" element={<CryptoPage trend={trend} global={global} name={name} table={table}/>}/>

      {/* This is the user input form */}
      <Route path="user/*" element={<User name={name} setName={setName} email={email} setEmail={setEmail} setAuth={setAuth}/>}/>

      {/* This is the about page */}
      <Route path='about' element={<About/>}/>      
      
      {/* This is our "homepage"*/}
        <Route path="crypto-project-p2" element={<ProductHome home={home} about={about} setHome={setHome} setAbout={setAbout}/>}/>
      </Routes>
      {/* Routes replaces Switch in react-router-dom v6. */}
  </Router>  
  );
}
export default App;
