import { useState, useEffect } from 'react';
import axios from 'axios';

const InventoryTable = () => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    // Fetch products
    const fetchProducts = async () => {
      try {
        const response = await axios.get('http://localhost:5000/api/product/types/All'); // Adjust API endpoint as necessary
        setProducts(response.data);
        console.log(response.data);
      } catch (error) {
        console.error('Error fetching products', error);
      }
    };
    fetchProducts();
  }, []);

  return (
    <div className="p-4">
      <table className="min-w-full bg-white border border-gray-300">
        <thead>
          <tr className="bg-gray-700 text-white">
            <th className="p-2 border-b">ID</th>
            <th className="p-2 border-b">Name</th>
            <th className="p-2 border-b">Type</th>
            <th className="p-2 border-b">Description</th>
            <th className="p-2 border-b">Unit Price</th>
            <th className="p-2 border-b">Quantity</th>
          </tr>
        </thead>
        <tbody>
          {products.map(product => (
            <tr key={product.product_id} className="text-gray-700">
              <td className="p-2 border-b">{product.product_id}</td>
              <td className="p-2 border-b">{product.name}</td>
              <td className="p-2 border-b">{product.type}</td>
              <td className="p-2 border-b">{product.description}</td>
              <td className="p-2 border-b">${product.unit_price}</td>
              <td className="p-2 border-b">{product.qty}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default InventoryTable;
