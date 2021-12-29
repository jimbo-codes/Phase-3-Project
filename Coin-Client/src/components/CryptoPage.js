import React,{useState} from "react";
import SearchBar from "./SearchBar";
import ProjectDetail from "./ProjectDetail";
import CryptoList from './CryptoList';
import { Route, Routes } from "react-router";
import TopMovers from "./TopMovers";

function CryptoPage({name, table, global, trend }) {
    const [detail, setDetail] = useState([]);
    const [searchContent, setSearch] = useState('');

    function round(price){
        if(price>100){
            return Math.round(price,0)
         }else if(price>2){
            return price.toFixed(2)
         }else if(price===1){
            return price.toFixed(1)
         }else if(price<0.001){
            return price.toFixed(6)
         }
         else if(price>0){
            return price.toFixed(4)
         }
    }
    return (      
        <div>
            <SearchBar searchContent={searchContent} setSearch={setSearch}/>
            <Routes>
                <Route path=":id" element={<ProjectDetail detail={detail} setDetail={setDetail}/>} />
            </Routes>
            <TopMovers round={round} trend={trend}/>
            <CryptoList round={round} table={table}/>
        </div>
      );
    }
export default CryptoPage;