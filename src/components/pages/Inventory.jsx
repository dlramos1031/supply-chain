import { useState, useEffect } from 'react';
import axios from 'axios';

const Inventory = () => {
  const [products, setProducts] = useState([]);
  useEffect(() => {
    // Fetch products
    const fetchProducts = async () => {
      try {
        const response = await axios.get('http://localhost:5000/api/products'); // Adjust API endpoint as necessary
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
            <th className="p-2 border-b">Description</th>
            <th className="p-2 border-b">Unit Price</th>
            <th className="p-2 border-b">Quantity</th>
          </tr>
        </thead>
        <tbody>
          {products.map(product => (
            <tr key={product.scm_product_ID} className="text-gray-700">
              <td className="p-2 border-b">{product.scm_product_ID}</td>
              <td className="p-2 border-b">{product.product_name}</td>
              <td className="p-2 border-b">{product.description}</td>
              <td className="p-2 border-b">{product.unit_price}</td>
              <td className="p-2 border-b">{product.quantity_available}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Inventory;