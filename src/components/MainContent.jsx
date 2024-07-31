import { Route, Routes } from 'react-router-dom';
import Dashboard from './pages/Dashboard';
import Inventory from './pages/Inventory';

const Settings = () => <div>Settings Page</div>;
const Profile = () => <div>Profile Page</div>;

const MainContent = () => {
  return (
    <div className="flex-1 p-4">
      <Routes>
        <Route path="/" element={<Dashboard />} />
        <Route path="/inventory" element={<Inventory />} />
        <Route path="/settings" element={<Settings />} />
        <Route path="/profile" element={<Profile />} />
      </Routes>
    </div>
  );
};

export default MainContent;
