import React, {createContext, useContext, useReducer} from 'react'
import reducer from './reducer'

const initialState = {
    user: {
        username: '',
        email: '',
        role: 'member',
    },
    categories: [],
    products:[]
};


export const Context = createContext(initialState);

export const useStore = () => useContext(Context);


const Store = ( {children} ) => {
    const [state, dispatch] = useReducer(reducer, initialState);
    return (
        <Context.Provider value={{state, dispatch}}>
            {children}
        </Context.Provider>
    );
};

export default Store;