import { Link } from 'react-router-dom';
function CryptoData({name,price,dodChg, mktCap, mktCapRank, id, maxSupply, volume, index, image, round}) {

// formatting numbers.
price= round(price)
price = price.toLocaleString("en-US");
mktCap = mktCap.toLocaleString("en-US");
volume = volume.toLocaleString('en-US');
dodChg = dodChg.toFixed(2)
if(maxSupply){
    maxSupply = Math.round(maxSupply)
    maxSupply = maxSupply.toLocaleString("en-US")
}

return (      
    <tr className="hover:bg-white">
      <td className="px-1 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{index}.</td>
      <td className="px-0 py-4 whitespace-nowrap text-sm font-medium text-blue-600 underline"><img className="float-left w-6 pr-1" src={image} alt={name}/><Link to={`/app/${id}`} onClick={()=>{window.scrollTo(0, 0)}}>{name}</Link></td>
      <td className="px-2 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${price}</td>
      {/* conditional formatting based on the band of price, ex how many decimals to show. */}
{dodChg<0?<td className="px-2 py-4 whitespace-nowrap text-sm font-medium text-gray-900" style={{color: "red",}}> {dodChg}%</td>:<td className="px-2 py-4 whitespace-nowrap text-sm font-medium text-gray-900" style={{color: 'green'}}>{dodChg}%</td>}
      <td className="px-4 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${mktCap}</td>
      <td className="px-4 py-4 whitespace-nowrap text-sm font-medium text-left text-gray-900">{maxSupply?maxSupply:"N/A"}</td>
      <td className="px-4 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${volume}</td>
      <td className="px-4 py-4 whitespace-nowrap text-sm text-center font-medium text-gray-900">{mktCapRank}</td>
      <td><Link to={`/app/${id}`} onClick={()=>{window.scrollTo(0, 0)}} className="relative inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Inspect</Link></td>
    </tr>
      );
    }
    
export default CryptoData;
