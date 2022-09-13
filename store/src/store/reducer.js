
function reducer( state, action ) {
    
    // Actions with state.products ......................................................../
    switch ( action.type ) {

        case 'LOAD_PRODUCTS': 
          return {
              ...state,
              products: action.payload
          }

        case 'LOAD_CATEGORIES': 
          return {
              ...state,
              categories: action.payload
          }

        case 'ADD_PRODUCT': 
          return {
              ...state,
              products: state.products.push( action.payload )
          }
      
        case 'UPDATE_PRODUCT': 
            return {
                ...state,
                products: state.products.map( product => {
                    if ( action.payload.id === product.id ) {
                        return product = action.payload;
                    } 
                    return product
                })
            }

        case 'DELETE_PRODUCT':
            return {
                ...state,
                products: state.products.filter( product =>  !action.payload.id === product.id )
            }

    // Actions with state.user .........................................................../
        case 'UPDATE_USER': 
           return{
               ...state,
               user: {
                   ...state.user,
                   username: action.payload.username
               }
           }

        default: return state
    }
    
}

export default reducer
