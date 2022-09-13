import React, {useEffect} from 'react';
import {useStore} from '../store';
import Product from './Product';


function Home() {
    
    const store = useStore();

    useEffect(() => {

        /* Fetch products and set them to state.products */
        fetch('https://fakestoreapi.com/products')
        .then( res => res.json() )
        .then( data => {
            store.dispatch( {type: 'LOAD_PRODUCTS', payload: data} )
        })
        .catch( err => console.log( err.message ) );

    }, [store]);


    return (
        <div className="products">
            { store.state.products.map( product => {
                return( <Product key={product.id} product={product}/>)
            }) }
        </div>
    )
}

export default Home
