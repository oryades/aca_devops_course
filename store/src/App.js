import {
  BrowserRouter,
  Routes,
  Route
} from "react-router-dom";

import Layout from "./components/Layout";
import Home from "./components/Home";
import Catalog from "./components/Catalog";
import Product from "./components/Product";
import Contacts from "./components/Contacts";

import Store from "./store";

function App() {

  return (
    <Store>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Layout/>}>

            <Route index element={<Home/>}></Route>

            <Route path="/catalog" element={<Catalog />}></Route>
            <Route path="/product:id" element={<Product />}></Route>
            <Route path="/contacts" element={<Contacts />}></Route>

          </Route>
        </Routes>
      </BrowserRouter>
    </Store>
  );
}

export default App;
