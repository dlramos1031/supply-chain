import { useState, useEffect } from 'react';
import axios from 'axios';

const Orders = () => {
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    // Fetch orders
    const fetchOrders = async () => {
      try {
        const response = await axios.get('http://localhost:5000/api/orders'); // Adjust API endpoint as necessary
        setOrders(response.data);
        console.log(response.data);
      } catch (error) {
        console.error('Error fetching orders', error);
      }
    };
    fetchOrders();
  }, []);

  return (
    <div className="p-4">
      <table className="min-w-full bg-white border border-gray-300">
        <thead>
          <tr className="bg-gray-700 text-white">
            <th className="p-2 border-b">ID</th>
            <th className="p-2 border-b">Name</th>
            <th className="p-2 border-b">Order Date</th>
            <th className="p-2 border-b">Quantity Ordered</th>
          </tr>
        </thead>
        <tbody>
          {orders.map(order => (
            <tr key={order.scm_order_ID} className="text-gray-700">
              <td className="p-2 border-b">{order.scm_order_ID}</td>
              <td className="p-2 border-b">{order.customer_name}</td>
              <td className="p-2 border-b">{order.order_date}</td>
              <td className="p-2 border-b">{order.quantity_ordered}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Orders;
