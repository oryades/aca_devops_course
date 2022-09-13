import React, { useEffect } from "react";
import { useStore } from "../store";
import Product from "./Product";

function Catalog() {
  const store = useStore();

  useEffect(() => {
    /* Fetch product categories and set them to state.categories */
    fetch("https://fakestoreapi.com/products/categories")
      .then((res) => res.json())
      .then((data) => {
        store.dispatch({ type: "LOAD_CATEGORIES", payload: data });
      })
      .catch((err) => console.log(err.message));
  }, [store]);

  return (
    <div className="categories">
      {store.state.categories.map((category, index) => {
        return (
          <div className="category" key={"c_" + index}>
            <div className="title">{category}</div>
            <div className="category-products">
              {store.state.products
                .filter((product) => product.category === category)
                .map((product) => (
                  <Product
                    key={product.id}
                    product={product}
                    extraClass={"preview"}
                  />
                ))
                .slice(0, 3)}
            </div>
          </div>
        );
      })}
    </div>
  );
}

export default Catalog;
