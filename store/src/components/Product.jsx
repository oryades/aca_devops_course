function Product({product, extraClass}) {
    return (
        <div className={'product ' + extraClass }>
            <div className="thumb"><img src={product.image} alt={product.title} title={product.title} /></div>
            <div className="name">{product.title}</div>
            <div className="price">Price: ${product.price}</div>
        </div>
    )
}

export default Product
