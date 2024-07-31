import { NavLink } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div className="bg-gray-700 text-white h-screen w-64 p-4">
      <nav>
        <ul>
          <li>
            <NavLink to="/" className="block p-2 rounded hover:bg-gray-600">Dashboard</NavLink>
          </li>
          <li>
            <NavLink to="/inventory" className="block p-2 rounded hover:bg-gray-600">Inventory</NavLink>
          </li>
          <li>
            <NavLink to="/orders" className="block p-2 rounded hover:bg-gray-600">Orders</NavLink>
          </li>
          <li>
            <NavLink to="/profile" className="block p-2 rounded hover:bg-gray-600">Profile</NavLink>
          </li>
        </ul>
      </nav>
    </div>
  );
};

export default Sidebar;
