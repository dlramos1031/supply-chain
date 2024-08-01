import { Route, Routes } from 'react-router-dom';
import Dashboard from './pages/Dashboard';
import Inventory from './pages/Inventory';
import Orders from './pages/Orders';

const Profile = () => <div>Profile Page</div>;

const MainContent = () => {
  return (
    <div className="flex-1 p-4">
      <Routes>
        <Route path="/"           element={<Dashboard />} />
        <Route path="/inventory"  element={<Inventory />} />
        <Route path="/orders"     element={<Orders />} />
        <Route path="/profile"    element={<Profile />} />
      </Routes>
    </div>
  );
};

export default MainContent;
